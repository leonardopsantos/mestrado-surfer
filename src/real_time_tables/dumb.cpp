/**********************************************************
 *
 * Dumb heuristics for signature compression
 * by Gabriel Luca Nazar <glnazar@inf.ufrgs.br>
 *
***********************************************************/

#include "dumb.h"

unsigned int dumbMaxSigSize;

void dumbGroupBits(vector<set<unsigned int> > &groupedBits, tableType &signatureTable, faddr2signsType &faddr2signs){
	set<unsigned int> newGroup;
	unsigned int i, j;

	groupedBits.clear();

	for(i=0; i<SIG_SIZE/6; i++){
		newGroup.clear();
		for(j=0; j<6; j++){
			newGroup.insert(i*6+j);
			//printf("%d ", i*6+j);
		}
		groupedBits.push_back(newGroup);
		//printf("\n");
	}

	if(SIG_SIZE % 6 != 0){
		newGroup.clear();
		for(i=SIG_SIZE - SIG_SIZE % 6; i<SIG_SIZE; i++){
			newGroup.insert(i);
			//printf("%d ", i);
		}
		groupedBits.push_back(newGroup);
		//printf("\n");
	}
}

/*********************************************************************************************************************/
void dumbFindMaxMatch(list<set<unsigned int> > &groupedBits, vector<vector<unsigned int> > &relations){
	SmartGraph rGraph;
	vector<SmartGraph::Node> nodeVec;
	SmartGraph::Node node;
	SmartGraph::EdgeMap<unsigned> edgeWeightMap(rGraph);
	SmartGraph::NodeMap<pair<set<unsigned>*, unsigned> > nodePtMap(rGraph);
	MaxWeightedMatching<SmartGraph, SmartGraph::EdgeMap<unsigned> > maxMatch(rGraph, edgeWeightMap);
	SmartGraph::Edge newEdge;
	list<set<unsigned int> > newGroupedBits;
	unsigned i, j;
	vector<bool> grouped;
	set<unsigned> newGroup;
	list<set<unsigned int> >::iterator it;

	//creates the graph nodes
	it = groupedBits.begin();
	for(i=0; i<groupedBits.size(); i++){
		node = rGraph.addNode();
		nodeVec.push_back(node);
		nodePtMap[node] = make_pair(&(*it), i);
		it++;
	}

	//creates the graph edges
	for(i=0; i<groupedBits.size(); i++)
		for(j=i+1; j<groupedBits.size(); j++)
			edgeWeightMap[rGraph.addEdge(nodeVec[i], nodeVec[j])] = relations[i][j];

	maxMatch.run();

	newGroupedBits.clear();
	grouped.resize(groupedBits.size());
	for(i=0; i<groupedBits.size(); i++)
		grouped[i] = false;

	//identifies the chosen edges
	i = 0;
	foreach(set<unsigned int> gr, groupedBits){
		if(grouped[i]){
			i++;
			continue;
		}
		grouped[i] = true;
		node = maxMatch.mate(nodeVec[i]);
		if(node != INVALID){
			newGroup.clear();
			foreach(unsigned grId, gr){
				newGroup.insert(grId);
				//printf("%3d ", grId);
			}

			foreach(unsigned grId, *(nodePtMap[node].first)){
				newGroup.insert(grId);
				//printf("%3d ", grId);
			}
			grouped[nodePtMap[node].second] = true;
			//printf("%3d", j);
			newGroupedBits.push_back(newGroup);
		} else {
			newGroupedBits.push_back(gr);
		}
		//printf("\n");
		i++;
	}

	groupedBits.clear();
	groupedBits = newGroupedBits;
	//printf("groupedBits.size() = %d\n", groupedBits.size());
}

/*********************************************************************************************************************/
void dumbGroupBitsRelations(list<set<unsigned int> > &groupedBits, tableType &signatureTable, faddr2signsType &faddr2signs){
	vector<vector<unsigned int> > relations;

	//for(i=0; i<dumbCompressionRounds; i++){
	while(groupedBits.size() > dumbMaxSigSize) {
		buildIntergroupFaddrRelations(groupedBits, faddr2signs, signatureTable, relations);
		dumbFindMaxMatch(groupedBits, relations);
		if(options[OPT_PARTIAL_TABLES])
			break;
	}
}

/*********************************************************************************************************************/

bool dumbOrGrouping(set<unsigned> group, vector<bool> signature){
	bool retVal = false;

	foreach(unsigned bitPos, group)
		retVal = retVal || signature[bitPos];

	return retVal;
}

