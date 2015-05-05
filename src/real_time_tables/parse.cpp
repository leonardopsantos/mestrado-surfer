
#include "parse.h"

using namespace std;

unsigned int max_idx = 0;
unsigned int min_idx = 1000000;
unsigned int first_maj=0;
unsigned int sig_size_internal;
unsigned int sig_size_po;
unsigned int cut_threshold;
unsigned int signatureCnt;
bool options[OPT_CNT];

int check_error(struct error_t *err) {
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

void addEntry(struct error_t *e, tableType &signatureTable, vector<unsigned> &bitHist){
	vector<bool> signature;
	unsigned int i;
	unsigned int faddr_idx, valid;
	unsigned int unused_bits;
	
	faddr_idx = faddr2Idx(e->header.inj_faddr, &valid);
	if(!valid)
		return;
	if(faddr_idx > max_idx)
		max_idx = faddr_idx;
	if(faddr_idx < min_idx)
		min_idx = faddr_idx;
	
	if(e->header.result & 0x80) //it's a new bit!
		bitHist[faddr_idx]++;
	
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
	
	//DEBUG BEGIN
	/*unsigned char hasOne = 0;
	for(i=0; i<signature.size(); i++)
		if(signature[i]){
			hasOne = 1;
			break;
		}
	if(!hasOne){
		printf("At parser: does not have one!\nINT:\n");
		for(i = 0; i < SIG_SIZE_INT_BYTES; i++)
			printf("%03d : 0x%X\n", i, (unsigned char) e->sig_int[i]);
		printf("PO:\n");
		for(i = 0; i < SIG_SIZE_PO_BYTES; i++)
			printf("%03d : 0x%X\n", i, (unsigned char) e->sig_po[i]);
	}*/
	//DEBUG END
			
	if(signatureTable.count(signature) == 1){ //this signature appeared before
		signatureTable[signature][faddr_idx]++; //increment its appearance counter for this faddr
		signatureTable[signature][TOTAL_HITS]++; //increments the total appearances
	} else {
		vector<unsigned int> newVec;
		newVec.resize(CONFIG_SIZE+1);
		for(i=0; i<CONFIG_SIZE; i++)
			newVec[i] = 0;
		newVec[faddr_idx] = 1;
		newVec[TOTAL_HITS] = 1; //the last position counts total occurrences
		signatureTable[signature] = newVec;
	}
}

unsigned int findFirst(vector<unsigned> &histogram){
	int i, j;
	bool allActive;
	
	for(i=0; i<CONFIG_SIZE-(START_WINDOW_SIZE-1); i++){
		allActive = true;
		for(j=0; j<START_WINDOW_SIZE; j++)
			if(histogram[i+j] < ACTIVE_THRESHOLD){
				allActive = 0;
				break;
			}
		if(allActive)
			return i;
	}
}

void parseInfile(char *filename, tableType &signatureTable){
	//struct file_header_t outf_header;
	//struct error_t error[SIG_PER_BIT];
	struct error_t error;
	FILE *fp;
	int bad = 0;
	int i, sz, j, rdBytes = 0;
	//int under20 = 0, bit_cnt = 0, bit_evs = 0;
	bool isUnder = false;
	vector<unsigned> bitHist;

	fp = fopen(filename, "rb");
	if( fp == NULL ) {
		printf("Error opening %s for reading!\n", filename);
		exit(0);
	}

	//rdBytes = fread(&outf_header, 1, 12, fp);
	/*rdBytes = fread(&outf_header, 1, sizeof(outf_header), fp);
	if( rdBytes != sizeof(outf_header) ) {
		printf("OOps, could not read the file header\n");
		goto ex_it;
	}*/

	rdBytes = ftell(fp);
	fseek(fp, 0L, SEEK_END);
	sz = ftell(fp)-rdBytes;
	fseek(fp, rdBytes, SEEK_SET);

	printf("Found %d bytes, %f errors\n", sz, ((float)sz/ENTRY_SIZE));
	if( (sz%ENTRY_SIZE) != 0 ) {
		printf("OOps, file size is NOT an integer number of errors!\n");
	}
	
	error.sig_int = (int8_t*) malloc(SIG_SIZE_INT_BYTES);
	error.sig_po = (int8_t*) malloc(SIG_SIZE_PO_BYTES);

	bitHist.resize(CONFIG_SIZE);
	for(i=0; i<CONFIG_SIZE; i++)
		bitHist[i] = 0;

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
		addEntry(&error, signatureTable, bitHist);
		signatureCnt++;		
	};
	
	if(options[OPT_TRIM_AREA]){
		unsigned int remCnt, erased = 0, erasedEntries = 0;
		tableType::iterator it;
		min_idx = findFirst(bitHist);
		for(it = signatureTable.begin(); it != signatureTable.end(); it++){
			remCnt = 0;
			for(i=0; i<min_idx; i++){
				remCnt += it->second[i];
				it->second[i] = 0;
			}
			erasedEntries += remCnt;
			it->second[TOTAL_HITS] -= remCnt;
			if(it->second[TOTAL_HITS] == 0){
				//signatureTable.erase(it->first);
				erased++;
			}
		}
		printf("Erased %d signatures due to trimming.\n", erased);
		printf("Erased %d entries due to trimming.\n", erasedEntries);
	}
	
	if(options[OPT_ONLY_MAJOR]){ //min_idx is at the start of the column
		min_idx = faddr2Idx(idx2Faddr(min_idx) & 0xFFFFFF80);
		first_maj = (idx2Faddr(min_idx) >> 7) & 0x000000FF;
	}
		
	printf("done\n");
	//printf("Bits: %d - <%d: %d -  Avg. sig/bit: %f\n", bit_cnt, SIG_PER_BIT, under20, ((double) signatureCnt) / ((double) bit_cnt));
	printf("Valid entries: %d\n", signatureCnt);
	printf("Bad signatures: %d\n", bad);
	
	free(error.sig_int);
	free(error.sig_po);
	fclose(fp);
	return;
}

