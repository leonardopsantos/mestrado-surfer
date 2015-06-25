/*************************************************************************/
/*
 *  Algorithmic P-CED insertion for Xilinx FPGAs
 *  by Gabriel Luca Nazar <glnazar@inf.ufrgs.br>
 *
 * TODO: Elegant FF identification (calculateDepth)
 * TODO: The output of a FF may be input to a MUXFx I0 or I1, generating a route-through LUT that must be avoided
 */
/*************************************************************************/

#include "ftXilinx.h"

using namespace std;

ftXilinx::ftXilinx(Circuit* newCirc){
	int i;
	
	circ = newCirc;
	isLarge = (circ->luts.size() >= LARGE_THRESHOLD);
	isVLarge = (circ->luts.size() >= VLARGE_THRESHOLD);
	
	nextPredId = 0;
}
/*************************************************************************/
void ftXilinx::fetchInfo(){

	unsigned maxFanout = 0, netId, totalFanout = 0;
	vector<unsigned> lutsPerLayer;
	vector<vector<unsigned> > sourceLayers;
	vector<vector<set<Net*> > > sourceLayersSet;
	int i, j, k;
	unsigned lutId;
	float maxDepth = 0.0;
	
	for(i=0; i<circ->nets.size(); i++) {
		//if(circ->nets[i]->isPI)
		//	continue;
		totalFanout += circ->nets[i]->outputs.size();
		if(circ->nets[i]->outputs.size() > maxFanout){
			maxFanout = circ->nets[i]->outputs.size();
			netId = i;
		}
	}
	cout << "Maximum fanout net: " << circ->nets[netId]->name << " - " << maxFanout << endl;
	cout << "Total fanout: " << totalFanout << endl;
	
	calculateAllDepths(circ->luts);
	
	for(i=0; i<circ->luts.size(); i++) {
		if(circ->luts[i]->depth > maxDepth){
			maxDepth = circ->luts[i]->depth;
			lutId = i;
		}
	}
	
	lutsPerLayer.resize((unsigned) maxDepth + 1);
	sourceLayers.resize((unsigned) maxDepth + 1);
	sourceLayersSet.resize((unsigned) maxDepth + 1);
	
	for(i=0; i<sourceLayers.size(); i++){
		sourceLayers[i].resize((unsigned) maxDepth + 1);
		sourceLayersSet[i].resize((unsigned) maxDepth + 1);
		for(j=0; j<sourceLayers[i].size(); j++){
			sourceLayers[i][j] = 0;
			sourceLayersSet[i][j].clear();
		}
	}
		
	for(i=0; i<circ->luts.size(); i++){
		lutsPerLayer[(unsigned) circ->luts[i]->depth]++;
		for(j=0; j<circ->luts[i]->inputs.size(); j++)
			if(circ->luts[i]->inputs[j] -> isPI) {
				sourceLayers[circ->luts[i]->depth][0] += 1;
				sourceLayersSet[circ->luts[i]->depth][0].insert(circ->luts[i]->inputs[j]);
			} else {
				sourceLayers[circ->luts[i]->depth][circ->luts[i]->inputs[j]->input->depth] += 1;
				sourceLayersSet[circ->luts[i]->depth][circ->luts[i]->inputs[j]->input->depth].insert(circ->luts[i]->inputs[j]);
			}
	}
		
	cout << "Max depth: " << maxDepth << " - " << circ->luts[lutId]->name << endl;
	for(i=0; i<lutsPerLayer.size(); i++)
		cout << "Layer " << i << " - " << lutsPerLayer[i] << endl;
	
	cout<< "Inputs per depth: " << endl;
	for(i=1; i<sourceLayers.size(); i++){
		cout << "Layer " << i << endl;
		for(j=0; j<sourceLayers[i].size(); j++)
			cout << j << " - " << sourceLayers[i][j] << endl;			
	}
	
	cout<< "Unique inputs per depth: " << endl;
	for(i=1; i<sourceLayersSet.size(); i++){
		cout << "Layer " << i << endl;
		for(j=0; j<sourceLayersSet[i].size(); j++)
			cout << j << " - " << sourceLayersSet[i][j].size() << endl;			
	}	
	
	set<Net*> inputSet;
	for(i=0; i<circ->components.size(); i++){
		if(circ->components[i]->type == MUXF7){
			inputSet.clear();
			cout << "MUXF7 " << circ->components[i]->name << " depth: " << circ->components[i]->depth << endl;
			cout << "Sel: " << circ->components[i]->inputs[2]->name << endl;
			for(j=0; j<2; j++){
				if(circ->components[i]->inputs[j]->outputs.size() > 1 || circ->components[i]->inputs[j]->isPO)
					cout << "\nLUT before mux being used elsewhere" << circ->components[i]->inputs[j]->name << endl << endl;
				
				Lut* lutBeforeMux = (Lut*) circ->components[i]->inputs[j]->input;
				for(k=0; k<lutBeforeMux->inputs.size(); k++)
					inputSet.insert(lutBeforeMux->inputs[k]);
			}
			if(inputSet.size() > 6)
				cout << "\nMUXF7's LUTs with " << inputSet.size() << " inputs" << endl << endl;
		}
	}
	
	cout << "Tirar parafernálias experimentais!" << endl;
	exit(0);
}


/*************************************************************************/
//build fault tolerant circuit
void ftXilinx::buildFtCirc(){
	int i;
	cout << "-------Input circuit:\n";
	cout << " " << circ->luts.size() << " LUTs\n";
	cout << " " << circ->ffs.size() << " FFs\n";
	cout << " " << circ->components.size() << " other components\n";
	cout << " " << circ->PIs.size() << " PIs\n";
	cout << " " << circ->POs.size() << " POs\n";
	cout << " " << circ->nets.size() << " Nets\n";
	cout << "---------------------" << endl;
	
	//fetchInfo();
	
	cliques6.resize(maxGroupSize+1);
	if(options[OPT_CCHAIN] || options[OPT_DUPLICATE_MUXES]){
		cliquesMuxFx.resize(LUT_K);
		for(i=0; i<LUT_K; i++)
			cliquesMuxFx[i].clear();
	}
		
	for(i=0; i<maxGroupSize+1; i++)
		cliques6[i].clear();
		
	
	forceDuplicate.clear();
	findMuxesWithConstInput();
	
	if(options[OPT_CCHAIN]){
		cout << "Removing LUTs with MUXFx at the output" << endl;
		removeMuxFxLUTs();
		if(options[OPT_DWCF]){
			buildDWC(selectedCliquesMuxFx, lutsWithMuxF7);
		} else {
			findCliques(cliquesMuxFx, lutsWithMuxF7, LUT_K-1);
			setCover(selectedCliquesMuxFx, cliquesMuxFx, lutsWithMuxF7, LUT_K-1);
		}
		for(i=0; i<LUT_K; i++)
			cliquesMuxFx[i].clear();
		cliquesMuxFx.clear();
	} else if(options[OPT_DUPLICATE_MUXES]){
		cout << "Removing LUTs with MUXFx at the output" << endl;
		removeMuxFxLUTs();
		buildDWC(selectedCliquesMuxFx, lutsWithMuxF7);
		for(i=0; i<LUT_K; i++)
			cliquesMuxFx[i].clear();
		cliquesMuxFx.clear();
	}
	
	if(options[OPT_D_ADDERS]){
		cout << "\nPre-processing: Identify adders\n";
		findAdders();
		removeAdders();
		cout << "LUTs after adder removal: " << circ->luts.size() << endl;
	}
	if(options[OPT_DWCF]) {
		cout << "Build Fine-Grained DWC Circuit" << endl;
		buildDWC(selectedCliques, circ->luts);
	} else {
		cout << "\nStep 1: Group search:\n";
		findCliques(cliques6, circ->luts, maxGroupSize);
		cout << "\nStep 2: Set covering problem:\n";
		setCover(selectedCliques, cliques6, circ->luts, maxGroupSize);
	}
	
	for(i=0; i<maxGroupSize+1; i++)
		cliques6[i].clear();
		
	cliques6.clear();
	
	if(options[OPT_CCHAIN])
		generateProximityVectors(selectedCliquesMuxFx, lutsWithMuxF7, proximity1MUXFX, proximity2MUXFX);	
	else {
		generateProximityVectors(selectedCliques, circ->luts, proximity1General, proximity2General);
		if(options[OPT_DUPLICATE_MUXES])
			generateProximityVectors(selectedCliquesMuxFx, lutsWithMuxF7, proximity1MUXFX, proximity2MUXFX);
	}
		
	generateDuplicatedNets();
	
	generateDuplicatedMuxFx();
	
	generateDuplicatedFFs();
	
	sharedCheckers.clear();
	if(options[OPT_CCHAIN]){
		generateSharedCheckers(selectedCliquesMuxFx, lutsWithMuxF7, proximity1MUXFX, proximity2MUXFX);
		generateCED(selectedCliquesMuxFx, lutsWithMuxF7, LUT_K-1);
		calculateAllDepths(circ->luts);
		generateCChainCED(selectedCliques, circ->luts);
	} else {
		generateSharedCheckers(selectedCliques, circ->luts, proximity1General, proximity2General);
		if(options[OPT_DUPLICATE_MUXES])
			generateSharedCheckers(selectedCliquesMuxFx, lutsWithMuxF7, proximity1MUXFX, proximity2MUXFX);
		generateCED(selectedCliques, circ->luts, maxGroupSize); //this will create shared checkers for muxes, as well
	}	
	
	if(options[OPT_D_ADDERS]) //if we are duplicating adders..
		generateDuplicatedAdders();
		
	if(options[OPT_CMUX])
		generateMuxCheckers();

	if(options[OPT_2RAIL])
		insertOutputCmp();
	
	if(options[OPT_RSPLIT] && !options[OPT_CCHAIN])
		splitRouting();
		
	cout << "\nCircuit cost:\n";
	cost();
	
	checkSolution();
}

