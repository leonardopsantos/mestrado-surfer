/*************************************************************************/
/*
 *  Algorithmic P-CED insertion for Xilinx FPGAs
 *  by Gabriel Luca Nazar <glnazar@inf.ufrgs.br>
 *
 */
/*************************************************************************/

#include "ftXilinx.h"

using namespace std;

//reorders a truth table according to a given input sorting
void ftXilinx::reorderTable(Lut* l, const set<Net*> &inputSet, vector<bool> &table){
	vector<int> positionMap; //maps one order to the other
	int i, j=0;
	int mapIdx;
	
	positionMap.resize(inputSet.size());
	table.resize(1 << inputSet.size());	
	
	for(i=0; i<positionMap.size(); i++)
		positionMap[i] = -1;
	
	//positionMap[position in common ordering] = position in the LUT or -1 if not in this LUT
	foreach(Net* n, inputSet){
		for(i=0; i<l->inputs.size(); i++)
			if(l->inputs[i] == n){ //the i-th LUT input is in the j-th position of the common set
				positionMap[j] = i;
				break;	
			}
		j++;
	}
	
	//iterates on the reordered table
	for(i=0; i<table.size(); i++){
		mapIdx=0;
		for(j=0; j<positionMap.size(); j++)
			if(positionMap[j] != -1)
				mapIdx |= (i & (1 << j)) ? (1 << positionMap[j]) : 0;
				
		if(mapIdx > l->tableO6.size()){
			cout << "mapIdx = " << mapIdx << endl;
			exit(0);
		}
		
		table[i] = l->tableO6[mapIdx];
	}
		
}
/**************************************************************************************************/
//creates a LUT to check 4-adjacencies
Lut* ftXilinx::gen4AdjChecker(set<unsigned> &clique, char* name, vector<Lut*> &lutVec_in){
	char netName[128];
	Lut* newLut;
	Net* outNet;
	set<Net*> inputSet;
	unsigned i, j, idx;
	vector<vector<bool> > reorderedTables;
	
	//snprintf(newName, 128, "checker4Adj_%d", nextLUTId++); 
	newLut = new Lut(name, 0);
	
	inputSet.clear();
	foreach(unsigned node, clique) //Inserts all inputs in the set to determine a common ordering
		for(i=0; i<lutVec_in[node]->inputs.size(); i++)
			inputSet.insert(lutVec_in[node]->inputs[i]);
	
	if(inputSet.size() > LUT_K-2)
		cout << "4-Adj with " << inputSet.size() << " inputs." << endl;
	
	reorderedTables.resize(2);
	i=0;
	//reorders the bits in all tables to meet with the common ordering
	foreach(unsigned node, clique){
		newLut->inputs.push_back(lutVec_in[node]->outputs[0]);
		reorderTable(lutVec_in[node], inputSet, reorderedTables[i++]);
	}
	
	//generates the checker table
	newLut->tableO6.resize(1 << (inputSet.size() + 2));
	
	for(i=0; i<newLut->tableO6.size(); i++){ //iterates on the checker table size
		newLut->tableO6[i] = false;
		for(j=0; j<reorderedTables.size(); j++)
			if( ((i & (1 << j)) != 0) != reorderedTables[j][i >> 2]){
				newLut->tableO6[i] = true; //this position indicates an error
				break;
			}
	}
	
	foreach(Net* n, inputSet)
		newLut->inputs.push_back(n);
	
	snprintf(netName, 128, "errorVec(%d)", nextErrorId++); 
	outNet = new Net(netName, 0);
	newLut->outputs.push_back(outNet);
	
	return newLut;
}
/**************************************************************************************************/
Lut* ftXilinx::genUnpairedDCheck(Lut* origLut, char* name){
	char newName[128];
	Lut *newLut;
	Net *outNet;
	int i;
	
	//Direct checking is possible
	newLut = new Lut(name, 0);
	newLut->inputs.push_back(origLut->outputs[0]);
	for(i=0; i<origLut->inputs.size(); i++)
		newLut->inputs.push_back(origLut->inputs[i]);
	newLut->tableO6.resize(2*origLut->tableO6.size());
	for(i=0; i<newLut->tableO6.size(); i++)
		if(origLut->tableO6[i >> 1] == ((i & 1) != 0)){ //if the LSB is equal to the value in the original table
			//not an error
			newLut->tableO6[i] = false;
		} else {
			//error identified
			newLut->tableO6[i] = true;
		}
	
	snprintf(newName, 128, "errorVec(%d)", nextErrorId++); 
	outNet = new Net(newName, 0);
	newLut->outputs.push_back(outNet);
	
	return newLut;
}