/*********************************************************************************************************************/

inline bool dumbXorGrouping(set<unsigned> group, vector<bool> signature){
	bool retVal = false;

	foreach(unsigned bitPos, group)
		retVal = retVal ^ signature[bitPos];

	return retVal;
}

/*********************************************************************************************************************/

inline bool dumbAndGrouping(set<unsigned> group, vector<bool> signature){
	bool retVal = true;

	foreach(unsigned bitPos, group)
		retVal = retVal && signature[bitPos];

	return retVal;
}

/*********************************************************************************************************************/

void dumbCompressSignatures(list<set<unsigned int> > &groupedBits, faddr2signsType &faddr2signs, faddr2signsType &compressedTable){
	faddr2signsType::iterator itF2S;
	list<vector<bool> >::iterator itList;
	list<vector<bool> > newSigList;
	vector<bool> newSig;

	compressedTable.clear();

	for(itF2S = faddr2signs.begin(); itF2S != faddr2signs.end(); itF2S++) {//for each target faddr
		newSigList.clear();
		for(itList = itF2S->second.begin(); itList != itF2S->second.end(); itList++) { //for each signature in that faddr
			newSig.clear();
			foreach(set<unsigned int> gr, groupedBits){
				if(options[OPT_XOR_COMPRESS])
					newSig.push_back(dumbXorGrouping(gr, *itList));
				else
					newSig.push_back(dumbOrGrouping(gr, *itList));
			}
			newSigList.push_back(newSig);

			//DEBUG BEGIN
			/*{
				int i;
				char hasOne;
				hasOne = 0;
				for(i=0; i<newSig.size(); i++)
					if(newSig[i]){
						hasOne = 1;
						break;
					}
				if(!hasOne){
					printf("Does not have one!\n");
					printf("compressed sig size: %d\n", newSig.size());
					printf("input signature:\n");
					for(i=0; i<itList->size(); i++)
						printf("%03d : %d\n", i, (unsigned) (*itList)[i]);
				}
			}*/
			//DEBUG END
		}
		compressedTable[itF2S->first] = newSigList;
	}
}

/*********************************************************************************************************************/

void dumbHandleCollisions(faddr2signsType &compressedTable, tableType &signatureTable, faddr2signsType &faddr2signs,
                          faddr2signsType &compF2S, unsigned *compBSO, unsigned int scaled_deadline, unsigned int deadline){
	faddr2signsType::iterator itF2S, itCT;
	list<vector<bool> >::iterator itListF2S, itListCT;
	int collisionCnt = 0, hits, i;
	tableType compressedHistTable;
	vector<unsigned> *uncompHist, *compHist;

	compressedHistTable.clear();

	for(itF2S = faddr2signs.begin(), itCT = compressedTable.begin(); itF2S != faddr2signs.end(); itF2S++, itCT++) {//for each target faddr
		for(itListF2S = itF2S->second.begin(), itListCT = itCT->second.begin(); itListF2S != itF2S->second.end(); itListF2S++, itListCT++) {
			if(compressedHistTable.count(*itListCT)){ //found a collision! :(
				collisionCnt++;
				uncompHist = &(signatureTable[*itListF2S]);
				compHist = &(compressedHistTable[*itListCT]);
				for(i=min_idx; i<CONFIG_SIZE+1; i++)
					(*compHist)[i] += (*uncompHist)[i];
			} else {
				compressedHistTable[*itListCT] = signatureTable[*itListF2S];
			}
		}
	}

	if(deadline == 0)
		buildTable(compressedHistTable, compF2S, compBSO);
	else
		buildTableRT(compressedHistTable, compF2S, compBSO, scaled_deadline, deadline, 0);

	printf("Found %d collisions.\n", collisionCnt);
	printf("Collision free table size: %d\n", (unsigned) compressedHistTable.size());
}