/*************************************************************************/
void ftXilinx::checkSolution(){
	//TODO: More rigorous solution checking
	vector<bool> isCovered;
	int i;
	
	isCovered.resize(circ->luts.size());
	
	for(i=0; i<isCovered.size(); i++)
		isCovered[i]=false;
	
	for(i=maxGroupSize; i>=0; i--){
		foreach(set<unsigned> clique, selectedCliques[i]){
			foreach(unsigned node, clique){				
				if(isCovered[node]){
					cout << i << "-clique in G6 with covered LUT!" << endl;
					cout << circ->luts[node]->name << " id = "  << node << "; " << circ->luts[node]->id << endl;
				}
				isCovered[node] = true;
			}
		}
	}
	/*for(i=0; i<isCovered.size(); i++){
		if(!isCovered[i])
			cout << "uncovered: " << i << " = " << circ->luts[i]->name << endl;
	}*/
}

/*************************************************************************/
//finds k-cliques in the graph (with k in 3..LUT_K-1)
void ftXilinx::findCliques(vector<vector<set<unsigned> > > &cliques6_in, vector<Lut*> &lutVec_in, int maxSize){
	unsigned i, j, k, l, m, n, o, c;
	vector<set<unsigned> > inputSet;
	set<unsigned> foundClique;
	unsigned passed3=0;
	inputSet.resize(maxSize+1);
	unsigned inputLimit = LUT_K;
	vector<bool> inClique;
	unsigned cliqueCount=0;
	bool limitSearch = false, hardLimit = false;
	
	inClique.resize(lutVec_in.size());
	for(i=0; i<inClique.size(); i++)
		inClique[i] = false;
	
	for(i=0; i<lutVec_in.size(); i++){
		foundClique.clear();
		foundClique.insert(i);
		inputSet[1].clear();
		addInputs(inputSet[1], lutVec_in[i]);
		cliques6_in[1].push_back(foundClique);
		cliqueCount++;
		if(cliqueCount > 1000000) //memory usage is getting high
			limitSearch = true;
		if(cliqueCount > 8000000) //memory usage is getting really high
			hardLimit = true;
		if(forceDuplicate.count(lutVec_in[i]) != 0)
			continue;
		for(j=i+1; j<lutVec_in.size(); j++){
			if(forceDuplicate.count(lutVec_in[j]) != 0)
				continue;
			foundClique.insert(j);
			inputSet[2].clear();
			inputSet[2] = inputSet[1];
			addInputs(inputSet[2], lutVec_in[j]);
			if(inputSet[2].size() <= LUT_K-2) { //4-adjacencies
				cliques6_in[0].push_back(foundClique);
				cliqueCount++;
			} else if(inputSet[2].size() <= LUT_K){
				cliques6_in[2].push_back(foundClique);
				inClique[i] = true;
				inClique[j] = true;
				cliqueCount++;
			}
			if(maxSize == 2){
				foundClique.erase(j);
				continue;
			}
			
			if(inputSet[2].size() <= inputLimit){
				for(k=j+1; k<lutVec_in.size(); k++){
					if(forceDuplicate.count(lutVec_in[k]) != 0)
						continue;
					foundClique.insert(k);
					inputSet[3].clear();
					inputSet[3] = inputSet[2];
					addInputs(inputSet[3], lutVec_in[k]);
					if(inputSet[3].size() <= LUT_K){
						cliques6_in[3].push_back(foundClique);
						cliqueCount++;
					}
					if(cliqueCount > 8000000)
						hardLimit = true;
					if(maxSize == 3){
						foundClique.erase(k);
						continue;
					}
					if(inputSet[3].size() <= inputLimit){
						for(l=k+1; l<lutVec_in.size(); l++){
							if(forceDuplicate.count(lutVec_in[l]) != 0)
								continue;
							foundClique.insert(l);
							inputSet[4].clear();
							inputSet[4] = inputSet[3];
							addInputs(inputSet[4], lutVec_in[l]);
							if(inputSet[4].size() <= LUT_K){
								cliques6_in[4].push_back(foundClique);
								cliqueCount++;
							}
							if(maxSize == 4){
								foundClique.erase(l);
								continue;
							}
							if(inputSet[4].size() <= inputLimit){
								for(m=l+1; m<lutVec_in.size(); m++){
									if(forceDuplicate.count(lutVec_in[m]) != 0)
										continue;
									foundClique.insert(m);
									inputSet[5].clear();
									inputSet[5] = inputSet[4];
									addInputs(inputSet[5], lutVec_in[m]);
									if(inputSet[5].size() <= LUT_K){
										cliques6_in[5].push_back(foundClique);
										cliqueCount++;
									}
									if(maxSize == 5){
										foundClique.erase(m);
										continue;
									}
									
									if(inputSet[5].size() <= inputLimit){
										for(n=m+1; n<lutVec_in.size(); n++){
											if(forceDuplicate.count(lutVec_in[n]) != 0)
												continue;
											foundClique.insert(n);
											inputSet[6].clear();
											inputSet[6] = inputSet[5];
											addInputs(inputSet[6], lutVec_in[n]);
											if(inputSet[6].size() <= LUT_K){
												cliques6_in[6].push_back(foundClique);
												cliqueCount++;
											}
											if(maxSize == 6){
												foundClique.erase(n);
												continue;
											}
											if(inputSet[6].size() <= inputLimit){
												for(o=n+1; o<lutVec_in.size(); o++){
													if(forceDuplicate.count(lutVec_in[o]) != 0)
														continue;
													foundClique.insert(o);
													inputSet[7].clear();
													inputSet[7] = inputSet[6];
													addInputs(inputSet[7], lutVec_in[o]);
													if(inputSet[7].size() <= LUT_K){
														cliques6_in[7].push_back(foundClique);
														cliqueCount++;
													}
													foundClique.erase(o);
													if(o == n+3)
														break;
												}
											}
											foundClique.erase(n);
											if(n == m+3)
												break;
										}
									}
									
									foundClique.erase(m);
									if(limitSearch)
										break;
								}
							}
							foundClique.erase(l);
							if(limitSearch)
								break;
						}
					}
					foundClique.erase(k);
					if(hardLimit)
						break;
				}
			}
			foundClique.erase(j);
		}
	}
	
	cout << "Found " << cliques6_in[0].size() << " 4-adjacencies" << endl;			
	for(i=1; i<maxSize+1; i++)
		cout << "Found " << cliques6_in[i].size() << " " << i << "-cliques in G6" << endl;
	
		
	for(j=0; j<cliques6_in[0].size(); j++){
		if(cliques6_in[0][j].size() != 2)
			cout << "4-adj with " << cliques6_in[0][j].size() << " luts" << endl;
	}
	for(i=1; i<maxSize+1; i++){
		for(j=0; j<cliques6_in[i].size(); j++){
			if(cliques6_in[i][j].size() != i)
				cout << i << "-clique with " << cliques6_in[i][j].size() << " luts in G6" << endl;
		}
	}
	
	unsigned unjoinableCnt = 0;
	for(i=0; i<inClique.size(); i++)
		if(!inClique[i])
			unjoinableCnt++;
	cout << "Unjoinable LUTs: " << unjoinableCnt << endl;
}

/**************************************************************************************************/
//adds the inputs of a LUT to the set
void ftXilinx::addInputs(set<unsigned> &inputSet, Lut* l){
	int i;

	for(i=0; i<l->inputs.size(); i++)
		inputSet.insert(l->inputs[i]->id);

}