/**************************************************************************************************/
Lut* ftXilinx::genUnpairedCopy(set<unsigned> clique, char* name, vector<Lut*> &lutVec_in){
	
	return genUnpairedCopy(lutVec_in[*clique.begin()], name);
}

/**************************************************************************************************/
Lut* ftXilinx::genUnpairedCopy(Lut* origLut, char* name){
	char newName[128];
	Lut *newLut;
	Net *outNet;
	int i;

	newLut = new Lut(name, 0);
	
	for(i=0; i<origLut->inputs.size(); i++)
		newLut->inputs.push_back(origLut->inputs[i]);
		
	newLut->tableO6.resize(origLut->tableO6.size());
	for(i=0; i<newLut->tableO6.size(); i++)
		newLut->tableO6[i] = origLut->tableO6[i];
	
	newLut->outputs.push_back(duplicatedNet[origLut->outputs[0]]);
	
	return newLut;
}

/**************************************************************************************************/
//creates a parity prediction LUT for 2- to 5- cliques
Lut* ftXilinx::genParityPred(set<unsigned> clique, char* name, vector<Lut*> &lutVec_in){
	set<Component*> compSet;
	
	compSet.clear();
	
	foreach(unsigned node, clique)
		compSet.insert(lutVec_in[node]);
	
	return genParityPred(compSet, name);
}
/**************************************************************************************************/
//creates a parity prediction LUT for 2- to 5- cliques
Lut* ftXilinx::genParityPred(set<Component*> clique, char* name){
	char newName[128];
	Lut* newLut;
	Net* outNet;
	set<Net*> inputSet;
	unsigned i, j, idx;
	vector<vector<bool> > reorderedTables;
	
	newLut = new Lut(name, 0);
	
	inputSet.clear();
	foreach(Component* comp, clique) //Inserts all inputs in the set to determine a common ordering
		for(i=0; i<comp->inputs.size(); i++) 
			inputSet.insert(comp->inputs[i]);
	
	if(inputSet.size() > LUT_K)
		cout << clique.size() << "-clique with " << inputSet.size() << " inputs." << endl;
	
	reorderedTables.resize(clique.size());
	i=0;
	//reorders the bits in all tables to meet with the common ordering
	foreach(Component* comp, clique)
		reorderTable((Lut*) comp, inputSet, reorderedTables[i++]);
	
	//generates the checker table
	newLut->tableO6.resize(reorderedTables[0].size());
	
	for(i=0; i<newLut->tableO6.size(); i++){ //iterates on the checker table size
		newLut->tableO6[i] = false; //even parity
		for(j=0; j<reorderedTables.size(); j++)
			if(reorderedTables[j][i])
				newLut->tableO6[i] = !newLut->tableO6[i];
	}
	
	foreach(Net* n, inputSet)
		newLut->inputs.push_back(n);
	
	snprintf(newName, 128, "ftparity(%d)", nextPredId++); 
	outNet = new Net(newName, 0);
	newLut->outputs.push_back(outNet);
	
	return newLut;
}

