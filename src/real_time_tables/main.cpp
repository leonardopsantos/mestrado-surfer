/**********************************************************
 *
 * Fault signature analyzer
 * by Gabriel Luca Nazar <glnazar@inf.ufrgs.br>
 * Reads fine-grained fault signatures and builds the SURFER table
 *
***********************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <map>
#include <vector>
#include "parse.h"
#include "print.h"
#include "statistics.h"
#include "dumb.h"
#include "buildTable.h"

using namespace std;


/*********************************************************************************************************************/

int main(int argc, char *argv[]){
	tableType signatureTable;
	faddr2signsType faddr2signs;
	int i, last_slash;
	char circname[64];
	unsigned int best_static_out, best_static_out_MTTR; //the best Faddr for those signatures not in the table
	FILE* circNamesFile;
	int deadline, scaled_deadline, step = 1000;
	double delay1_CG, delay2_FG, occup;
	double total_time, comp_time;

	faddr2signsType faddr2signsMTTR;
	list<set<unsigned int> > groupedBits, groupedBitsMTTR;

	faddr2signsType compF2S, compF2SMTTR;

	map<int, unsigned int> bastStaticBySlack;

	if(argc < 5){
		printf("Use %s <input_file> <sig_size_internal> <sig_size_po> <sign_threshold> <options>\n", argv[0]);
		printf("Options:\n");
		printf("-m: Use only major addresses\n");
		printf("-x: Use XOR to compress the signature (default: OR)\n");
		printf("-p: Generates the partially compressed obtained at each iteration of the dumb heuristic\n");
		printf("-t: Trim the configuration area\n");
		printf("-d <n>: Use dumb heuristics to generate a table with at most n-bit input\n");
		printf("-s <d1> <d2> <o>: Scale deadline according to circuit delays d1 (ref system: CG)\n");
		printf("     and d2 (RT system: FG) and occupation factor o");
		printf("-l: Create tables by best static deadlines\n");
		exit(0);
	}

	for(i=0; i<OPT_CNT; i++)
		options[i] = false;

	for(i=5; i<argc; i++){
		switch(strlen(argv[i])){
			case 2:
				if(strstr(argv[i], "-m")){
					options[OPT_ONLY_MAJOR] = true;
					continue;
				}
				if(strstr(argv[i], "-d")){
					options[OPT_DUMB] = true;
					if(i==argc-1 || (dumbMaxSigSize = atoi(argv[++i])) == 0) {
						printf("-d requires a maximum compressed signature size != 0 to be specified\n");
						return 0;
					}
					continue;
				}
				if(strstr(argv[i], "-x")){
					options[OPT_XOR_COMPRESS] = true;
					continue;
				}
				if(strstr(argv[i], "-f")){
					options[OPT_FILL_BITS] = true;
					continue;
				}

				if(strstr(argv[i], "-p")){
					options[OPT_PARTIAL_TABLES] = true;
					continue;
				}

				if(strstr(argv[i], "-t")){
					options[OPT_TRIM_AREA] = true;
					continue;
				}

				if(strstr(argv[i], "-s")){
					options[OPT_SCALE_DEADLINE] = true;
					if(i>=argc-3) {
						printf("-s two delays and an occupation factor\n");
						return 0;
					}
					delay1_CG=atof(argv[++i]);
					delay2_FG=atof(argv[++i]);
					occup=atof(argv[++i]);
					continue;
				}

				if(strstr(argv[i], "-l")){
					options[OPT_BEST_STATIC_SLACKS] = true;
					continue;
				}

				printf("Unknown option: %s\n", argv[i]);
				return 0;
		}
	}

	if(options[OPT_PARTIAL_TABLES] && !options[OPT_DUMB]){
		printf("-p can only be used with -d\n");
		exit(0);
	}

	sig_size_internal = atoi(argv[2]);
	sig_size_po = atoi(argv[3]);
	cut_threshold = atoi(argv[4]);

	printf("Internal: %d - bytes: %d\n", sig_size_internal, SIG_SIZE_INT_BYTES);
	printf("PO: %d - bytes: %d\n", sig_size_po, SIG_SIZE_PO_BYTES);

	if(cut_threshold == 0){
		cut_threshold = signatureCnt / 100000;
		if(cut_threshold == 0)
			cut_threshold = 1;
	}

	parseInfile(argv[1], signatureTable);

	printf("Got %d signatures\n", (int) signatureTable.size());
	printf("Min IDX: %d, Max IDX: %d\n", min_idx, max_idx);

	last_slash = -1;
	for(i=0; argv[1][i] != 0; i++)
		if(argv[1][i] == '/')
			last_slash = i;

	for(i=last_slash+1; argv[1][i] != 0 && argv[1][i] != '.'; i++)
		circname[i-last_slash-1] = argv[1][i];

	circname[i-last_slash-1] = 0;

	circNamesFile = fopen("circNamesFile.txt", "a");
	fprintf(circNamesFile, "%s\n", circname);
	fclose(circNamesFile);


	buildTable(signatureTable, faddr2signsMTTR, &best_static_out_MTTR);
	if(options[OPT_DUMB])
		buildDumb(circname, signatureTable,  faddr2signsMTTR, compF2SMTTR, best_static_out_MTTR, 0, 0, groupedBitsMTTR);

	for(deadline=1000; deadline<=60000; deadline += step){
		if(deadline == 10000)
			step = 10000;

		if(options[OPT_SCALE_DEADLINE]){
		    total_time = ((double) deadline) / (1.0 - occup);
            comp_time = total_time - deadline;
            scaled_deadline = floor( total_time - comp_time*(delay2_FG/delay1_CG) );
            printf("Deadline %d scaled to %d\n", deadline, scaled_deadline);
            if(scaled_deadline <= 0){ //a negative scaled deadline means we cannot use this circuit for this application (i.e., it is too slow)
                scaled_deadline = 1;
                printf("Negative scaled deadline! We cannot use this circuit\n");
            }
		}

        if(options[OPT_SCALE_DEADLINE]){
            buildTableRT(signatureTable, faddr2signs, &best_static_out, scaled_deadline, deadline, 1);
            evalMTTR4RT(signatureTable, faddr2signsMTTR, compF2SMTTR, scaled_deadline, deadline, groupedBitsMTTR);
        } else {
            buildTableRT(signatureTable, faddr2signs, &best_static_out, deadline, deadline, 1);
            evalMTTR4RT(signatureTable, faddr2signsMTTR, compF2SMTTR, deadline, deadline, groupedBitsMTTR);
        }

        bastStaticBySlack[deadline] = best_static_out;

		//printVhdl(circname, faddr2signs, best_static_out);

		//buildInterbitRelations(faddr2signs, signatureTable);
		if(options[OPT_DUMB]){
            if(options[OPT_SCALE_DEADLINE])
                buildDumb(circname, signatureTable, faddr2signs, compF2S, best_static_out, scaled_deadline, deadline, groupedBits);
            else
                buildDumb(circname, signatureTable, faddr2signs, compF2S, best_static_out, deadline, deadline, groupedBits);
		}
	}

    if(options[OPT_BEST_STATIC_SLACKS]) {

    	char filename[64];

    	snprintf(filename, 64, "%s_slacks_deadlines.txt", circname);

    	circNamesFile = fopen(filename, "a");
    	for(map<int, unsigned int>::const_iterator iter=bastStaticBySlack.begin();
    			iter!=bastStaticBySlack.end(); ++iter) {
    		fprintf(circNamesFile, "%d %d\n", iter->first, iter->second);
    		printf("slack %d = %d\n", iter->first, iter->second);
    	}
    	fclose(circNamesFile);

    	bStaticPrintVHDL(circname, bastStaticBySlack);
    }
}