/**************************************************************************************************/
void ftXilinx::setCover(vector<vector<set<unsigned> > > &selectedCliques_in, vector<vector<set<unsigned> > > &cliques6_in, vector<Lut*> &lutVec_in, int maxSize){
	vector<vector<unsigned char > > coverVec6; //how many unprotected LUTs are covered by each subset
	vector<bool> visitedSize6; //if a given clique size (the same index on "cliques") was already visited by
	
	int i, j;
	
	coverVec6.resize(maxSize+1);
	selectedCliques_in.resize(maxSize+1);
	visitedSize6.resize(maxSize+1);
	
	
	for(i=0; i<maxSize+1; i++){
		selectedCliques_in[i].clear();
		visitedSize6[i] = false;
		coverVec6[i].resize(cliques6_in[i].size());
			
		if(i != 0)
			for(j=0; j<coverVec6[i].size(); j++)
				coverVec6[i][j] = i; //each clique initially covers its own size
		else
			for(j=0; j<coverVec6[i].size(); j++)
				coverVec6[i][j] = 2; //"fourAdjs" are stored here
	}
	
	unpairedDCheck.clear();
	for(i=maxSize; i>0; i--){
		if(i != 2 || !options[OPT_MMATCH]) {
			for(j=0; j<coverVec6[i].size(); j++)
				if(coverVec6[i][j] == i){
					if(i > 1 || !options[OPT_AGGRESSIVE] || lutVec_in[*(cliques6_in[i][j].begin())]->inputs.size() == LUT_K)
						selectedCliques_in[i].push_back(cliques6_in[i][j]);
					else
						unpairedDCheck.push_back(lutVec_in[*(cliques6_in[i][j].begin())]);
						
					if(i > 1)
						updateCoverVec(coverVec6, visitedSize6, cliques6_in[i][j], cliques6_in, maxSize);
				}
			visitedSize6[i] = true;
			cout << "Selected " << selectedCliques_in[i].size() << " " << i << "-cliques." << endl;
		} else {
			SmartGraph jGraph;
			vector<SmartGraph::Node> lutsVec;
			SmartGraph::EdgeMap<unsigned> edgeIdMap(jGraph);
			MaxMatching<SmartGraph> maxMatch(jGraph);
			unsigned nodes[2];
			unsigned k;
			lutsVec.clear();
		
			for(j=0; j<lutVec_in.size(); j++)
				lutsVec.push_back(jGraph.addNode());
			
			for(j=0; j<coverVec6[i].size(); j++)
				if(coverVec6[i][j] == i){
					k = 0;
					foreach(unsigned node, cliques6_in[i][j])
						nodes[k++] = node;
					SmartGraph::Edge newEdge = jGraph.addEdge(lutsVec[nodes[0]], lutsVec[nodes[1]]);
					edgeIdMap[newEdge] = j;
				}
		
			maxMatch.run();
		
			for (SmartGraph::EdgeIt e(jGraph); e != INVALID; ++e)
				if(maxMatch.matching(e)){
					selectedCliques_in[i].push_back(cliques6_in[i][edgeIdMap[e]]);
					updateCoverVec(coverVec6 , visitedSize6, cliques6_in[i][edgeIdMap[e]], cliques6_in, maxSize);
				}
			visitedSize6[i] = true;
			cout << "Selected " << selectedCliques_in[i].size() << " " << i << "-cliques. (lemon Max Match)" << endl;
		}
	}
	
	if(options[OPT_AGGRESSIVE])
		cout << "Selected " << unpairedDCheck.size() << " unpaired LUTs with " << LUT_K-1 << " or less inputs" << endl;
}

/**************************************************************************************************/
void ftXilinx::updateCoverVec(vector<vector<unsigned char> > &coverVec, vector<bool> &visitedSize, set<unsigned> &clique, vector<vector<set<unsigned> > > &cliques, int maxSize){
	int i, j;
	
	for(i=0; i<maxSize+1; i++){
		if(!visitedSize[i])
			for(j=0; j<cliques[i].size(); j++)
				foreach(unsigned node, clique)
					if(cliques[i][j].count(node) != 0)
						coverVec[i][j]--;
	}			
}
/**************************************************************************************************/
unsigned int ftXilinx::cost(){

	unsigned retCost, i;
	
	retCost = selectedCliques[1].size(); //unpaired LUTs must be duplicated
	
	if(!options[OPT_DWCF])
		retCost += selectedCliques[2].size(); //each selected 2-clique requires 1 for parity prediction
	
	if(options[OPT_CCHAIN]) {
		//each cChainChecker generates 1 error signal
		errorsCnt = cChainCheckers.size();
		errorsCnt += stackedCheckerCnt; //each checker contains 2 sets
		if(!options[OPT_DWCF]){
			retCost += selectedCliquesMuxFx[1].size() + selectedCliquesMuxFx[2].size();
			//Traditional checking performed for MUXF7-associated LUTs
			retCost += ceil(((double)(selectedCliquesMuxFx[1].size()*2 + selectedCliquesMuxFx[2].size()*3)) / ((double)LUT_K));
			errorsCnt += ceil(((double)(selectedCliquesMuxFx[1].size()*2 + selectedCliquesMuxFx[2].size()*3)) / ((double)LUT_K));		
		} else {
			retCost += selectedCliquesMuxFx[1].size();
			//Traditional checking performed for MUXF7-associated LUTs
			retCost += ceil(((double)(selectedCliquesMuxFx[1].size()*2)) / ((double)LUT_K));
			errorsCnt += ceil(((double)(selectedCliquesMuxFx[1].size()*2)) / ((double)LUT_K));
		}
	} else {
		//adds the checkers for 1- and 2- cliques (shared checkers)
		//only the unpaired with 6 inputs need a checker
		if(!options[OPT_DWCF]){
			retCost += ceil(((double)(selectedCliques[1].size()*2 + selectedCliques[2].size()*3)) / ((double)LUT_K));
			//each checker generates one error signal
			errorsCnt = ceil(((double)(selectedCliques[1].size()*2 + selectedCliques[2].size()*3)) / ((double)LUT_K));
			if(options[OPT_DUPLICATE_MUXES])
				errorsCnt += ceil(((double)(selectedCliquesMuxFx[1].size()*2)) / ((double)LUT_K));
		} else {
			retCost += ceil(((double)(selectedCliques[1].size()*2)) / ((double)LUT_K));
			//each checker generates one error signal
			if(options[OPT_FF_INPUT_CMP])
				errorsCnt = ceil(((double)((circ->ffs.size() + circ->POs.size() + circ->sets.size() - circ->constInputFFs)*2)) / ((double)LUT_K));
			else
				errorsCnt = ceil(((double)(selectedCliques[1].size()*2)) / ((double)LUT_K));
		}
	}
		
	retCost += selectedCliques[0].size(); //four-adjs are protected with 1 extra LUT
	errorsCnt += selectedCliques[0].size(); //and generate 1 error signal each
	retCost += unpairedDCheck.size(); //same thing four unpaired LUTs with up to LUT_K-1 inputs
	errorsCnt += unpairedDCheck.size();
	
	if(!options[OPT_DWCF]) {
		if(options[OPT_CCHAIN]) {
			for(i=3; i<maxGroupSize+1; i++)
				retCost += 1 * selectedCliques[i].size(); //each clique requires only parity prediction
			//Traditional checking performed for MUXF7-associated LUTs
			for(i=3; i<LUT_K; i++){
				retCost += 2 * selectedCliquesMuxFx[i].size(); //each clique must be protected by two LUTs
				errorsCnt += selectedCliquesMuxFx[i].size(); //and generates 1 error signal
			}
		} else {
			for(i=3; i<maxGroupSize+1; i++){
				retCost += 2 * selectedCliques[i].size(); //each clique must be protected by two LUTs
				errorsCnt += selectedCliques[i].size(); //and generates 1 error signal
			}
		}
	}
	
	if(options[OPT_D_ADDERS])
		costFromAdders(&retCost, &errorsCnt);
		
	if(options[OPT_CMUX]){
		retCost += muxFxCheckers;
		errorsCnt += muxFxCheckers;
	}
		
	
	cout << "Cost without error combination: " << retCost << endl;
	
	//error combination => giant OR built of LUTs
	retCost += ceil(((double) (errorsCnt - 1)) / ((double) (LUT_K - 1)));
	
	cout << "Cost with error combination: " << retCost << endl;
	
	return retCost;
}