/**************************************************************************************************/
//creates a parity (not shared) checker
Lut* ftXilinx::genParityCheck(set<unsigned> clique, Net *pNet, char* name, vector<Lut*> &lutVec_in){
	char newName[128];
	Lut* newLut;
	Net* outNet;
	unsigned i, j;
	
	newLut = new Lut(name, 0);
	
	foreach(unsigned node, clique){
		newLut->inputs.push_back(lutVec_in[node]->outputs[0]);
	}
	newLut->inputs.push_back(pNet);
	
	newLut->tableO6.resize(1 << (newLut->inputs.size()));
	
	for(i=0; i<newLut->tableO6.size(); i++){
		newLut->tableO6[i] = false;
		for(j=0; j<newLut->inputs.size(); j++)
			if((i & (1 << j)) != 0)
				newLut->tableO6[i] = !newLut->tableO6[i];
	}
	
	snprintf(newName, 128, "errorVec(%d)", nextErrorId++);
	outNet = new Net(newName, 0);
	newLut->outputs.push_back(outNet);
	
	return newLut;
}

/**************************************************************************************************/
//creates a shared checker
Lut* ftXilinx::genSharedChecker(const set<set<Component*> > &sCheck, char* name){
	char newName[128];
	Lut* newLut;
	Net* outNet;
	unsigned i, j;
	vector<unsigned> inputType; //input type: 2=Parity; 1=Comparison
	
	newLut = new Lut(name, 0);
	
	inputType.clear();
	foreach(set<Component*> clique, sCheck){
		if(clique.size() == 2) //2-clique with parity prediction
			newLut->inputs.push_back((*clique.begin())->pred->outputs[0]);
		else //1-clique with DWC
			newLut->inputs.push_back(duplicatedNet[(*clique.begin())->outputs[0]]);
		inputType.push_back(clique.size());
		foreach(Component* comp, clique){
			//2-cliques' checkers use replicated copies of inputs, when available
			if(clique.size() == 2 && duplicatedNet.count(comp->outputs[0]) != 0)
				newLut->inputs.push_back(duplicatedNet[comp->outputs[0]]);
			else
				newLut->inputs.push_back(comp->outputs[0]);
			inputType.push_back(clique.size());
		}
	}
	
	newLut->tableO6.resize(1 << (newLut->inputs.size()));
	
	for(i=0; i<newLut->tableO6.size(); i++){
		newLut->tableO6[i] = false;
		
		for(j=0; j<newLut->inputs.size(); j++){
			if(inputType[j] == 1){ //compares this bit and the next one
				if( ((i & (1 << j))==0) != ((i & (1 << (j+1)))==0) ){
					newLut->tableO6[i] = true;
					break;
				}
				j++; //skips the next bit
			} else {//parity checking of this bit and the next 2
				if( (((i >> j) & 1) ^ ((i >> (j+1)) & 1)) ^ ((i >> (j+2)) & 1) != 0){
					newLut->tableO6[i] = true;
					break;
				}
				j+=2;
			}
		}
			
	}
	
	snprintf(newName, 128, "errorVec(%d)", nextErrorId++);
	outNet = new Net(newName, 0);
	newLut->outputs.push_back(outNet);
	
	return newLut;
}
/**************************************************************************************************/
//creates a primary output checker
Lut* ftXilinx::genPOChecker(vector<Net*> &POVec, char* name){
	char newName[128];
	Lut* newLut;
	Net* outNet;
	unsigned i, j;
	
	newLut = new Lut(name, 0);
	
	for(i=0; i<POVec.size(); i++){
		newLut->inputs.push_back(POVec[i]);
		newLut->inputs.push_back(duplicatedNet[POVec[i]]);
	}
	
	newLut->tableO6.resize(1 << (newLut->inputs.size()));
	
	for(i=0; i<newLut->tableO6.size(); i++){
		newLut->tableO6[i] = false;
		
		for(j=0; j<newLut->inputs.size(); j+=2)
			if( ((i & (1 << j))==0) != ((i & (1 << (j+1)))==0) ){
				newLut->tableO6[i] = true;
				break;
			}	
	}
	
	snprintf(newName, 128, "errorVecPO(%ld)", POCheckers.size());
	outNet = new Net(newName, 0);
	newLut->outputs.push_back(outNet);
	
	return newLut;
}

