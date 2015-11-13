
#include "buildTable.h"

//#define PRINT_HISTOGRAMS 1

/*********************************************************************************************************************/

unsigned int bestFAddr(vector<unsigned int> &histogram, unsigned long long int *best_mttr, vector<unsigned long long int> &accMTTR){
	vector<unsigned long long int> faddrMTTR;
	unsigned int i, j, retVal, k=first_maj;
	int frames_to_end;

	faddrMTTR.resize(CONFIG_SIZE);

	for(i=min_idx; i<=max_idx; i++){
		faddrMTTR[i] = 0;
		for(j=i; j<=max_idx; j++)
			faddrMTTR[i] += histogram[j] * ((j+1-i)*FRAME_CYCLES + FRAME_CYCLES + CMD_CYCLES);
		frames_to_end = max_idx - i + 1;
		for(j=min_idx; j<i; j++)
			faddrMTTR[i] += histogram[j] * ((frames_to_end + (j-min_idx+1))*FRAME_CYCLES + 2*FRAME_CYCLES + 2*CMD_CYCLES);
		accMTTR[i] += faddrMTTR[i];
		if(options[OPT_ONLY_MAJOR])
			i += maxMinPerMaj[k++];
	}

	retVal = min_idx;
	for(i=min_idx+1; i<=max_idx; i++)
		if(faddrMTTR[i] < faddrMTTR[retVal] && faddrMTTR[i] != 0)
			retVal = i;

	*best_mttr = faddrMTTR[retVal];

	return retVal;
}

/*********************************************************************************************************************/

unsigned int bestFAddrRT(vector<unsigned int> &histogram, unsigned long long int *best_accRT, vector<unsigned long long int> &accAccRT, unsigned int deadline){
	vector<unsigned long long int> faddrAccRT; //accumulated chance to meet the real time deadline
	unsigned int i, j, retVal, k=first_maj;
	int frames_to_end, done;

	faddrAccRT.resize(CONFIG_SIZE);

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
			accAccRT[i] += faddrAccRT[i];
			continue;
		}
		frames_to_end = max_idx - i + 1;
		for(j=min_idx; j<i; j++){
			if(((frames_to_end + (j-min_idx+1))*FRAME_CYCLES + 2*FRAME_CYCLES + 2*CMD_CYCLES) <= deadline)
				faddrAccRT[i] += histogram[j];
			else {
				done = 1;
				break;
			}
		}
		accAccRT[i] += faddrAccRT[i];
	}

	retVal = min_idx;
	for(i=min_idx+1; i<=max_idx; i++)
		if(faddrAccRT[i] > faddrAccRT[retVal])
			retVal = i;

	*best_accRT = faddrAccRT[retVal];

	return retVal;
}
/*********************************************************************************************************************/

unsigned int getCoverRT(vector<unsigned int> &histogram, unsigned int faddr, unsigned int deadline){
	unsigned int faddrAccRT = 0; //accumulated chance to meet the real time deadline
	unsigned int j;
	int frames_to_end, done;

	for(j=faddr; j<=max_idx; j++){
		if((j+1-faddr)*FRAME_CYCLES + FRAME_CYCLES + CMD_CYCLES <= deadline)
			faddrAccRT += histogram[j];
		else {
			return faddrAccRT;
		}
	}

	frames_to_end = max_idx - faddr + 1;
	for(j=min_idx; j<faddr; j++){
		if(((frames_to_end + (j-min_idx+1))*FRAME_CYCLES + 2*FRAME_CYCLES + 2*CMD_CYCLES) <= deadline)
			faddrAccRT += histogram[j];
		else {
			return faddrAccRT;
		}
	}

	return faddrAccRT;
}
/*********************************************************************************************************************/

void addFaddr(faddr2signsType &faddr2signs, unsigned int faddr, const vector<bool> &signature){
	if(faddr2signs.count(faddr)){ //if this faddr is already in the table
		//append the signature to the list
		faddr2signs[faddr].push_back(signature);
	} else {
		//create a new list and add it to the map
		list<vector<bool> > newList;
		newList.clear();
		newList.push_back(signature);
		faddr2signs[faddr] = newList;
	}
}