/**************************************************************************************************/
void ftXilinx::costFromAdders(unsigned *retCost, unsigned *errorsCnt){
	unsigned signalsToCheck=0, lutsToDuplicate=0, checkerLuts=0;
	
	foreach(set<Component*> adder, adders)
		foreach(Component* comp, adder){
			if(comp->type == LUT)
				lutsToDuplicate++;
				
			if(comp->outputs[0]->isPO){
				signalsToCheck++;
			} else {
				//searches for a component in the output that lies outside the adder
				foreach(Component* loadComp, comp->outputs[0]->outputs)							
					if(adder.count(loadComp) == 0){
						signalsToCheck++;
						break;
					}
			}
		}
		
	checkerLuts = ceil( ( (double) (2*signalsToCheck) ) / ((double) LUT_K) );
	*retCost = *retCost + checkerLuts + lutsToDuplicate;
	if(!options[OPT_FF_INPUT_CMP])
		*errorsCnt = *errorsCnt + checkerLuts;
}
/**************************************************************************************************/
void ftXilinx::findAdders(){
	bool foundAdder, addedMux;
	set<Component*> foundMuxes;
	set<Component*> newAdder;
	Component *adderMux, *nextMux, *prevComp;
	
	foundMuxes.clear();
	adders.clear();
	do {
		foundAdder=false;
		foreach(Component* comp, circ->components)
			if(comp->type == MUXCY && foundMuxes.count(comp) == 0){
				//found a MUXCY, checks if its CI input is also connected to a XOR
				foreach(Component* loadComp, comp->inputs[0]->outputs)
					if(loadComp->type == XORCY){
						foundAdder=true;
						break;
					}
				if(foundAdder){
					adderMux = comp;		
					newAdder.clear();
					newAdder.insert(adderMux);
					foundMuxes.insert(adderMux);
					break;	
				}
			}
			
		if(foundAdder){
			//builds the chain moving forward
			nextMux = adderMux;
			do{
				addedMux=false;
				//searches for a MUX at the output of this node
				foreach(Component* loadComp, nextMux->outputs[0]->outputs)
					if(loadComp != NULL && loadComp->type == MUXCY){
						newAdder.insert(loadComp);
						foundMuxes.insert(loadComp);
						nextMux = loadComp;
						addedMux = true;
						break;
					}
			} while(addedMux);
			
			//builds the chain moving backwards
			nextMux = adderMux;
			do{
				addedMux=false;
				//searches for a MUX at the CI input of this MUX
				prevComp = nextMux->inputs[0]->input;
				if(prevComp != NULL && prevComp->type == MUXCY){
					newAdder.insert(prevComp);
					foundMuxes.insert(prevComp);
					nextMux = prevComp;
					addedMux = true;
				}
			} while(addedMux);
			
			cout << "Found a " << newAdder.size() << "-bit adder" << endl;
			foreach(Component *mux, newAdder)
				if(mux->type == MUXCY){
					newAdder.insert(mux->inputs[2]->input); //inserts the LUT
					//checks if there is a XOR at the output or sharing an input
					//most XORs are added twice, but that's not a problem because the set
					//will only hold one copy
					foreach(Component *comp, mux->inputs[0]->outputs)
						if(comp->type == XORCY){
							newAdder.insert(comp);
							newAdder.insert(comp->inputs[1]->input); //inserts the LUT in the LI input
							break;
						}
					foreach(Component *comp, mux->outputs[0]->outputs)
						if(comp->type == XORCY){
							newAdder.insert(comp);
							newAdder.insert(comp->inputs[1]->input); //inserts the LUT in the LI input
							break;
						}
				}
			adders.push_back(newAdder);
		}	
	} while(foundAdder);
	
}
/**************************************************************************************************/
void ftXilinx::removeAdders(){
	int i;
	set<unsigned> idxSet;
	set<unsigned>::reverse_iterator rit;
	
	//removes LUTs
	idxSet.clear();
	foreach(set<Component*> adder, adders)
		foreach(Component* comp, adder)
			if(comp->type == LUT)
				idxSet.insert(comp->id);
				
	cout << "LUTs in the adder: " << idxSet.size() << endl;
	//removes the LUTs from the end to the beginning
	for(rit = idxSet.rbegin(); rit != idxSet.rend(); rit++)
		circ->luts.erase(circ->luts.begin()+(*rit));
	
	for(i=0; i<circ->luts.size(); i++)
		circ->luts[i]->id = i;
		
	//removes other components
	idxSet.clear();
	foreach(set<Component*> adder, adders){
		foreach(Component* comp, adder){
			if(comp->type != LUT)
				idxSet.insert(comp->id);
		}
	}
	//removes the other components from the end to the beginning
	for(rit = idxSet.rbegin(); rit != idxSet.rend(); rit++)
		circ->components.erase(circ->components.begin()+(*rit));
	
	for(i=0; i<circ->components.size(); i++)
		circ->components[i]->id = i;
}

/**************************************************************************************************/
void ftXilinx::generateProximityVectors(vector<vector<set<unsigned> > > &selectedCliques_in, vector<Lut*> &lutVec_in,
		vector<vector<int> > &proximity1, vector<vector<int> > &proximity2){
	int i, j;
	
	//generates the proximity factor for all pairs of 2-cliques
	if(selectedCliques_in.size() > 2){
		proximity2.resize(selectedCliques_in[2].size());
		for(i=0; i<proximity2.size(); i++)
			proximity2[i].resize(selectedCliques_in[2].size());
		i=0;
	
		foreach(set<unsigned> clique1, selectedCliques_in[2]){
			j=0;
			foreach(set<unsigned> clique2, selectedCliques_in[2])
				proximity2[i][j++] = getProximityFactor(clique1, clique2, lutVec_in);
			i++;
		}
	}
	//generates the proximity factor for 1-cliques

	proximity1.resize(selectedCliques_in[1].size());
	for(i=0; i<proximity1.size(); i++)
		proximity1[i].resize(selectedCliques_in[1].size());
	
	i=0;
	foreach(set<unsigned> clique1, selectedCliques_in[1]){
		j=0;
		foreach(set<unsigned> clique2, selectedCliques_in[1])
			proximity1[i][j++] = getProximityFactor(clique1, clique2, lutVec_in);
		i++;
	}
}

/**************************************************************************************************/
unsigned ftXilinx::getProximityFactor(const set<unsigned> &clique1, const set<unsigned> &clique2, vector<Lut*> &lutVec_in){
	unsigned retVal = 0;
	unsigned i, j;
	
	foreach(unsigned node1, clique1)
		foreach(unsigned node2, clique2){
			for(i=0; i<lutVec_in[node1]->inputs.size(); i++){
				for(j=0; j<lutVec_in[node2]->inputs.size(); j++) //compares outputs
					if(lutVec_in[node1]->inputs[i] == lutVec_in[node2]->inputs[j])
						retVal++;
				//compares inputs with output
			if(lutVec_in[node1]->inputs[i] == lutVec_in[node2]->outputs[0])
				retVal++;
			}
			//compares inputs with output
			for(j=0; j<lutVec_in[node2]->inputs.size(); j++)
				if(lutVec_in[node2]->inputs[j] == lutVec_in[node1]->outputs[0])
					retVal++;
		}
		
	return retVal;
}

