
#include "statistics.h"

/*********************************************************************************************************************/

void buildInterbitRelations(faddr2signsType &faddr2signs, tableType &signatureTable, vector<vector<unsigned int> > &relations){
	faddr2signsType::iterator itF2S;
	list<vector<bool> >::iterator itList;
	int i, j;
	unsigned int total_hits;
	
	relations.resize(SIG_SIZE);
	for(i=0; i<SIG_SIZE; i++)
		relations[i].resize(SIG_SIZE);
	
	for(i=0; i<SIG_SIZE; i++) { //clears the relations
		for(j=0; j<SIG_SIZE; j++)
			relations[i][j] = 0;
	}
	
	for(itF2S = faddr2signs.begin(); itF2S != faddr2signs.end(); itF2S++) { //for each target faddr
		for(itList = itF2S->second.begin(); itList != itF2S->second.end(); itList++) { //for each signature in that faddr
			total_hits = signatureTable[*itList][TOTAL_HITS];
			for(i=0; i<SIG_SIZE; i++) { //for each bit
				for(j=i+1; j<SIG_SIZE; j++) //for each bit after the i-th bit
					if( !((*itList)[i] && (*itList)[j]) ) { //if they are not both 1
						relations[i][j] += total_hits;
						relations[j][i] += total_hits;
					}
			}
		}
		//printf("\n****%X\n", idx2Faddr(itF2S->first));
	}
	/*for(i=0; i<SIG_SIZE; i++){
		for(j=0; j<SIG_SIZE; j++)
			printf("%6.4f ", ((double) relations[i][j]) / ((double) signatureCnt));	
		printf("\n");
	}*/
}

/*********************************************************************************************************************/
//provides a relation factor for two groups in a given signature
unsigned int groupRelation(set<unsigned> g1, set<unsigned> g2, const vector<bool> &signature){
	unsigned int grID1, grID2;
	unsigned int retVal = 0;
	
	foreach(grID1, g1){
		foreach(grID2, g2)
			if(!(signature[grID1] && signature[grID2])){
				retVal = 1;
				break;
			}
		if(retVal)
			break;
	}
	return retVal;
}

/*********************************************************************************************************************/

void buildIntergroupRelations(list<set<unsigned int> > &groupedBits, faddr2signsType &faddr2signs, tableType &signatureTable, vector<vector<unsigned int> > &relations){
	faddr2signsType::iterator itF2S;
	list<vector<bool> >::iterator itList;
	int i, j;
	unsigned int relation, total_hits;
	list<set<unsigned int> >::iterator it1, it2;
	
	relations.resize(groupedBits.size());
	for(i=0; i<groupedBits.size(); i++)
		relations[i].resize(groupedBits.size());
	
	for(i=0; i<groupedBits.size(); i++) { //clears the relations
		for(j=0; j<groupedBits.size(); j++)
			relations[i][j] = 0;
	}
	
	for(itF2S = faddr2signs.begin(); itF2S != faddr2signs.end(); itF2S++) { //for each target faddr
		for(itList = itF2S->second.begin(); itList != itF2S->second.end(); itList++) { //for each signature in that faddr
			total_hits = signatureTable[*itList][TOTAL_HITS];
			i=0;
			for(it1=groupedBits.begin(); it1 != groupedBits.end(); it1++) { //for each group
				it2 = it1;
				it2++;
				j=0;
				for(; it2 != groupedBits.end(); it2++) { //for each group after the i-th group
					relation = groupRelation(*it1, *it2, *itList);
					relations[i][j] += relation*total_hits;
					relations[j][i] += relation*total_hits;
					j++;
				}
				i++;
			}
		}
		//printf("\n****%X\n", idx2Faddr(itF2S->first));
	}
	/*for(i=0; i<groupedBits.size(); i++){
		for(j=0; j<groupedBits.size(); j++)
			printf("%6.4f ", ((double) relations[i][j]) / ((double) signatureCnt));	
		printf("\n");
	}*/
}

/*********************************************************************************************************************/
bool isOne(set<unsigned> &group, vector<bool> &signature){
	unsigned id;
	bool retVal = false;
	
	if(!options[OPT_XOR_COMPRESS]){
		foreach(id, group)
			if(signature[id])
				return true;
			
		return false;
	} else {
		foreach(id, group)
			retVal ^= signature[id];
	}
	
	return retVal;
}