/*********************************************************************************************************************/
void dumbPrintCFunction(char* circname, list<set<unsigned int> > groupedBits, faddr2signsType &compF2S, unsigned int compBSO, int it){
	FILE* cfile;
	char filename[64];
	int i, j;
	string func = "|";
	faddr2signsType::iterator itCF;

	if(options[OPT_XOR_COMPRESS])
		func = "^";

	if(options[OPT_PARTIAL_TABLES])
		snprintf(filename, 64, "%s_table_%02d.c", circname, it);
	else
		snprintf(filename, 64, "%s_table.c", circname);

	cfile = fopen(filename, "w");
	fprintf(cfile, "#include \"evaluator.h\"\n\n");
	fprintf(cfile, "map<vector<bool>, unsigned> retTable;\n\n");

	fprintf(cfile, "unsigned int getFirst(){\n");
	fprintf(cfile, "\treturn %d;\n}\n\n", min_idx);

	fprintf(cfile, "unsigned int getLast(){\n");
	fprintf(cfile, "\treturn %d;\n}\n\n", max_idx);

	fprintf(cfile, "void buildSurferTable(){\n");
	fprintf(cfile, "\tvector<bool> cSig;\n\n");
	fprintf(cfile, "\tcSig.resize(%d);\n", (unsigned) groupedBits.size());
	for(itCF = compF2S.begin(); itCF != compF2S.end(); itCF++){
		foreach(vector<bool> sig, itCF->second){
			fprintf(cfile, "\tcSig = {");
			for(i=0; i<sig.size(); i++){
				fprintf(cfile, " %d", (unsigned) sig[i]);
				if(i < sig.size()-1)
					fprintf(cfile, ",");
			}
			fprintf(cfile, "};\n\tretTable[cSig] = %d;\n", idx2Faddr(itCF->first));
		}
	}
	fprintf(cfile, "\treturn;\n}\n\n");

	fprintf(cfile, "unsigned surferTable(const vector<bool> &signature){\n");
	fprintf(cfile, "\tvector<bool> cSig;\n\n");
	fprintf(cfile, "\tcSig.resize(%d);\n", (unsigned) groupedBits.size());
	i=0;
	foreach(set<unsigned> gr, groupedBits){
		j = 0;
		fprintf(cfile, "\tcSig[%d] =", i);
		foreach(unsigned bitPos, gr){
			fprintf(cfile, " signature[%d]", bitPos);
			if(++j < gr.size())
				fprintf(cfile, " %s", func.c_str());
		}
		fprintf(cfile, ";\n");
		i++;
	}
	fprintf(cfile, "\n\tif(retTable.count(cSig))\n");
	fprintf(cfile, "\t\treturn retTable[cSig];\n");
	fprintf(cfile, "\treturn %d;\n}\n", idx2Faddr(compBSO));
	fclose(cfile);
}

/*********************************************************************************************************************/
void dumbPrintPlainTable(char* circname, list<set<unsigned int> > groupedBits, faddr2signsType &compF2S, unsigned int compBSO, int it, unsigned int deadline){
	FILE* tabfile;
	char filename[64];
	int i, j;
	faddr2signsType::iterator itCF;

	if(options[OPT_PARTIAL_TABLES])
		snprintf(filename, 64, "%s_table_%02d_%05d.tab", circname, it, deadline);
	else
		snprintf(filename, 64, "%s_table_%05d.tab", circname, deadline);

	tabfile = fopen(filename, "w");

	fprintf(tabfile, "%d\n", min_idx);
	fprintf(tabfile, "%d\n", max_idx);
	fprintf(tabfile, "%d\n", (unsigned) groupedBits.size());
	fprintf(tabfile, "%d\n", idx2Faddr(compBSO));
	for(itCF = compF2S.begin(); itCF != compF2S.end(); itCF++){
		foreach(vector<bool> sig, itCF->second){
			for(i=0; i<sig.size(); i++)
				fprintf(tabfile, "%d", (unsigned) sig[i]);
			fprintf(tabfile, "\t%06d\n", idx2Faddr(itCF->first));
		}
	}
	fprintf(tabfile, "#\n");
	i=0;
	foreach(set<unsigned> gr, groupedBits){
		j = 0;
		foreach(unsigned bitPos, gr)
			fprintf(tabfile, " %d", bitPos);
		fprintf(tabfile, "\n");
		i++;
	}
	fprintf(tabfile, "#\n");
	fclose(tabfile);
}