/**************************************************************************************************/
//converts a set of identifiers into a set com component pointers
void ftXilinx::idSet2PtSet(set<unsigned> &idSet, set<Component*> &compSet, vector<Lut*> &lutVec_in){
	compSet.clear();
	foreach(unsigned node, idSet){
		if(node >= lutVec_in.size()){
			cout << "node = " << node << "; size() = " << lutVec_in.size() << endl;
			exit(0);
		}
		compSet.insert(lutVec_in[node]);
	}
}
/**************************************************************************************************/
void ftXilinx::generateSharedCheckers(vector<vector<set<unsigned> > > &selectedCliques_in, vector<Lut*> &lutVec_in, vector<vector<int> > &proximity1, vector<vector<int> > &proximity2){
	int maxProx;
	set<set<Component*> > sCheck;
	set<Component*> compSet;
	vector<bool> joined1, joined2;
	int i, j, k, l;
	unsigned idx1, idx2, idx3;
	
	if(selectedCliques_in.size() > 2){
		joined2.clear();
		joined2.resize(selectedCliques_in[2].size());
	
		for(i=0; i<joined2.size(); i++)
			joined2[i] = false;
	
		//greedy approach to join groups with high proximity
		for(i=0; i<selectedCliques_in[2].size()/2; i++){
			sCheck.clear();
			maxProx = -1;
			for(j=0; j<selectedCliques_in[2].size()-1; j++)
				if(!joined2[j])
					for(k=j+1; k<selectedCliques_in[2].size(); k++)
						if(!joined2[k] && proximity2[j][k] > maxProx){
							idx1 = j;
							idx2 = k;
							maxProx = proximity2[j][k];
						}
			idSet2PtSet(selectedCliques_in[2][idx1], compSet, lutVec_in);
			sCheck.insert(compSet);
			idSet2PtSet(selectedCliques_in[2][idx2], compSet, lutVec_in);
			sCheck.insert(compSet);
			joined2[idx1] = true;
			joined2[idx2] = true;
			sharedCheckers.push_back(sCheck);
		}
	}
	
	joined1.clear();
	joined1.resize(selectedCliques_in[1].size());

	if(options[OPT_AGGRESSIVE] && !options[OPT_CCHAIN])
		for(i=0; i<joined1.size(); i++) //1-cliques with less than LUT_K inputs start "joined"
			joined1[i] = circ->luts[*(selectedCliques_in[1][i].begin())]->inputs.size() < LUT_K;
	else
		for(i=0; i<joined1.size(); i++)
			joined1[i] = false;
	
	//repeats the same for 1-cliques
	//this may be slow for large circuits with a lot of unpaired LUTs (such as when using DWC-Fine)
	for(i=0; i<selectedCliques_in[1].size()/3; i++){
		sCheck.clear();
		maxProx = -1;
		
		if(selectedCliques_in[1].size()/3 - i < 100){ //when close to the end, the exhaustive approach can be used
			//selects the maximal triangle in the "proximity1 graph"
			for(j=0; j<selectedCliques_in[1].size()-2; j++)
				if(!joined1[j])
					for(k=j+1; k<selectedCliques_in[1].size()-1; k++)
						if(!joined1[k])
							for(l=k+1; l<selectedCliques_in[1].size(); l++)
								if(!joined1[l] && (proximity1[j][k] + proximity1[j][l] + proximity1[k][l]) > maxProx){
									idx1 = j;
									idx2 = k;
									idx3 = l;
									maxProx = proximity1[j][k] + proximity1[j][l] + proximity1[k][l];
								}
		} else	{
			//first selects a maximal edge, and then the aditional vertex that maximizes the triangle
			maxProx = -1;
			for(j=0; j<selectedCliques_in[1].size()-1; j++)
				if(!joined1[j])
					for(k=j+1; k<selectedCliques_in[1].size(); k++)
						if(!joined1[k] && proximity1[j][k] > maxProx){
							idx1 = j;
							idx2 = k;
							maxProx = proximity1[j][k];
						}
			joined1[idx1] = true;
			joined1[idx2] = true;
			maxProx = -1;
			int tempProx;
			for(j=0; j<selectedCliques_in[1].size(); j++)
				if(!joined1[j]){
					//ensures that the first matrix index is the smaller number
					tempProx = (j < idx1) ? proximity1[j][idx1] : proximity1[idx1][j];
					tempProx += (j < idx2) ? proximity1[j][idx2] : proximity1[idx2][j];
					if(tempProx > maxProx){
						idx3 = j;
						maxProx = tempProx;
					}
				}					
		}
		idSet2PtSet(selectedCliques_in[1][idx1], compSet, lutVec_in);
		sCheck.insert(compSet);
		idSet2PtSet(selectedCliques_in[1][idx2], compSet, lutVec_in);
		sCheck.insert(compSet);
		idSet2PtSet(selectedCliques_in[1][idx3], compSet, lutVec_in);
		sCheck.insert(compSet);
		joined1[idx1] = true;
		joined1[idx2] = true;
		joined1[idx3] = true;
		sharedCheckers.push_back(sCheck);
	}
	
	
	
	if(selectedCliques_in.size() > 2 && (selectedCliques_in[2].size() % 2 == 1) && (selectedCliques_in[1].size() % 3 == 1)){
		//In this case, there is a checker that performs both parity checking and duplication comparison
		sCheck.clear();
		for(i=0; i<joined1.size(); i++)
			if(!joined1[i]){
				idSet2PtSet(selectedCliques_in[1][i], compSet, lutVec_in);
				sCheck.insert(compSet);
				joined1[i] = true;
				break;
			}
			
		for(i=0; i<joined2.size(); i++)
			if(!joined2[i]){
				idSet2PtSet(selectedCliques_in[2][i], compSet, lutVec_in);
				sCheck.insert(compSet);
				joined2[i] = true;
				break;
			}
		sharedCheckers.push_back(sCheck);
		return;
	}
	
	//if this point is reached, we have to check for groups that were not joined
	if(selectedCliques_in[1].size() % 3 != 0){
		sCheck.clear();
		for(i=0; i<joined1.size(); i++)
			if(!joined1[i]){
				idSet2PtSet(selectedCliques_in[1][i], compSet, lutVec_in);
				sCheck.insert(compSet);
				joined1[i] = true;
			}
		sharedCheckers.push_back(sCheck);
	}
	
	if(selectedCliques_in.size() > 2 && selectedCliques_in[2].size() % 2 == 1){
		sCheck.clear();
		for(i=0; i<joined2.size(); i++)
			if(!joined2[i]){
				idSet2PtSet(selectedCliques_in[2][i], compSet, lutVec_in);
				sCheck.insert(compSet);
				joined2[i] = true;
			}
		sharedCheckers.push_back(sCheck);
	}
}

/**************************************************************************************************/
void ftXilinx::buildDWC(vector<vector<set<unsigned> > > &selectedCliques_in, vector<Lut*> &lutVec_in){
	int i;
	set<unsigned> newUnpaired;
	
	selectedCliques_in.resize(2);
	
	for(i=0; i<2; i++)
		selectedCliques_in[i].clear();
	
	//When using DWC-Fine, all LUTs remain unpaired
	for(i=0; i<lutVec_in.size(); i++){
		newUnpaired.clear();
		newUnpaired.insert(lutVec_in[i]->id);
		selectedCliques_in[1].push_back(newUnpaired);
	}
}

/**************************************************************************************************/
void ftXilinx::generateDuplicatedFFs(){
	duplicatedFFs.clear();
	foreach(FlipFlop* ff, circ->ffs)
		duplicatedFFs.push_back(duplicateFF(ff));
}
/**************************************************************************************************/
void ftXilinx::generateDuplicatedNets(){
	unsigned nextId = 0;
	unsigned nextFFId = 0;
	bool addedMux;
	Net* newNet;
	duplicatedNet.clear();
	char buf[128];
	
	rstPICnt = 0;
	//duplicated PIs
	if(options[OPT_DUPLICATE_PI]){
		int i=0;
		foreach(Net* pi, circ->PIs){
			if(circ->clocks.count(pi) == 0){ //only duplicates non-clock nets
				if(circ->resets.count(pi) == 0)
					snprintf(buf, 128, "inputs_copy(%d)", i++);
				else
					snprintf(buf, 128, "rst_copy_%d", rstPICnt++);
					
				newNet = new Net(buf, 0);
				duplicatedNet[pi] = newNet;
			}
		}
	}
	
	//duplicated LUTs
	foreach(set<unsigned> clique, selectedCliques[1]){
		Lut* lut = circ->luts[*(clique.begin())];
		if(!options[OPT_AGGRESSIVE] || lut->inputs.size() == LUT_K){
		
			snprintf(buf, 128, "unpaired_LUTs_DWC(%d)", nextId++); 
			newNet = new Net(buf, 0);
		
			duplicatedNet[lut->outputs[0]] = newNet;
		}
	}
	
	//duplicated FFs
	if(options[OPT_DWCF])
		foreach(FlipFlop* ff, circ->ffs){
			snprintf(buf, 128, "duplicated_FF_Q(%d)", nextFFId++);
			newNet = new Net(buf, 0);
		
			duplicatedNet[ff->outputs[0]] = newNet; 
		}
	
	if(options[OPT_CCHAIN] || options[OPT_DUPLICATE_MUXES]){
		foreach(set<unsigned> clique, selectedCliquesMuxFx[1]){
			Lut* lut = lutsWithMuxF7[*(clique.begin())];
			if(!options[OPT_AGGRESSIVE] || lut->inputs.size() == LUT_K){
		
				snprintf(buf, 128, "unpaired_LUTs_DWC(%d)", nextId++); 
				newNet = new Net(buf, 0);
		
				duplicatedNet[lut->outputs[0]] = newNet;
			}
		}
	}
	//duplicated adders
	nextId = 0;
	if(options[OPT_D_ADDERS]){
		foreach(set<Component*> adder, adders)
				foreach(Component* comp, adder){
					snprintf(buf, 128, "duplicated_adders(%d)", nextId++);
					newNet = new Net(buf, 0);
					duplicatedNet[comp->outputs[0]] = newNet;
				}
	}
}	