/**************************************************************************************************/
void ftXilinx::genAdderCheckers(list<Net*> &netsWithLoad, list<Lut*> &checkerLuts){
	list<Net*>::iterator it;
	unsigned checkedNets = 0;
	Lut* newLut;
	Net* newNet;
	static unsigned nextCheckerId = 0;
	char buf[128];
	int i, j;
	
	it = netsWithLoad.begin();
	checkerLuts.clear();
	while(1){
		snprintf(buf, 128, "adderChecker_%d", nextCheckerId++);
		newLut = new Lut(buf, 0);
		for(i=0; i<LUT_K/2; i++){ //takes up to LUT_K/2 nets from the list
			if(it == netsWithLoad.end())
				break;
			newLut->inputs.push_back(*it);
			newLut->inputs.push_back(duplicatedNet[*it]);
			(*it)->input->checker = newLut;
			it++;
		}
		if(newLut->inputs.size() == 0){ //if there are no more nets with load to be checked
			delete newLut;
			break;
		}
		snprintf(buf, 128, "errorVec(%d)", nextErrorId++);
		newNet = new Net(buf, 0);
		newLut->outputs.push_back(newNet);
		newLut->tableO6.resize(1 << (newLut->inputs.size()));
		for(i=0; i<newLut->tableO6.size(); i++){
			newLut->tableO6[i] = false;
			for(j=0; j<newLut->inputs.size(); j+=2)
				if(((i & (1 << j)) != 0) != ((i & (1 << (j+1))) != 0)){
					newLut->tableO6[i] = true;
					break;
				}
		}
		checkerLuts.push_back(newLut);
	}
}

/**************************************************************************************************/
void ftXilinx::generateDuplicatedAdders(){
	Net* newNet;
	Component* newComp;
	string newName;
	pair<Net*, Net*> netPair;
	list<Net*> netsWithLoad; //internal nets that have a load outside of the adder
	netsWithLoad.clear();
	
	foreach(set<Component*> adder, adders){
		foreach(Component* comp, adder){
			newName.assign("addcpy_");
			newName+=comp->name;
			if(comp->type == XORCY)
				newComp = new Xor(newName, 0);
			else if(comp->type == MUXCY)
				newComp = new Mux(newName, 0);
			else {
				newComp = new Lut(newName, 0);
				((Lut*) newComp)->tableO6 = ((Lut*) comp)->tableO6;
			}
			newComp->type = comp->type;
			comp->pred = newComp; //the original component's predictor is its copy
			foreach(Net* n, comp->inputs){
				//in this case, we're taking the copy of the net whenever possible
				//this covers both the cases in which the net is internal to the adder
				//or there's a copy available (to increase the routing reliability)
				if(options[OPT_NODUPLNET]){
					if(duplicatedNet.count(n) == 1 && 
							duplicatedNet[n]->name.find("duplicated_adders") != string::npos)
						newComp->inputs.push_back(duplicatedNet[n]);
					else
						newComp->inputs.push_back(n);
				} else {
					if(duplicatedNet.count(n) == 1)
						newComp->inputs.push_back(duplicatedNet[n]);
					else
						newComp->inputs.push_back(n);
				}
			}
			newComp->outputs.push_back(duplicatedNet[comp->outputs[0]]);
			//determines if this component's output drives a component outside the adder
			if(comp->outputs[0]->isPO){
				netsWithLoad.push_back(comp->outputs[0]);
			} else {
				//searches for a component in the output that lies outside the adder
				foreach(Component* loadComp, comp->outputs[0]->outputs)							
					if(adder.count(loadComp) == 0){
						netsWithLoad.push_back(comp->outputs[0]);
						break;
					}
			}
			
		}
		if(!options[OPT_FF_INPUT_CMP])
			genAdderCheckers(netsWithLoad, adderCheckers);
	}
}