/*********************************************************************************************************************/
void dumbPrintVHDL(char* circname, list<set<unsigned int> > groupedBits, faddr2signsType &compF2S, unsigned int compBSO, int it, unsigned int deadline){
	FILE* vhdl;
	char filename[64];
	int i, j;
	string func = "or";
	faddr2signsType::iterator itCF;

	if(options[OPT_PARTIAL_TABLES])
		snprintf(filename, 64, "%s_table_%02d_%05d.vhd", circname, it, deadline);
	else
		snprintf(filename, 64, "%s_table_%05d.vhd", circname, deadline);

	if(options[OPT_XOR_COMPRESS])
		func = "xor";

	vhdl = fopen(filename, "w");
	print_header(vhdl);
	fprintf(vhdl, "\tsignal cSig : STD_LOGIC_VECTOR(%d downto 0);\n", groupedBits.size()-1);
	fprintf(vhdl, "begin\n");
	i=0;
	foreach(set<unsigned> gr, groupedBits){
		j = 0;
		fprintf(vhdl, "\tcSig(%d) <=", i);
		foreach(unsigned bitPos, gr){
			fprintf(vhdl, " signature(%d)", bitPos);
			if(++j < gr.size())
				fprintf(vhdl, " %s", func.c_str());
		}
		fprintf(vhdl, ";\n");
		i++;
	}

	if(options[OPT_XOR_COMPRESS])
		fprintf(vhdl, "\terror <= '0' when signature = conv_std_logic_vector(0, %d) else '1';\n", SIG_SIZE);
	else
		fprintf(vhdl, "\terror <= '0' when cSig = conv_std_logic_vector(0, %d) else '1';\n", groupedBits.size());

	fprintf(vhdl, "\tfaddr <= ");
	for(itCF = compF2S.begin(); itCF != compF2S.end(); itCF++){
		foreach(vector<bool> sig, itCF->second){
			fprintf(vhdl, "\tconv_std_logic_vector(%d, 24) when cSig = \"", idx2Faddr(itCF->first));
			for(i=sig.size()-1; i>=0; i--)
				fprintf(vhdl, "%d", (unsigned) sig[i]);
			fprintf(vhdl, "\" else\n");
		}
	}
	fprintf(vhdl, "\tconv_std_logic_vector(%d, 24);\n", idx2Faddr(compBSO));
	fprintf(vhdl, "end Behavioral;\n");
	fclose(vhdl);
}

/*********************************************************************************************************************/
void buildDumb(char* circname, tableType &signatureTable, faddr2signsType &faddr2signs, faddr2signsType &compF2SCollisionFree,
		unsigned int best_static_out, unsigned int scaled_deadline, unsigned int deadline, list<set<unsigned int> > &groupedBits){
	set<unsigned> newGroup;
	int i;
	faddr2signsType compressedTable;
	unsigned int compBSO; //compressed best static out
	unsigned char noComp = 1; //no compression took place

	groupedBits.clear();
	for(i=0; i<SIG_SIZE; i++){
		newGroup.clear();
		newGroup.insert(i);
		groupedBits.push_back(newGroup);
	}
	i=0;
	if(options[OPT_PARTIAL_TABLES]) {
		dumbPrintVHDL(circname, groupedBits, faddr2signs, best_static_out, i, deadline); //prints the VHDL entity that implements the table
		dumbPrintPlainTable(circname, groupedBits, faddr2signs, best_static_out, i, deadline);
	}
	i=1;
	while(groupedBits.size() > dumbMaxSigSize) {
        noComp = 0;
		dumbGroupBitsRelations(groupedBits, signatureTable, faddr2signs); //groups the bits for compression
		dumbCompressSignatures(groupedBits, faddr2signs, compressedTable); //compresses the signatures based on the groups
		dumbHandleCollisions(compressedTable, signatureTable, faddr2signs, compF2SCollisionFree, &compBSO, scaled_deadline, deadline); //decides the target faddr for each compressed signature
		//dumbPrintCFunction(circname, groupedBits, compF2SCollisionFree, compBSO, i); //prints the C function that implements the table
		if(options[OPT_PARTIAL_TABLES]) {
            dumbPrintVHDL(circname, groupedBits, compF2SCollisionFree, compBSO, i, deadline); //prints the VHDL entity that implements the table
            dumbPrintPlainTable(circname, groupedBits, compF2SCollisionFree, compBSO, i, deadline); //prints a plain version of the table
		}
		i++;
	}
	if(!options[OPT_PARTIAL_TABLES]) {
	    if(noComp){
            dumbPrintVHDL(circname, groupedBits, faddr2signs, best_static_out, i, deadline); //prints the VHDL entity that implements the table
            dumbPrintPlainTable(circname, groupedBits, faddr2signs, best_static_out, i, deadline);
	    } else {
            dumbPrintVHDL(circname, groupedBits, compF2SCollisionFree, compBSO, i, deadline); //prints the VHDL entity that implements the table
            dumbPrintPlainTable(circname, groupedBits, compF2SCollisionFree, compBSO, i, deadline); //prints a plain version of the table
	    }
    }
}
