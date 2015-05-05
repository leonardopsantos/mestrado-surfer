
#include "parse.h"

using namespace std;

unsigned int max_idx = 0;
unsigned int min_idx = 1000000;
unsigned int first_maj=0;
unsigned int sig_size_internal;
unsigned int sig_size_po;
unsigned int cut_threshold;
unsigned int signatureCnt;
unsigned int bestStaticOut;
unsigned int discard_invalid=0, discard_before=0, discard_after=0;
bool options[OPT_CNT];

int check_error(struct error_sig_t *err) {
	int i, k;
	char letter = err->header.result & 0x7F;
	unsigned int valid;

	faddr2Idx(err->header.inj_faddr, &valid);
	if(!valid)
		return -1;

	if( err == NULL )
		return -1;

	if( letter != 'O' && letter != 'U' && letter != 'X' && letter != 'M' )
		return -1;

	k = 0;

	for(i = 0; i < SIG_SIZE_INT_BYTES; i++)
		if( err->sig_int[i] != 0 ){
			k = 1;
			break;
		}

	if(k == 0)
		for(i = 0; i < SIG_SIZE_PO_BYTES; i++)
			if( err->sig_po[i] != 0 ) {
				k = 1;
				break;
			}
	if(k == 0)
		return -1;

	return 0;
}

void addEntry(struct error_sig_t *e, tableType &signatureTable){
	vector<bool> signature;
	unsigned int i;
	unsigned int faddr_idx, valid;
	unsigned int unused_bits;

	faddr_idx = faddr2Idx(e->header.inj_faddr, &valid);
	if(!valid){
		discard_invalid++;
		return;
	}
	if(faddr_idx > max_idx) {
		discard_after++;
		return;
	}
	if(faddr_idx < min_idx){
		discard_before++;
		return;
	}

	signatureCnt++;
	signature.resize(SIG_SIZE);

	unused_bits = SIG_SIZE_PO_BYTES*8 - sig_size_po;
	for(i=0; i<8 - unused_bits; i++) //the first byte may not be completely occupied
		signature[SIG_SIZE-(i+1)] = (e->sig_po[0] & (0x80 >> (i + unused_bits))) ? true : false;

	for(i=8; i<SIG_SIZE_PO_BYTES*8; i++) //this may not execute (if sig_size_po <= 8)
		signature[SIG_SIZE-(i-unused_bits+1)] = (e->sig_po[i/8] & (0x80 >> (i%8))) ? true : false;

	unused_bits = SIG_SIZE_INT_BYTES*8 - sig_size_internal;
	for(i=0; i<8 - unused_bits; i++)
		signature[SIG_SIZE-(i+sig_size_po+1)] = (e->sig_int[0] & (0x80 >> (i + unused_bits))) ? true : false;

	for(i=8; i<SIG_SIZE_INT_BYTES*8; i++)
		signature[SIG_SIZE-(i+sig_size_po-unused_bits+1)] = (e->sig_int[i/8] & (0x80 >> (i%8))) ? true : false;

	if(signatureTable.count(signature) == 1){ //this signature appeared before
		signatureTable[signature][faddr_idx]++; //increment its appearance counter for this faddr
		signatureTable[signature][TOTAL_HITS]++; //increments the total appearances
	} else {
		vector<unsigned long long> newVec;
		newVec.resize(CONFIG_SIZE+1);
		for(i=0; i<CONFIG_SIZE; i++)
			newVec[i] = 0;
		newVec[faddr_idx] = 1;
		newVec[TOTAL_HITS] = 1; //the last position counts total occurrences
		signatureTable[signature] = newVec;
	}
}

void parseInfile(char *filename, tableType &signatureTable){
	struct error_sig_t error;
	FILE *fp;
	int bad = 0;
	int i, sz, j;

	fp = fopen(filename, "rb");
	if( fp == NULL ) {
		printf("Error opening %s for reading!\n", "error.bin");
		exit(0);
	}

	i = ftell(fp);
	fseek(fp, 0L, SEEK_END);
	sz = ftell(fp)-i;
	fseek(fp, i, SEEK_SET);

	printf("Found %d bytes, %f errors\n", sz, ((float)sz/ENTRY_SIZE));
	if( (sz%ENTRY_SIZE) != 0 ) {
		printf("OOps, file size is NOT an integer number of errors!\n");
	}

	error.sig_int = (int8_t*) malloc(SIG_SIZE_INT_BYTES);
	error.sig_po = (int8_t*) malloc(SIG_SIZE_PO_BYTES);

	j = 0;
	signatureCnt = 0;
	signatureTable.clear();

	printf("Parsing");
	while (1) {
		if(j++ == 25000){
			j = 0;
			printf(".");
			fflush(stdout);
		}
		i = fread(&(error.header), 1, sizeof(struct sig_header_t), fp);
		if( i != sizeof(struct sig_header_t) ) {
			break;
		}
		i = fread(error.sig_po, 1, SIG_SIZE_PO_BYTES, fp);
		i += fread(error.sig_int, 1, SIG_SIZE_INT_BYTES, fp);
		if( i != SIG_SIZE_PO_BYTES + SIG_SIZE_INT_BYTES) {
			printf("Error reading signature!\n");
			bad++;
			break;
			//exit(0);
		}
		if( check_error(&error) != 0 ){
			bad++;
			continue;
		}
		addEntry(&error, signatureTable);
	};
	if(options[OPT_ONLY_MAJOR]){ //min_idx is at the start of the column
		min_idx = faddr2Idx(idx2Faddr(min_idx) & 0xFFFFFF80);
		first_maj = (idx2Faddr(min_idx) >> 7) & 0x000000FF;
	}

	printf("done\n");
	printf("Valid entries: %d\n", signatureCnt);
	printf("Discard before: %d; discard after: %d; discard invalid %d\n", discard_before, discard_after, discard_invalid);
	printf("Bad signatures: %d\n", bad);

	free(error.sig_int);
	free(error.sig_po);
	fclose(fp);
	return;
}

void parseTable(char *filename, transTableType &transTable, vector<vector<unsigned> > &compTable){
	FILE *table;
	char buf[4096];
	char *ret;
	unsigned compSigSize;
	int i, ret_fscanf;
	vector<bool> newSig;
	vector<unsigned> newGroup;

	table = fopen(filename, "r");

	ret_fscanf = fscanf(table, "%d\n", &min_idx);
	ret_fscanf = fscanf(table, "%d\n", &max_idx);
	ret_fscanf = fscanf(table, "%d\n", &compSigSize);
	ret_fscanf = fscanf(table, "%d\n", &bestStaticOut);

	transTable.clear();
	newSig.resize(compSigSize);

	ret = fgets(buf, 4096, table);
	while(buf[0] != '#'){
		for(i=0; i<compSigSize; i++)
			newSig[i] = (buf[i] == '1');
		transTable[newSig] = atoi(buf + compSigSize + 1);
		ret = fgets(buf, 4096, table);
	}

	compTable.clear();
	ret = fgets(buf, 4096, table);

	while(buf[0] != '#'){
		i=0;
		newGroup.clear();
		while(buf[i] != '\n'){
			while(buf[i] == ' ') i++;
			newGroup.push_back(atoi(buf + i));
			while(buf[i] != ' ' && buf[i] != '\n') i++;
		}
		compTable.push_back(newGroup);
		ret = fgets(buf, 4096, table);
	}
}