/**************************************************************************************************/
void ftXilinx::generateDuplicatedMuxFx(){
	//function muxes (MUXF7 and MUXF8) may be duplicated if the I inputs (not the selection signal)
	//have duplicated nets. duplicating a MUXFx with a non-duplicated input would create a route-through LUT
	unsigned nextDWCId = 0;
	bool addedMux;
	duplicatedMuxFx.clear();
	//first with MUXF7
	do {
		addedMux = false;
		foreach(Component* comp, circ->components)
			if(comp->type == MUXF7 && (duplicatedNet.count(comp->inputs[0]) == 1 || comp->inputs[0]->value != VARSIG)
					       && (duplicatedNet.count(comp->inputs[1]) == 1 || comp->inputs[1]->value != VARSIG)
					       && duplicatedNet.count(comp->outputs[0]) == 0){ //if this mux was not duplicated already
				duplicatedMuxFx.push_back(duplicateMuxFx(comp, nextDWCId));
				nextDWCId++;
				addedMux = true;
			}
	} while(addedMux);
	//repeats with MUXF8
	do {
		addedMux = false;
		foreach(Component* comp, circ->components)
			if(comp->type == MUXF8 && (duplicatedNet.count(comp->inputs[0]) == 1 || comp->inputs[0]->value != VARSIG)
					       && (duplicatedNet.count(comp->inputs[1]) == 1 || comp->inputs[1]->value != VARSIG)
					       && duplicatedNet.count(comp->outputs[0]) == 0){ //if this mux was not duplicated already
				duplicatedMuxFx.push_back(duplicateMuxFx(comp, nextDWCId));
				nextDWCId++;
				addedMux = true;
			}
	} while(addedMux);
	
	//checks if the S signal now has a copy (if it already was a copy, then it certainly does not have one)
	foreach(Mux* muxf, duplicatedMuxFx){
		if(duplicatedNet.count(muxf->inputs[2]) == 1)
			muxf->inputs[2] = duplicatedNet[muxf->inputs[2]];
	}
}