/**************************************************************************************************/
Lut* ftXilinx::genMuxFxChecker(Component* comp, char* name){
	Lut* newLut;
	Net* newNet;
	char buf[128];
	int i, j;
	
	newLut = new Lut(name, 0);
	
	for(i=0; i<comp->inputs.size(); i++)
		newLut->inputs.push_back(comp->inputs[i]);
		
	newLut->inputs.push_back(comp->outputs[0]);
	
	snprintf(buf, 128, "errorVec(%d)", nextErrorId++);
	newNet = new Net(buf, 0);
	
	newLut->outputs.push_back(newNet);
	
	if(newLut->inputs.size() != 4)
		cout << "MUXFX checker with " << newLut->inputs.size() << " inputs" << endl;
		
	newLut->tableO6.resize(1 << newLut->inputs.size());
	for(i=0; i<newLut->tableO6.size(); i++)
		if(i & 4) //if the third bit is 1, the fourth bit must be equal to the second
			newLut->tableO6[i] = (((i & 8) == 0) != ((i & 2) == 0));
		else //else, the fourth bit must be equal to the first
			newLut->tableO6[i] = (((i & 8) == 0) != ((i & 1) == 0));
	
	//adds checking capabilities for when one of the inputs is VCC or GND
	for(i=0; i<2; i++)
		if(comp->inputs[i]->value != VARSIG){
			cerr << comp->name << " should not have a checker!" << endl;
			for(j=0; j<newLut->tableO6.size(); j++)
				if( ((j & (1 << i)) != 0) != (comp->inputs[i]->value != GND) )
					newLut->tableO6[j] = true;
		}
	
	return newLut;
}

/**************************************************************************************************/
Mux* ftXilinx::duplicateMuxFx(Component* origMux, unsigned nextDWCId){	
	Mux* newMuxFx;
	Net* newNet;
	char buf[128];
	
	snprintf(buf, 128, "%s_copy", origMux->name.c_str());
	newMuxFx = new Mux(buf, 0);
	if(origMux->inputs[0]->value == VARSIG)
		newMuxFx->inputs.push_back(duplicatedNet[origMux->inputs[0]]);
	else
		newMuxFx->inputs.push_back(origMux->inputs[0]);
	if(origMux->inputs[1]->value == VARSIG)
		newMuxFx->inputs.push_back(duplicatedNet[origMux->inputs[1]]);
	else 
		newMuxFx->inputs.push_back(origMux->inputs[1]);
		
	//the selection signal will be checked for copies later, as it may still gain a copy
	newMuxFx->inputs.push_back(origMux->inputs[2]);
	newMuxFx->type = origMux->type;
	snprintf(buf, 128, "muxf_dwc(%d)", nextDWCId);
	newNet = new Net(buf, 0);
	newMuxFx->outputs.push_back(newNet);
	duplicatedNet[origMux->outputs[0]] = newNet;
	
	return newMuxFx;
}

/**************************************************************************************************/
FlipFlop* ftXilinx::duplicateFF(FlipFlop* ff){
	FlipFlop* newFF;
	char buf[128];
	
	snprintf(buf, 128, "%s_copy", ff->name.c_str());
	newFF = new FlipFlop(buf, 0, ff->type);
	
	foreach(Net* in, ff->inputs)
		if(duplicatedNet.count(in))
			newFF->inputs.push_back(duplicatedNet[in]);
		else
			newFF->inputs.push_back(in);
	
	newFF->outputs.push_back(duplicatedNet[ff->outputs[0]]);
	duplicatedNet[ff->outputs[0]]->setInput(newFF);
	return newFF;
}