/*********************************************************************************************************************/
void buildTableRT(tableType &signatureTable, faddr2signsType &faddr2signs, unsigned int *best_static_out,
		  unsigned int scaled_deadline, unsigned int deadline, bool first_run){
	tableType::iterator it;
	unsigned int i, j = 0;
	vector<unsigned int> *histogram;
	unsigned long long int best_accRT;
	unsigned int best_static, best_faddr;
	unsigned long long acc_best_accRT = 0, acc_hits = 0;
	vector<unsigned long long int> accAccRT;
	FILE *zeroMTTR, *bestStaticMTTR, *accHitsFile, *perfectMTTR, *heuristcMTTR;
	char filename[100];
	int cnt=0;
	int monitoring = 0;

	accAccRT.resize(CONFIG_SIZE);
	for(i=0; i<CONFIG_SIZE; i++)
		accAccRT[i] = 0;

	faddr2signs.clear();

	printf("Calculating optimum SURFER faddrs for %d cycles", scaled_deadline);
	for(it = signatureTable.begin(); it != signatureTable.end(); it++){
		histogram = &signatureTable[it->first];

		if((*histogram)[TOTAL_HITS] == 0)
			continue;

		if(j++ == 1000){
			j = 0;
			printf(".");
			fflush(stdout);
		}

		acc_hits += (*histogram)[TOTAL_HITS];

		best_faddr = bestFAddrRT(*histogram, &best_accRT, accAccRT, scaled_deadline);
		addFaddr(faddr2signs, best_faddr, it->first);

		acc_best_accRT += best_accRT;

#ifdef PRINT_HISTOGRAMS
		if(first_run) { //histogram printing functionalities
			FILE* hist_file;
			char hfilename[128];
			cnt++;


			if(cnt == (signatureTable.size()/4) ||
					cnt == (signatureTable.size()/2) ||
					cnt == (3*signatureTable.size()/4))
				monitoring = 1;

			if(monitoring && (*histogram)[TOTAL_HITS] > 3000){
				monitoring = 0;
				sprintf(hfilename, "hist_rt_%d_%d.txt", deadline, cnt);
				hist_file = fopen(hfilename, "w");
				int k;
				for(k=0; k<=TOTAL_HITS; k++)
					fprintf(hist_file, "%d\n", (*histogram)[k]);
				fprintf(hist_file, "%d\n", best_faddr);
				fclose(hist_file);
			}
		}
#endif /* PRINT_HISTO */
	}
	printf("done\n");

	//calculateIncidences(faddr2signs, signatureTable);

	best_static = min_idx;
	for(i=min_idx+1; i<=max_idx; i++)
		if(accAccRT[i] > accAccRT[best_static])
			best_static = i;
	*best_static_out = best_static;

	if(first_run) {
		printf("Acc hits %llu - Acc best accRT %llu\n", acc_hits, acc_best_accRT);
		printf("Best static pos %d\n", best_static);
		printf("Avg. MTTR static: %f\n", (double) accAccRT[best_static] / (double) acc_hits);
		printf("Avg. MTTR @zero: %f\n", (double) accAccRT[min_idx] / (double) acc_hits);
		printf("PST RT: %f\n", (double) acc_best_accRT / (double) acc_hits);
	} else {
		printf("Acc hits %llu - Acc best accRT %llu\n", acc_hits, acc_best_accRT);
		printf("HST RT: %f\n", (double) acc_best_accRT / (double) acc_hits);
	}

	if(first_run){
		sprintf(filename, "zeroAccRT_%06d.txt", deadline);
		zeroMTTR = fopen(filename, "a");
		sprintf(filename, "bestStaticAccRT_%06d.txt", deadline);
		bestStaticMTTR = fopen(filename, "a");
		accHitsFile = fopen("accHitsFile.txt", "a");
		sprintf(filename, "perfectRT_%06d.txt", deadline);
		perfectMTTR = fopen(filename, "a");
		fprintf(zeroMTTR, "%llu\n", accAccRT[min_idx]);
		fprintf(bestStaticMTTR, "%llu\n", accAccRT[best_static]);
		fprintf(accHitsFile, "%llu\n", acc_hits);
		fprintf(perfectMTTR, "%llu\n", acc_best_accRT);
		fclose(zeroMTTR);
		fclose(bestStaticMTTR);
		fclose(accHitsFile);
		fclose(perfectMTTR);
	} else {
		sprintf(filename, "heuristcRT_%06d.txt", deadline);
		heuristcMTTR = fopen(filename, "a");
		fprintf(heuristcMTTR, "%llu\n", acc_best_accRT);
		fclose(heuristcMTTR);
	}
}
/*********************************************************************************************************************/
vector<bool> compressSig(vector<bool> &signature, list<set<unsigned> > &groupedBits){
	vector<bool> compSig;
	int i, j;

	compSig.clear();

	foreach(set<unsigned int> gr, groupedBits){
		compSig.push_back(dumbOrGrouping(gr, signature));
	}

	return compSig;
}
/*********************************************************************************************************************/
void evalMTTR4RT(tableType &signatureTable, faddr2signsType &faddr2signs, faddr2signsType &compF2S, unsigned int scaled_deadline, unsigned int deadline, list<set<unsigned int> > &groupedBits){
	tableType::iterator it;
	unsigned long long int totalCoverP=0, totalCoverH=0, accHits=0;
	faddr2signsType::iterator itF2S;
	list<vector<bool> >::iterator itList;
	map<vector<bool>, unsigned int> directTable;
	FILE *out;
	char filename[100];

	directTable.clear(); //direct table for the compressed signatures
	for(itF2S = compF2S.begin(); itF2S != compF2S.end(); itF2S++) {//for each target faddr
		for(itList = itF2S->second.begin(); itList != itF2S->second.end(); itList++) { //for each signature in that faddr
			directTable[*itList] = itF2S->first;
		}
	}


	for(itF2S = faddr2signs.begin(); itF2S != faddr2signs.end(); itF2S++) {//for each target faddr
		for(itList = itF2S->second.begin(); itList != itF2S->second.end(); itList++) { //for each signature in that faddr
			totalCoverP += getCoverRT(signatureTable[*itList], itF2S->first, scaled_deadline);
			totalCoverH += getCoverRT(signatureTable[*itList], directTable[compressSig(*itList, groupedBits)], scaled_deadline);
			accHits += signatureTable[*itList][TOTAL_HITS];
		}
	}
	printf("PST MTTR = %llu - %f\n", totalCoverP, (double) totalCoverP/accHits);
	sprintf(filename, "PmttrTableRT_%06d.txt", deadline);
	out = fopen(filename, "a");
	fprintf(out, "%llu\n", totalCoverP);
	fclose(out);

	printf("HST MTTR = %llu - %f\n", totalCoverH, (double) totalCoverH/accHits);
	sprintf(filename, "HmttrTableRT_%06d.txt", deadline);
	out = fopen(filename, "a");
	fprintf(out, "%llu\n", totalCoverH);
	fclose(out);

}
/*********************************************************************************************************************/
void buildTable(tableType &signatureTable, faddr2signsType &faddr2signs, unsigned int *best_static_out){
	tableType::iterator it;
	unsigned int i, j = 0;
	vector<unsigned int> *histogram;
	unsigned long long int best_mttr;
	unsigned int best_static, best_faddr;
	unsigned int in_cnt = 0, out_cnt = 0, in_hits = 0, out_hits = 0;
	unsigned long long acc_best_mttr = 0, acc_hits = 0, acc_mttr_in = 0;
	vector<unsigned long long int> accMTTRin, accMTTRout;
	FILE *zeroMTTR, *bestStaticMTTR, *accHitsFile, *perfectMTTR, *heuristcMTTR;
	static bool first_run = true;
	int cnt=0;
	int monitoring = 0;

	accMTTRin.resize(CONFIG_SIZE);
	accMTTRout.resize(CONFIG_SIZE);
	for(i=0; i<CONFIG_SIZE; i++){
		accMTTRin[i] = 0;
		accMTTRout[i] = 0;
	}

	faddr2signs.clear();


	printf("Calculating optimum SURFER faddrs for MTTR");
	for(it = signatureTable.begin(); it != signatureTable.end(); it++){
		histogram = &signatureTable[it->first];

		if((*histogram)[TOTAL_HITS] == 0)
			continue;

		if(j++ == 1000){
				j = 0;
				printf(".");
				fflush(stdout);
		}

		acc_hits += (*histogram)[TOTAL_HITS];

		if((*histogram)[TOTAL_HITS] >= cut_threshold){
			best_faddr = bestFAddr(*histogram, &best_mttr, accMTTRin);
			addFaddr(faddr2signs, best_faddr, it->first);
			in_hits += (*histogram)[TOTAL_HITS];
			acc_mttr_in += best_mttr;
			in_cnt++;
		} else {
			best_faddr = bestFAddr(*histogram, &best_mttr, accMTTRout);
			out_hits += (*histogram)[TOTAL_HITS];
			out_cnt++;
		}
		acc_best_mttr += best_mttr;

		/*if(first_run) { //histogram printing functionalities
			FILE* hist_file;
			char hfilename[128];
			cnt++;

			if(cnt == 5000 || cnt == 7500 || cnt == 20000)
				monitoring = 1;

			if(monitoring && (*histogram)[TOTAL_HITS] > 3000){
				monitoring = 0;
				sprintf(hfilename, "hist_mttr_%d.txt", cnt);
				hist_file = fopen(hfilename, "w");
				int k;
				for(k=min_idx; k<=TOTAL_HITS; k++)
					fprintf(hist_file, "%d\n", (*histogram)[k]);
				fprintf(hist_file, "%d\n", best_faddr);
				fclose(hist_file);
			}
		}*/

	}
	printf("done\n");

	//calculateIncidences(faddr2signs, signatureTable);

	best_static = min_idx;
	for(i=min_idx+1; i<=max_idx; i++)
		if(accMTTRin[i] + accMTTRout[i] < accMTTRin[best_static] + accMTTRout[best_static]
			&& (accMTTRin[i] != 0 || accMTTRout[i] != 0))
			best_static = i;

	if(out_cnt == 0) {
		*best_static_out = best_static;
	} else {
		*best_static_out = min_idx;
		for(i=min_idx+1; i<=max_idx; i++)
			if(accMTTRout[i] < accMTTRout[*best_static_out] && accMTTRout[i] != 0)
				*best_static_out = i;
	}

	first_run = false;

}