/**************************************************************************************************/
void ftXilinx::generateCED(vector<vector<set<unsigned> > > &selectedCliques_in, vector<Lut*> &lutVec_in, int maxSize){
	unsigned i, j;
	unsigned nextCheckId;
	Lut* newCheck;
	Lut* newPred;
	char buf[128];
	
	nextErrorId = 0;
	
	nextCheckId = 0;
	if(options[OPT_AGGRESSIVE])
		foreach(Lut* l, unpairedDCheck){
			snprintf(buf, 128, "unpairedDChecker_%d", nextCheckId++);
			l->checker = genUnpairedDCheck(l, buf);
		}
	
	//4-adjacencies have only checker
	nextCheckId = 0;
	foreach(set<unsigned> clique, selectedCliques_in[0]){
		snprintf(buf, 128, "checker4Adj_%d", nextCheckId++);
		newCheck = gen4AdjChecker(clique, buf, lutVec_in); 
		//newCheckName.assign(buf);
		foreach(unsigned node, clique)
			lutVec_in[node]->checker = newCheck;
			//comp2check[lutVec_in[node]] = newCheckName;
	}
	
	//1- and 2- cliques use shared checkers
	nextCheckId = 0;
	foreach(set<set<Component*> > sCheck, sharedCheckers){
		foreach(set<Component*> clique, sCheck){
			if(clique.size() == 1) { //unpaired
				snprintf(buf, 128, "%s_copy", (*clique.begin())->name.c_str());
				newPred = genUnpairedCopy((Lut*) *(clique.begin()), buf);
			} else { //2-clique
				snprintf(buf, 128, "parityPred_2_%d", nextPredId);
				newPred = genParityPred(clique, buf);
			}
			foreach(Component* comp, clique)
				comp->pred = newPred; //i will need this to generate the shared checker
		}
		snprintf(buf, 128, "sharedParityCheck_%d", nextCheckId++); 
		newCheck = genSharedChecker(sCheck, buf);
		foreach(set<Component*> clique, sCheck)
			foreach(Component* comp, clique)
				comp->checker = newCheck;
	}
	
	//the remaining cliques
	if(!options[OPT_DWCF])
		for(i=3; i<maxSize+1; i++){
			nextCheckId = 0;
			foreach(set<unsigned> clique, selectedCliques_in[i]){
				snprintf(buf, 128, "parityPred_%d_%d", i, nextPredId);
				newPred = genParityPred(clique, buf, lutVec_in);
				snprintf(buf, 128, "parityCheck_%d_%d", i, nextCheckId++);
				newCheck = genParityCheck(clique, newPred->outputs[0], buf, lutVec_in);
				foreach(unsigned node, clique){
					lutVec_in[node]->checker = newCheck;
					lutVec_in[node]->pred = newPred;				
				}
			}
		}
}
/**************************************************************************************************/
void ftXilinx::generateCChainCED(vector<vector<set<unsigned> > > &selectedCliques_in, vector<Lut*> &lutVec_in){
	unsigned checkedLUTs = 0;
	vector<unsigned> nextClique;
	vector<Lut*> newChecker, newChecker2;
	vector<Adder*> newGroupChecker;
	int i, j, k;
	int nextCheckId;
	char buf[128];
	Lut* newPred;
	Adder* newAdder;
	Net* newNet;
	bool insert = false;
	
	//Predictors must be generated
	for(i=1; i<maxGroupSize+1; i++){
		foreach(set<unsigned> clique, selectedCliques_in[i]){
			if(i == 1) {
				snprintf(buf, 128, "%s_copy", lutVec_in[*(clique.begin())]->name.c_str());
				newPred = genUnpairedCopy(clique, buf, lutVec_in);
			} else {
				snprintf(buf, 128, "parityPred_%d_%d", i, nextPredId);
				newPred = genParityPred(clique, buf, lutVec_in);
			}
			calculateDepth(newPred);
			foreach(unsigned node, clique)
				lutVec_in[node]->pred = newPred;
		}
	}
	
	cChainGroups.clear();
	nextClique.resize(maxGroupSize+1);
	for(i=0; i<maxGroupSize+1; i++)
		nextClique[i] = 0;
	
	if(!options[OPT_DWCF] || !options[OPT_SPLIT_CHECK] || maxCheckerSize != 4){
		//first attempt: anarchic joining
		while(checkedLUTs < lutVec_in.size()){
			newChecker.clear();
			for(i=maxGroupSize; i>0; i--){
				//while there's still a clique with this size and it fits in the checker
				while(nextClique[i] < selectedCliques_in[i].size() && newChecker.size() < maxCheckerSize-i){
					checkedLUTs += i;
					//FW: is this the best place to put the predictor? (in terms of the routing reliability...)
					newChecker.push_back((Lut*) lutVec_in[*(selectedCliques_in[i][nextClique[i]].begin())]->pred);
					foreach(unsigned node, selectedCliques_in[i][nextClique[i]])
						newChecker.push_back(lutVec_in[node]);
					nextClique[i]++;
				}
			}
			sortByDepth(newChecker);
			cChainGroups.push_back(newChecker);
		}
	} else {
		//this is a special case (trying to minimize the amount of net intersections)
		SmartGraph jGraph;
		vector<SmartGraph::Node> nodeVec;
		SmartGraph::NodeMap<unsigned> nodeIdMap(jGraph);
		MaxMatching<SmartGraph> maxMatch(jGraph);
		vector<bool> inChecker;
	
		nodeVec.clear();
		inChecker.resize(selectedCliques_in[1].size());
		for(i=0; i<selectedCliques_in[1].size(); i++){
			SmartGraph::Node newNode = jGraph.addNode();
			nodeIdMap[newNode] = i;
			nodeVec.push_back(newNode);
			inChecker[i] = false;
		}
	
		for(i=0; i<selectedCliques_in[1].size(); i++)
			for(j=i+1; j<selectedCliques_in[1].size(); j++)
				if(getProximityFactor(selectedCliques_in[1][i], selectedCliques_in[1][j], lutVec_in) == 0)
					jGraph.addEdge(nodeVec[i], nodeVec[j]);
				
		maxMatch.run();

		for (SmartGraph::EdgeIt e(jGraph); e != INVALID; ++e)
			if(maxMatch.matching(e)){
				newChecker.clear();
				if(!insert || !options[OPT_STACK_CHECK])
					newChecker2.clear();
				inChecker[nodeIdMap[jGraph.u(e)]] = true;
				inChecker[nodeIdMap[jGraph.v(e)]] = true;
				newChecker.push_back(lutVec_in[*selectedCliques_in[1][nodeIdMap[jGraph.u(e)]].begin()]);
				newChecker.push_back(lutVec_in[*selectedCliques_in[1][nodeIdMap[jGraph.v(e)]].begin()]);
				sortByDepth(newChecker);
				newChecker.push_back((Lut*) newChecker[0]->pred);
				newChecker.push_back((Lut*) newChecker[1]->pred);
				if(!insert || !options[OPT_STACK_CHECK]){
					newChecker2.push_back((Lut*) NULL);
					newChecker2.push_back((Lut*) NULL);
				}
				for(i=0; i<newChecker.size(); i++)
					newChecker2.push_back(newChecker[i]);
				if(insert || !options[OPT_STACK_CHECK]){
					//sortByDepth(newChecker2); //sorting (-delay =], -coverage =[)
					cChainGroups.push_back(newChecker2);
				}
				insert = not insert;				
			}
			
		if(insert && options[OPT_STACK_CHECK])
			cChainGroups.push_back(newChecker2);
		
		cout << "LUTs with no input net intersection: " << cChainGroups.size()*2 << endl;
		insert = false;
		for(i=0; i<selectedCliques_in[1].size(); i++)
			if(!inChecker[i]){
				if(!insert || !options[OPT_STACK_CHECK]){
					newChecker.clear();
					newChecker.push_back((Lut*) NULL);
				}
				newChecker.push_back((Lut*) NULL);
				newChecker.push_back((Lut*) NULL);
				newChecker.push_back(lutVec_in[*selectedCliques_in[1][i].begin()]);
				newChecker.push_back((Lut*) newChecker[newChecker.size()-1]->pred);
				if(insert || !options[OPT_STACK_CHECK]){
					//sortByDepth(newChecker); //sorting (-delay =], -coverage =[)
					cChainGroups.push_back(newChecker);
				}
				insert = not insert;
			}
			
		if(insert && options[OPT_STACK_CHECK])
			cChainGroups.push_back(newChecker);
	}
	
	if(circ->vccNet == NULL){
		snprintf(buf, 128, "checkVccNet");
		circ->vccNet = new Net(buf, circ->nets.size());
		circ->vccNet->value = VCC;
		circ->nets.push_back(circ->vccNet);
	}
	
	if(circ->gndNet == NULL){
		snprintf(buf, 128, "checkGndNet");
		circ->gndNet = new Net(buf, circ->nets.size());
		circ->gndNet->value = GND;
		circ->nets.push_back(circ->gndNet);
	}
	
	vector<Net*> xorOut;
	Net* carryOut;
	//Net* open = new Net("open", 0);
	
	nextCChainNetId = 0;
	nextCheckId = 0;
	xorOut.resize(4);
	cChainCheckers.clear();
	
	stackedCheckerCnt = 0;
	foreach(vector<Lut*> group, cChainGroups){
		newGroupChecker.clear();
		unsigned real_size = group.size();
		bool stacked = options[OPT_STACK_CHECK] && group.size() >= 9;
		if(stacked)
			stackedCheckerCnt++;
		foreach(Lut* l, group)
			if(l == NULL) real_size--;
		for(j=0; j<group.size(); j+=4){
			//instantiate a new checker stage (i.e., 4 LUTs or 1 slice)
			if(stacked)
				snprintf(buf, 128, "stacked_cChain_checker_%d_%ld", nextCheckId, group.size());
			else
				snprintf(buf, 128, "cChain_checker_%d", nextCheckId);
			newAdder = new Adder(buf, nextCheckId++);
			if(j == 0) {
				if(real_size % 2 == 0) {
					newAdder->inputs.push_back(circ->vccNet); //CI = 1
					newAdder->inputs.push_back(circ->vccNet); //CYINIT = 1
					if(group[0] != NULL)
						newAdder->inputs.push_back(circ->gndNet); //DI(0) = 0
					else //must make sure that '1' reaches the first used stage
						newAdder->inputs.push_back(circ->vccNet); //DI(0) = 1
				} else {
					newAdder->inputs.push_back(circ->gndNet); //CI = 0
					newAdder->inputs.push_back(circ->gndNet); //CYINIT = 0
					if(group[0] != NULL)
						newAdder->inputs.push_back(circ->vccNet); //DI(0) = 1
					else //must make sure that '0' reaches the first used stage
						newAdder->inputs.push_back(circ->gndNet); //DI(0) = 0
				}
			} else {
				newAdder->inputs.push_back(carryOut); //CI = carry from previous level
				newAdder->inputs.push_back(circ->gndNet); //CYINIT = 0
				if(j == group.size()-1)
					newAdder->inputs.push_back((real_size % 2 == 0) ? circ->gndNet : circ->vccNet);
				else
					newAdder->inputs.push_back(xorOut[3]); //DI(0) = xor from previous iteration
			}
			
			for(k=0; k<4; k++) //pushes the XOR outputs (O)
				if(k+j == group.size()-1 || (stacked && k+j+5 == group.size())) { //at position 4 for two stacked "unpaired pairs"
					snprintf(buf, 128, "errorVec(%d)", nextErrorId++);        //or 5 for two stacked "paired pairs"
					xorOut[k] = new Net(buf, 0);
					newAdder->outputs.push_back(xorOut[k]);
				} else {
					snprintf(buf, 128, "cChainNet(%d)", nextCChainNetId++); //these MAY be unconnected
					xorOut[k] = new Net(buf, 0);
					newAdder->outputs.push_back(xorOut[k]);
				}
			
			for(k=1; k<4; k++) //pushes the remaining DIs
				if(k+j < group.size()-1 && group[k+j-1] != NULL && !(stacked && k+j+4 == group.size())) //at position 5 for two stacked "unpaired pairs"
					newAdder->inputs.push_back(xorOut[k-1]);                                         //or 6 for two stacked "paired pairs"
				else
					if(k+j < group.size() && group[k+j] == NULL) //before the first LUT being checked
						newAdder->inputs.push_back((real_size % 2 == 0) ? circ->vccNet : circ->gndNet);
					else //from that point on (for those stages we don't take the XOR)
						newAdder->inputs.push_back((real_size % 2 == 0) ? circ->gndNet : circ->vccNet);
			
			for(k=0; k<4; k++) //pushes the S inputs
				if(k+j < group.size() && group[k+j] != NULL)
					newAdder->inputs.push_back(group[j+k]->outputs[0]);
				else
					newAdder->inputs.push_back(circ->gndNet);
				
			for(k=0; k<4; k++){ //pushes the COs
				snprintf(buf, 128, "cChainNet(%d)", nextCChainNetId++);
				carryOut = new Net(buf, 0);
				newAdder->outputs.push_back(carryOut);
			}
			newGroupChecker.push_back(newAdder);
		}
		cChainCheckers.push_back(newGroupChecker);
	}
}
/**************************************************************************************************/
//Straightforward insertion sort to sort the LUTs in a checker by their depths in the circuit (trying to reduce the final delay)
void ftXilinx::sortByDepth(vector<Lut*> &lutVec_in){
	int i, j;
	Lut* aux;
	vector<Lut*> vecNoNull;
	
	vecNoNull.clear();
	for(i=0; i<lutVec_in.size(); i++)
		if(lutVec_in[i] != NULL)
			vecNoNull.push_back(lutVec_in[i]);
	
	for(i=1; i<vecNoNull.size(); i++){
		aux = vecNoNull[i];
		j = i-1;
		while (1)
			if(vecNoNull[j]->depth > aux->depth){
				vecNoNull[j+1] = vecNoNull[j];
				j--;
				if(j < 0)
					break;
			} else {
				break;
			}
		vecNoNull[j+1] = aux;
	}
	
	j=0;
	for(i=0; i<lutVec_in.size(); i++)
		if(lutVec_in[i] != NULL)
			lutVec_in[i] = vecNoNull[j++];
}

