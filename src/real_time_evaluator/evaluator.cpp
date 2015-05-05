#include "evaluator.h"

vector<unsigned long long> calculateRTCoverSig(vector<unsigned long long> &histogram, unsigned int deadline){
	vector<unsigned long long int> faddrAccRT; //accumulated chance to meet the real time deadline
	unsigned int i, j, done;
	int frames_to_end;

	faddrAccRT.resize(CONFIG_SIZE+1);

	for(i=min_idx; i<=max_idx; i++){
		faddrAccRT[i] = 0;
		done = 0;
		for(j=i; j<=max_idx; j++){
			if((j+1-i)*FRAME_CYCLES + FRAME_CYCLES + CMD_CYCLES <= deadline)
				faddrAccRT[i] += histogram[j];
			else {
				done = 1;
				break;
			}
		}
		if(done){
			continue;
		}
		frames_to_end = max_idx - i + 1;
		for(j=min_idx; j<i; j++){
			if(((frames_to_end + (j-min_idx+1))*FRAME_CYCLES + 2*FRAME_CYCLES + 2*CMD_CYCLES) <= deadline)
				faddrAccRT[i] += histogram[j];
			else {
				break;
			}
		}
	}

	/*for(i=0; i<min_idx; i++)
		faddrMTTR[i] = faddrMTTR[BEST_STATIC_OUT];
	for(i=max_idx+1; i<CONFIG_SIZE; i++)
		faddrMTTR[i] = faddrMTTR[BEST_STATIC_OUT];*/

	faddrAccRT[TOTAL_HITS] = histogram[TOTAL_HITS];

	return faddrAccRT;
}

void calculateRTCovers(tableType &signatureTable, unsigned int deadline){
	tableType::iterator it;

	//replaces the histogram with an indication of RT coverage for each possible starting frame
	for(it = signatureTable.begin(); it != signatureTable.end(); it++)
		signatureTable[it->first] = calculateRTCoverSig(it->second, deadline);
}

unsigned surferTable(const vector<bool> &signature, transTableType &transTable, vector<vector<unsigned> > &compTable){
	vector<bool> compSig;
	int i, j;

	compSig.resize(compTable.size());
	for(i=0; i<compSig.size(); i++){
		compSig[i] = false;
		for(j=0; j<compTable[i].size(); j++)
			compSig[i] = compSig[i] | signature[compTable[i][j]];
	}

	if(transTable.count(compSig))
		return transTable[compSig];

	return bestStaticOut;
}

void calculateAvgRTCover(tableType &signatureTable, transTableType &transTable, vector<vector<unsigned> > &compTable,
			unsigned int deadline, unsigned int mttrTable){
	tableType::iterator it;
	unsigned long long accRTCover = 0;
	FILE *hits, *rtCover;
	char filename[64];

	if(mttrTable){
		hits = fopen("evalHits_MTTRTable.txt", "a");
		sprintf(filename, "evalRT_MTTRTable_coverage_%06d.txt", deadline);
		rtCover = fopen(filename, "a");
	} else {
		hits = fopen("evalHits.txt", "a");
		sprintf(filename, "evalRT_coverage_%06d.txt", deadline);
		rtCover = fopen(filename, "a");
	}
	printf("sigtable.size: %d\n", (int) signatureTable.size());

	//calculates the total RT coverage for all signatures, according the the starting frame chosen by the translation table
	for(it = signatureTable.begin(); it != signatureTable.end(); it++)
		accRTCover += it->second[faddr2Idx(surferTable(it->first, transTable, compTable))];

	printf("Acc RT Cover: %llu, %d\n", accRTCover, signatureCnt);
	printf("RT Cover: %f\n", (double) accRTCover / (double) signatureCnt);
	fprintf(rtCover, "%llu\n", accRTCover);
	fprintf(hits, "%d\n", signatureCnt);
	fclose(rtCover);
	fclose(hits);
}

int main(int argc, char *argv[]){
	tableType signatureTable;
	transTableType transTable, transTableMTTR;
	vector<vector<unsigned> > compTable, compTableMTTR;
	int i, deadline, scaled_deadline;
	double delay1_CG, delay2_FG, occup;
	double total_time, comp_time;

	if(argc < 6){
		printf("Use %s <input_sig_file> <input_table_RT> <input_table_MTTR> <sig_size_internal> <sig_size_po>\n", argv[0]);
		printf("or %s <input_sig_file> <input_table_RT> <input_table_MTTR> <sig_size_internal> <sig_size_po> -s <d1> <d2> <o>\n", argv[0]);
		exit(0);
	}

	sig_size_internal = atoi(argv[4]);
	sig_size_po = atoi(argv[5]);

	for(i=strlen(argv[2]); i>0; i--) //finds the last _ in the table name
		if(argv[2][i] == '_')
			break;

	if(argv[2][i] != '_'){
		printf("Unable to find deadline specification in %s\n", argv[2]);
		exit(0);
	} else {
		deadline = atoi(&argv[2][i+1]);
		printf("Deadline: %d cycles\n", deadline);
		if(deadline == 0){
			printf("skipping this execution! deadline == 0\nThis is expected to happen...\n");
			exit(0);
		}
	}

	//Handles scaled deadline operation mode
	if(argc == 10){
        if(strcmp("-s", argv[6]) == 0){
            delay1_CG=atof(argv[7]);
            delay2_FG=atof(argv[8]);
            occup=atof(argv[9]);

            total_time = ((double) deadline) / (1.0 - occup);
            comp_time = total_time - deadline;
            scaled_deadline = floor( total_time - comp_time*(delay2_FG/delay1_CG) );
            printf("Deadline %d scaled to %d\n", deadline, scaled_deadline);
            if(scaled_deadline <= 0){ //a negative scaled deadline means we cannot use this circuit for this application (i.e., it is too slow)
                scaled_deadline = 1;
                printf("Negative scaled deadline! We cannot use this circuit\n");
            }

        } else {
            printf("Parameter mismatch: expected -s\n");
            exit(0);
        }
	} else {
        scaled_deadline = deadline;
	}

	parseTable(argv[2], transTable, compTable);
	parseTable(argv[3], transTableMTTR, compTableMTTR);
	parseInfile(argv[1], signatureTable);
	calculateRTCovers(signatureTable, scaled_deadline);
	calculateAvgRTCover(signatureTable, transTable, compTable, deadline, 0);
	calculateAvgRTCover(signatureTable, transTableMTTR, compTableMTTR, deadline, 1);
}