/*********************************************************************************************************************/

void buildIntergroupFaddrRelations(list<set<unsigned int> > &groupedBits, faddr2signsType &faddr2signs, tableType &signatureTable, vector<vector<unsigned int> > &relations){
	faddr2signsType::iterator itF2S;
	list<vector<bool> >::iterator itList;
	int i, j;
	unsigned int relation, currentMajor;
	list<set<unsigned int> >::iterator it1, it2;
	vector<unsigned> hitsVec;
	
	relations.resize(groupedBits.size());
	hitsVec.resize(groupedBits.size());
	for(i=0; i<groupedBits.size(); i++)
		relations[i].resize(groupedBits.size());
	
	for(i=0; i<groupedBits.size(); i++) { //clears the relations
		for(j=0; j<groupedBits.size(); j++)
			relations[i][j] = 0;
	}
	
	itF2S = faddr2signs.begin();
	currentMajor = getMajor(itF2S->first);
	for(; itF2S != faddr2signs.end(); itF2S++) { //for each target faddr
		if(getMajor(itF2S->first) != currentMajor) { //we've reached a new major address, accumulate results
			for(i=0; i<groupedBits.size(); i++)
				for(j=0; j<groupedBits.size(); j++) {
					relation = (hitsVec[i] > hitsVec[j]) ? hitsVec[j] : hitsVec[i];
					relations[i][j] += relation;
					relations[j][i] += relation;
				}
			
			for(i=0; i<groupedBits.size(); i++)
				hitsVec[i] = 0;
				
			currentMajor = getMajor(itF2S->first);
		}
		
		for(itList = itF2S->second.begin(); itList != itF2S->second.end(); itList++) { //for each signature in that faddr
			i=0;
			for(it1=groupedBits.begin(); it1 != groupedBits.end(); it1++) { //for each group
				if(isOne(*it1, *itList))
					hitsVec[i] += signatureTable[*itList][TOTAL_HITS];
				i++;
			}
		}
	}
	
	/*for(itF2S = faddr2signs.begin(); itF2S != faddr2signs.end(); itF2S++) { //for each target faddr
		for(i=0; i<groupedBits.size(); i++)
			hitsVec[i] = 0;
		for(itList = itF2S->second.begin(); itList != itF2S->second.end(); itList++) { //for each signature in that faddr
			i=0;
			for(it1=groupedBits.begin(); it1 != groupedBits.end(); it1++) { //for each group
				if(isOne(*it1, *itList))
					hitsVec[i] += signatureTable[*itList][TOTAL_HITS];
				i++;
			}
		}
		for(i=0; i<groupedBits.size(); i++)
			for(j=0; j<groupedBits.size(); j++) {
				relation = (hitsVec[i] > hitsVec[j]) ? hitsVec[j] : hitsVec[i];
				relations[i][j] += relation;
				relations[j][i] += relation;
			}
	}*/
}

/*********************************************************************************************************************/

void calculateIncidences(faddr2signsType &faddr2signs, tableType &signatureTable){
	faddr2signsType::iterator itF2S;
	list<vector<bool> >::iterator itList;
	int i, hits_per_faddr;
	vector<unsigned> incidenceVector;
	
	incidenceVector.resize(SIG_SIZE);
	
	for(itF2S = faddr2signs.begin(); itF2S != faddr2signs.end(); itF2S++){
		hits_per_faddr = 0;
		for(i=0; i<SIG_SIZE; i++)
			incidenceVector[i] = 0;
		for(itList = itF2S->second.begin(); itList != itF2S->second.end(); itList++){
			hits_per_faddr += signatureTable[*itList][TOTAL_HITS];
			for(i=0; i<SIG_SIZE; i++)
				if((*itList)[i])
					incidenceVector[i] += signatureTable[*itList][TOTAL_HITS];
		}
	
		//printf("%d - %7d - %4d - ", idx2Faddr(itF2S->first), hits_per_faddr, (unsigned int) itF2S->second.size());
		//for(i=0; i<SIG_SIZE; i++)
		//	printf("%7.4f", ((double) incidenceVector[i]) / ((double) hits_per_faddr));
		//printf("\n");
	}
	
}