/**************************************************************************************************/
void ftXilinx::generateMuxCheckers(){
	char buf[128];
	
	muxFxCheckers = 0;
	
	foreach(Component* comp, circ->components)
		if(comp->type == MUXF7 || comp->type == MUXF8)
			if(duplicatedNet.count(comp->outputs[0]) == 0){ //if this MUX was not duplicated, it needs checking
				snprintf(buf, 128, "muxfx_checker_%d", muxFxCheckers++);
				comp->checker = genMuxFxChecker(comp, buf);
			}
}
/**************************************************************************************************/
void ftXilinx::splitRouting(){
	Net* newNet;
	Lut* newLut;
	Net* button;
	vector<Component*> newVec;
	char buf[128];
	int i, j;
	vector<unsigned> copiesRequired;
	map<Net*, unsigned> cliqueInputs;
	pair<Net*, unsigned> p;
	
	copiesRequired.resize(circ->nets.size());
	for(i=0; i<copiesRequired.size(); i++)
		copiesRequired[i] = 0;
	
	foreach(set<unsigned> clique, selectedCliques[0]) //4-adjs always require exactly one replica per input net
		foreach(unsigned node, clique)
			foreach(Net* n, circ->luts[node]->inputs)
				copiesRequired[n->id] = 1;
	
	if(options[OPT_AGGRESSIVE])
		foreach(Lut* l, unpairedDCheck) //Unpaired LUTs with less than LUT_K inputs also require one replica
			foreach(Net* n, l->inputs)
				copiesRequired[n->id] = 1;
	
	for(i=1; i<maxGroupSize+1; i++) //other types require 1 copy per net usage
		foreach(set<unsigned> clique, selectedCliques[i]){
			cliqueInputs.clear();
			foreach(unsigned node, clique)
				foreach(Net* n, circ->luts[node]->inputs)
					if(cliqueInputs.count(n) == 1)
						cliqueInputs[n] += 1;
					else
						cliqueInputs[n] = 1;
				
			foreach(p, cliqueInputs)
				copiesRequired[(p.first)->id] = MAX(p.second, copiesRequired[(p.first)->id]);
		}
		
	if(options[OPT_D_ADDERS])
		foreach(set<Component*> adder, adders)
			foreach(Component* comp, adder)
				foreach(Net* n, comp->inputs)
					if(copiesRequired[n->id] == 0 && adder.count(n->input) == 0) //nets that come from outside the adder
						copiesRequired[n->id] = 1;
	
	//nets that already have a duplication require one copy less
	for(i=0; i<copiesRequired.size(); i++)
		if(circ->nets[i]->isPI)
			copiesRequired[i] = 0;
		else
			if(copiesRequired[i] > 0 && duplicatedNet.count(circ->nets[i]) != 0)
				copiesRequired[i]--;
	
	rSplitLuts.clear();
	splitLutsCnt = 0;
	
	snprintf(buf, 128, "inButton");
	button = new Net(buf, 0);
	for(i=0; i<copiesRequired.size(); i++){
		newVec.clear();
		
		for(j=0; j<copiesRequired[i]; j++){			
			snprintf(buf, 128, "splitLut_%d", splitLutsCnt);
			newLut = new Lut(buf, 0);
			//the first LUT takes the original Net as input
			newLut->inputs.push_back((j == 0) ? circ->nets[i] : newNet);
			newLut->inputs.push_back(button);
			snprintf(buf, 128, "splitNet(%d)", splitLutsCnt++);
			newNet = new Net(buf, 0);
			newLut->outputs.push_back(newNet);
			newLut->tableO6.resize(4);
			newLut->tableO6[0] = false;
			newLut->tableO6[1] = false;
			newLut->tableO6[2] = false;
			newLut->tableO6[3] = true;
			newVec.push_back(newLut);
		}
		
		if(copiesRequired[i] > 0)
			rSplitLuts[circ->nets[i]] = newVec;
	}
	
	cout << "\nCopies required for reliable routing: " << splitLutsCnt << endl;
}
/**************************************************************************************************/
//removes from the circuit the LUTs that use their associated MUXF7s
void ftXilinx::removeMuxFxLUTs(){
	int i;
	set<Lut*> lutsWithMuxF7set;
	
	lutsWithMuxF7.clear();
	lutsWithMuxF7set.clear();
	
	for(i=0; i<circ->components.size(); i++){
		if(circ->components[i]->type == MUXF7 || circ->components[i]->type == MUXF8){
			if(circ->components[i]->inputs[0]->value == VARSIG && !circ->components[i]->inputs[0]->isPI
				&& circ->components[i]->inputs[0]->input->type == LUT
				&& lutsWithMuxF7set.count((Lut*) circ->components[i]->inputs[0]->input) == 0){
				lutsWithMuxF7.push_back((Lut*) circ->components[i]->inputs[0]->input);
				lutsWithMuxF7set.insert((Lut*) circ->components[i]->inputs[0]->input);
			}
			if(circ->components[i]->inputs[1]->value == VARSIG && !circ->components[i]->inputs[1]->isPI
				&& circ->components[i]->inputs[1]->input->type == LUT
				&& lutsWithMuxF7set.count((Lut*) circ->components[i]->inputs[1]->input) == 0){
				lutsWithMuxF7.push_back((Lut*) circ->components[i]->inputs[1]->input);
				lutsWithMuxF7set.insert((Lut*) circ->components[i]->inputs[1]->input);
			}
		}
	}
	
	//removes the LUTs from the circuit list
	for(i=circ->luts.size()-1; i>=0; i--)
		if(lutsWithMuxF7set.count(circ->luts[i]) == 1)
			circ->luts.erase(circ->luts.begin() + i);
	
	//and corrects the IDs
	for(i=0; i<circ->luts.size(); i++)
		circ->luts[i]->id = i;

	for(i=0; i<lutsWithMuxF7.size(); i++)
		lutsWithMuxF7[i]->id = i;
		
	cout << "Removed " << lutsWithMuxF7.size() << " LUTs due to MUXF7" << endl;
	cout << "LUTs after removal: " << circ->luts.size() << endl;
}

/**************************************************************************************************/
void ftXilinx::calculateAllDepths(vector<Lut*> &lutsVec){
	int i;
	
	for(i=0; i<lutsVec.size(); i++)
		calculateDepth(lutsVec[i]);
}

/**************************************************************************************************/
void ftXilinx::calculateDepth(Component* comp){
	int i;
	
	if(comp->depth > 0.01) //component that already had its depth calculated
		return;
	
	for(i=0; i<comp->inputs.size(); i++)
		if((!comp->inputs[i]->isPI) && comp->inputs[i]->value == VARSIG && comp->inputs[i]->input->type != FDR
			&& comp->inputs[i]->input->type != FDRE && comp->inputs[i]->input->type != FDRS
			&& comp->inputs[i]->input->type != FDRSE){ //TODO make more elegant
			 //searches, among all preceding components, for the one with largest depth
			calculateDepth(comp->inputs[i]->input);
			if(comp->inputs[i]->input->depth + depthByType(comp->type) > comp->depth)
				comp->depth = comp->inputs[i]->input->depth + depthByType(comp->type);
		}
		
	if(comp->depth < 0.01) //this will only be true if all inputs are PIs or FFs
		comp->depth = depthByType(comp->type);
}
/**************************************************************************************************/
float ftXilinx::depthByType(compType type){
	switch(type){
		case LUT:
			return 1.0;
		default:
			return 0.0;
	}
}
/**************************************************************************************************/
void ftXilinx::findMuxesWithConstInput(){
	
	foreach(Component* comp, circ->components)
		if((comp->type == MUXF7 || comp->type == MUXF8)){
			if(comp->inputs[0]->value != VARSIG) //the LUT in the other input MUST be duplicated
				forceDuplicate.insert((Lut*)comp->inputs[1]->input);
			else if(comp->inputs[1]->value != VARSIG)
				forceDuplicate.insert((Lut*)comp->inputs[0]->input);
		}
		
	if(forceDuplicate.size() != 0)
		cout << forceDuplicate.size() << " LUTs must be duplicated due to MUXF7 usage" << endl;
}
/**************************************************************************************************/
void ftXilinx::insertOutputCmp(){
	int nextCheckId = 0;
	int i;
	vector<Net*> POVec;
	Net* PODriver;
	char buf[128];
	
	POVec.clear();
	POCheckers.clear();
	
	for(i=0; i<circ->POs.size(); i++){
		if(duplicatedNet.count(circ->POs[i]) == 0) { //if it has no replica, must search backwards
			if(circ->POs[i]->value != VARSIG) { //it may be a constant output...
				duplicatedNet[circ->POs[i]] = circ->POs[i];
			} else { //or generated by a short or buffer
				if(circ->POs[i]->input->type != BUF && circ->POs[i]->input->type != SHORT)
					cout << "PO " << circ->POs[i]->getName() << " with no replica" << endl;
				PODriver = circ->POs[i];
				
				while(!PODriver->isPI && PODriver->value == VARSIG && (PODriver->input->type == BUF || PODriver->input->type == SHORT))
					PODriver = PODriver->input->inputs[0];
					
				if(duplicatedNet.count(PODriver) != 0)
					duplicatedNet[circ->POs[i]] = duplicatedNet[PODriver];
				else
					duplicatedNet[circ->POs[i]] = PODriver;
			}
		}
		
		POVec.push_back(circ->POs[i]);
		if(POVec.size() == 3){
			snprintf(buf, 128, "PO_checker_%d", nextCheckId++); 
			POCheckers.push_back(genPOChecker(POVec, buf));
			POVec.clear();
		}
	}
	
	if(POVec.size() != 0){
		snprintf(buf, 128, "PO_checker_%d", nextCheckId++); 
		POCheckers.push_back(genPOChecker(POVec, buf));	
	}
}

