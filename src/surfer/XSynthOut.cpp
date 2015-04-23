/**************************************************************************************************/
/*
 *  Circuit printing
 *  by Gabriel Luca Nazar <glnazar@inf.ufrgs.br>
 *
 */
/**************************************************************************************************/

#include "XSynthOut.h"

using namespace std;

/**************************************************************************************************/
//checks if a signal is a part of a vector
bool XSynthOut::isVector(Net* netptr){
	
	return netptr->name[netptr->name.size()-1] == ')';
}

/**************************************************************************************************/
//builds a signal vector for printing
void XSynthOut::buildSignalVec(vector<Net*> &nets, unsigned *high, unsigned *low, char* buf, vector<bool> &printed, unsigned id){
	unsigned int id2, pos;
	unsigned nameLength;
	
	sscanf(nets[id]->name.c_str(), "%[^(]s", buf); //gets only the pure net name
	nameLength = strlen(buf);
	sscanf(nets[id]->name.c_str()+nameLength, "(%d)", low); //gets the index of this net (inside the std_logic_vector)
	printed[id] = true;
	
	id2 = id+1;
	while(id2 < nets.size()){
		if(nets[id2]->name.find(buf) != -1 && nets[id2]->name.find('(') == nameLength){
			printed[id2] = true;
			id2++;
		} else
			break;		
	}
	*high = *low + id2 - (id+1);	
	
}

void XSynthOut::printLUTs(vector<vector<set<unsigned> > > &selectedCliques_in, vector<Lut*> &lutVec_in, FILE* outfile) {
	int i;
	map<Net*, unsigned> copyIdx; //stores the index of the next net copy to be used (used for routing splitting)
	int maxSize = options[OPT_CCHAIN] && !options[OPT_DWCF] ? LUT_K-1 : ft->maxGroupSize;
	if(maxSize >= selectedCliques_in.size())
		maxSize = selectedCliques_in.size()-1;
	
	for(i=0; i<maxSize+1; i++){
		foreach(set<unsigned> clique, selectedCliques_in[i]){
			Lut* l = lutVec_in[*(clique.begin())]; //takes the first LUT to take pred and check refs from it
			copyIdx.clear();
			foreach(unsigned node, clique){ //prints the original LUTs
				if(options[OPT_RSPLIT] && i != 0)
					lutVec_in[node]->print(outfile, ft->duplicatedNet, copyIdx, ft->rSplitLuts);
				else
					lutVec_in[node]->print(outfile); //4-adjs always use the original inputs
				printedLUTs++;
			}
			switch(i){ //prints the checking circuitry
				case 0: //4-adj has only a checker
					//but it is also a "predictor" so it should use duplicated nets when possible
					if(!options[OPT_NOCHECK]){
						if(options[OPT_RSPLIT])
							((Lut*) l->checker)->printDAdjCheck(outfile, ft->duplicatedNet, ft->rSplitLuts);
						else
							((Lut*) l->checker)->print(outfile, ft->duplicatedNet);
						printedLUTs++;
					}
					break;
				case 1:
				case 2:
					if(options[OPT_RSPLIT])
						((Lut*) l->pred)->print(outfile, ft->duplicatedNet, copyIdx, ft->rSplitLuts);
					else
						if(options[OPT_NODUPLNET])
							((Lut*) l->pred)->print(outfile);
						else
							((Lut*) l->pred)->print(outfile, ft->duplicatedNet);
					printedLUTs++;
					if(!options[OPT_FF_INPUT_CMP])
						if(printedSharedCheckers.count(l->checker) == 0){ //shared checkers should be printed only once
							printedSharedCheckers.insert(l->checker);
							if(!options[OPT_NOCHECK]){
								if(options[OPT_RSPLIT])
									((Lut*) l->checker)->printChecker(outfile, ft->rSplitLuts);
								else
									l->checker->print(outfile);
								printedLUTs++;
							}
						}
					break;
				default:
					if(options[OPT_RSPLIT]) {
						((Lut*) l->pred)->print(outfile, ft->duplicatedNet, copyIdx, ft->rSplitLuts);
						if(!options[OPT_NOCHECK])
							((Lut*) l->checker)->printChecker(outfile, ft->rSplitLuts);
					} else	{
						if(options[OPT_NODUPLNET])
							((Lut*) l->pred)->print(outfile);
						else
							((Lut*) l->pred)->print(outfile, ft->duplicatedNet);
						if(!options[OPT_NOCHECK])
							((Lut*) l->checker)->print(outfile, ft->duplicatedNet);
					}
					printedLUTs+=options[OPT_NOCHECK] ? 1 : 2;
					break;
			}
		}
	}
	
	//LUTs that have direct checking
	foreach(Lut* l, ft->unpairedDCheck){
		l->print(outfile);
		if(!options[OPT_NOCHECK])
			if(options[OPT_RSPLIT])
				((Lut*) l->checker)->printDAdjCheck(outfile, ft->duplicatedNet, ft->rSplitLuts);
			else
				((Lut*) l->checker)->print(outfile, ft->duplicatedNet);
		printedLUTs+=options[OPT_NOCHECK] ? 1 : 2;
	}
}

/**************************************************************************************************/
//prints the output file
void XSynthOut::printOutput(Circuit* circIn, ftXilinx* ftIn, const char* filename){
	FILE* outfile;
	int i, j;
	char buf[BUFSIZE], buf2[BUFSIZE]; //auxiliary buffers for variable names
	vector<bool> printedNets; //if a net was already printed
	unsigned high, low; //high and low ends of a signal vector
	Lut* newLut; //pointer to newly instantiated luts
	Net* pNet; //pointer to parity net
	vector<string> POsNames;
	string newPOname;
	
	printedLUTs = 0;
	circ = circIn;
	ft = ftIn;
	
	cout << "Printing output file: " << filename << endl;
	
	outfile = fopen(filename, "w");
	
	fprintf(outfile, "----------------------------------------------------------------------------------\n");
	fprintf(outfile, "--Fault tolerant version of %s\n", circ->name.c_str());
	fprintf(outfile, "--Generated by ftXil, by Gabriel Luca Nazar\n");
	fprintf(outfile, "----------------------------------------------------------------------------------\n");
	
	fprintf(outfile, "\nlibrary IEEE;\n");
	fprintf(outfile, "use IEEE.STD_LOGIC_1164.ALL;\n");
	fprintf(outfile, "library UNISIM;\n");
	fprintf(outfile, "use UNISIM.VCOMPONENTS.ALL;\n");
	
	//Entity declaration************************************************************
	if(options[OPT_E_AGGREG])
		fprintf(outfile, "entity %s_ft_ea is\n", circ->name.c_str());
	else
		fprintf(outfile, "entity %s_ft is\n", circ->name.c_str());
	fprintf(outfile, "  port (\n");
	
	//initializes printedNets
	printedNets.resize(circ->nets.size());
	for(i=0; i<printedNets.size(); i++)
		printedNets[i] = false;
	
	//prints primary inputs
	if(!options[OPT_MERGE_IO])
		for(i=0; i<circ->PIs.size(); i++)
			if(!printedNets[circ->PIs[i]->id]){
				if(isVector(circ->PIs[i])){
					buildSignalVec(circ->nets, &high, &low, buf, printedNets, circ->PIs[i]->id);
					fprintf(outfile, "    %s : in STD_LOGIC_VECTOR ( %d downto %d );\n", buf, high, low);
				} else {
					fprintf(outfile, "    %s : in STD_LOGIC;\n", circ->PIs[i]->name.c_str());
					printedNets[circ->PIs[i]->id] = true;
				}
			}
	if(options[OPT_DUPLICATE_PI]){
		fprintf(outfile, "    inputs_copy : in STD_LOGIC_VECTOR ( %d downto 0 );\n", circ->PIs.size()-circ->clocks.size()-ft->rstPICnt-1);
		for(i=0; i<ft->rstPICnt; i++)
			fprintf(outfile, "    rst_copy_%d : in STD_LOGIC;\n", i);
	}
	
	//POs names must be stored to print the internal PO signals, that are required for checking.
	POsNames.clear();
	for(i=0; i<circ->POs.size(); i++){
		if(!printedNets[circ->POs[i]->id])
			if(isVector(circ->POs[i])){
				buildSignalVec(circ->nets, &high, &low, buf, printedNets, circ->POs[i]->id);
				if(!options[OPT_MERGE_IO])
					fprintf(outfile, "    %s : out STD_LOGIC_VECTOR ( %d downto %d );\n", buf, high, low);
				
				snprintf(buf2, BUFSIZE, "%s : STD_LOGIC_VECTOR ( %d downto %d )", buf, high, low);
				newPOname.assign(buf2);
				POsNames.push_back(newPOname);
			} else {
				if(!options[OPT_MERGE_IO])
					fprintf(outfile, "    %s : out STD_LOGIC;\n", circ->POs[i]->name.c_str());
				printedNets[circ->POs[i]->id] = true;
				
				snprintf(buf2, BUFSIZE, "%s : STD_LOGIC", circ->POs[i]->name.c_str());
				newPOname.assign(buf2);
				POsNames.push_back(newPOname);
			}
		}
	
	if(options[OPT_MERGE_IO]){
		fprintf(outfile, "    inputVector_merge : in STD_LOGIC_VECTOR ( %d downto 0 );\n", circ->PIs.size()-1);
		fprintf(outfile, "    outputVector_merge : out STD_LOGIC_VECTOR ( %d downto 0 );\n", circ->POs.size()-1);
	}
	
	if(options[OPT_RSPLIT]){
		fprintf(outfile, "    inButton : in STD_LOGIC;\n");
	}
	
	if(options[OPT_2RAIL]){
		if(options[OPT_E_AGGREG])
			fprintf(outfile, "    errorDetectedPO : out STD_LOGIC;\n");
		else
			fprintf(outfile, "    errorVecPO : out STD_LOGIC_VECTOR ( %d downto 0 );\n", ft->POCheckers.size()-1);
	}
	
	if(options[OPT_E_AGGREG]) //if the error aggregation circuit is to be printed, then the error output is a single bit
		fprintf(outfile, "    errorDetected : out STD_LOGIC\n");
	else
		fprintf(outfile, "    errorVec : out STD_LOGIC_VECTOR ( %d downto 0 )\n", ft->errorsCnt-1);
	
	if(options[OPT_E_AGGREG]){
		fprintf(outfile, "  );\nend %s_ft_ea;\n\n", circ->name.c_str());
		fprintf(outfile, "architecture Structure of %s_ft_ea is\n\n", circ->name.c_str());
	} else {
		fprintf(outfile, "  );\nend %s_ft;\n\n", circ->name.c_str());
		fprintf(outfile, "architecture Structure of %s_ft is\n\n", circ->name.c_str());
	}
	
	//Signals & components declaration************************************************************
	
	if(options[OPT_E_AGGREG] && ft->errorsCnt > 1){ //when printing the error aggregation circuit, the component must be declared
		fprintf(outfile, "  component multiple_input_or is\n");
	 	fprintf(outfile, "    Generic (\n");
		fprintf(outfile, "      GATE_INPUT_SIZE : integer;\n");
		fprintf(outfile, "      LOG_GATE_INPUT_SIZE : integer);\n");
	 	fprintf(outfile, "    Port ( input_vec : in  STD_LOGIC_VECTOR ( GATE_INPUT_SIZE-1 downto 0 );\n");
           	fprintf(outfile, "      output : out  STD_LOGIC );\n");
		fprintf(outfile, "  end component;\n");
	}
		
	if(!options[OPT_NO_CMP_MODULE]){
			fprintf(outfile, "  component comparator is\n");
			fprintf(outfile, "    Generic ( IN_WIDTH : integer;\n");
			fprintf(outfile, "              OUT_WIDTH : integer\n");
			fprintf(outfile, "    );\n");
			fprintf(outfile, "    Port ( inVecA : in  STD_LOGIC_VECTOR (IN_WIDTH-1 downto 0);\n");
			fprintf(outfile, "           inVecB : in  STD_LOGIC_VECTOR (IN_WIDTH-1 downto 0);\n");
			fprintf(outfile, "           errors : out  STD_LOGIC_VECTOR (OUT_WIDTH-1 downto 0));\n");
			fprintf(outfile, "  end component;\n");
	}
	
	//the error vector is an internal signal
	if(options[OPT_E_AGGREG])
		fprintf(outfile, "  signal errorVec : STD_LOGIC_VECTOR ( %d downto 0 );\n", ft->errorsCnt-1);
		
	//declares the error vector for PO checking
	if(options[OPT_2RAIL] & options[OPT_E_AGGREG])
		fprintf(outfile, "  signal errorVecPO : STD_LOGIC_VECTOR ( %d downto 0 );\n", ft->POCheckers.size()-1);
	
	//declares the nets internal signals
	//PIs may be declared here if IO merging is activated
	for(i=0; i<circ->nets.size(); i++){
		if(!printedNets[circ->nets[i]->id])
			if(isVector(circ->nets[i])){
				buildSignalVec(circ->nets, &high, &low, buf, printedNets, circ->nets[i]->id);
				fprintf(outfile, "  signal %s : STD_LOGIC_VECTOR ( %d downto %d );\n", buf, high, low);
			} else {
				fprintf(outfile, "  signal %s : STD_LOGIC;\n", circ->nets[i]->name.c_str());
				printedNets[circ->nets[i]->id] = true;
			}
		}
	
	if(ft->duplicatedFFs.size() > 0)
		fprintf(outfile, "  signal duplicated_FF_Q : STD_LOGIC_VECTOR( %d downto 0 );\n", ft->duplicatedFFs.size()-1);
	
	if(options[OPT_CCHAIN] || options[OPT_DUPLICATE_MUXES]) {
		if(ft->selectedCliques[1].size() + ft->selectedCliquesMuxFx[1].size() > 0)
			fprintf(outfile, "  signal unpaired_LUTs_DWC : STD_LOGIC_VECTOR ( %d downto 0 );\n", ft->selectedCliques[1].size() + ft->selectedCliquesMuxFx[1].size() - 1);
	} else {
		if(ft->selectedCliques[1].size() > 0)
			fprintf(outfile, "  signal unpaired_LUTs_DWC : STD_LOGIC_VECTOR ( %d downto 0 );\n", ft->selectedCliques[1].size()-1);
	}
	
	//declares the nets for parity prediction
	if(ft->nextPredId > 0)
		fprintf(outfile, "  signal ftparity : STD_LOGIC_VECTOR ( %d downto 0 );\n", ft->nextPredId-1);
	
	//auxiliary nets to build the carry chain-based checkers
	if(options[OPT_CCHAIN] && ft->nextCChainNetId > 0)
		fprintf(outfile, "  signal cChainNet : STD_LOGIC_VECTOR ( %d downto 0 );\n", ft->nextCChainNetId-1);
	
	//declares the internal versions of the outputs
	for(i=0; i<POsNames.size(); i++)
		fprintf(outfile, "  signal internal_%s;\n", POsNames[i].c_str());
		
	//declares the nets used for FF input comparison
	if(options[OPT_FF_INPUT_CMP])
		fprintf(outfile, "  signal ff_cmp0, ff_cmp1 : STD_LOGIC_VECTOR ( %d downto 0 );\n", circ->ffs.size() + circ->POs.size() + circ->sets.size() - circ->constInputFFs - 1);
		
	POsNames.clear();
	
	
	//prints the nets required for duplicated adders
	if(options[OPT_D_ADDERS] && ft->adders.size() > 0){
		unsigned addCpyCnt=0;
		foreach(set<Component*> adder, ft->adders)
			addCpyCnt+=adder.size(); //one signal for each duplicated component
		fprintf(outfile, "  signal duplicated_adders : STD_LOGIC_VECTOR ( %d downto 0 );\n", addCpyCnt-1);
		//if(keep)
			//fprintf(outfile, "attribute keep of duplicated_adders: signal is \"true\";\n");
	}
	
	//prints the nets from the duplicated Muxes (F7 and F8)
	if(ft->duplicatedMuxFx.size() > 0)
		fprintf(outfile, "  signal muxf_dwc : STD_LOGIC_VECTOR ( %d downto 0 );\n", ft->duplicatedMuxFx.size()-1);
	
	if(options[OPT_RSPLIT] && ft->splitLutsCnt > 0)
		fprintf(outfile, "  signal splitNet : STD_LOGIC_VECTOR ( %d downto 0 );\n", ft->splitLutsCnt-1);
	
	//vectors that are input to the comparator modules
	if(!options[OPT_NO_CMP_MODULE])
		fprintf(outfile, "  signal outvec_PO_cmp0, outvec_PO_cmp1 : STD_LOGIC_VECTOR ( %d downto 0 );\n", circ->POs.size()-1);
	
	fprintf(outfile, "begin\n"); /****************************************************/
	//Shorts instatiation************************************************************
	for(i=0; i<circ->POs.size(); i++)
		if(options[OPT_MERGE_IO])
			fprintf(outfile, "  outputVector_merge(%d) <= internal_%s;\n", i, circ->POs[i]->name.c_str());
		else
			fprintf(outfile, "  %s <= internal_%s;\n", circ->POs[i]->name.c_str(), circ->POs[i]->name.c_str());
	
	if(options[OPT_MERGE_IO])
		for(i=0; i<circ->PIs.size(); i++)
			fprintf(outfile, "  %s <= inputVector_merge(%d);\n", circ->PIs[i]->name.c_str(), i);
	
	//Error aggregation instatiation************************************************************
	if(options[OPT_E_AGGREG]){
		if(ft->errorsCnt > 1) {
			fprintf(outfile, "  error_aggreg : multiple_input_or\n");
			fprintf(outfile, "    generic map (\n");
			fprintf(outfile, "      GATE_INPUT_SIZE => %d,\n", ft->errorsCnt);
			fprintf(outfile, "      LOG_GATE_INPUT_SIZE => %d\n", (int) ceil(log(ft->errorsCnt)/log(2)));
			fprintf(outfile, "  )\n");
			fprintf(outfile, "    port map (\n");
			fprintf(outfile, "      input_vec => errorVec,\n");
			fprintf(outfile, "      output => errorDetected\n");
			fprintf(outfile, "  );\n");
		} else
			fprintf(outfile, "errorDetected <= errorVec(0);\n");
	
		if(options[OPT_2RAIL]){
			if(ft->POCheckers.size() > 1){
				fprintf(outfile, "  error_aggreg_PO : multiple_input_or\n");
				fprintf(outfile, "    generic map (\n");
				fprintf(outfile, "      GATE_INPUT_SIZE => %d,\n", ft->POCheckers.size());
				fprintf(outfile, "      LOG_GATE_INPUT_SIZE => %d\n", (int) ceil(log(ft->POCheckers.size())/log(2)));
				fprintf(outfile, "  )\n");
				fprintf(outfile, "    port map (\n");
				fprintf(outfile, "      input_vec => errorVecPO,\n");
				fprintf(outfile, "      output => errorDetectedPO\n");
				fprintf(outfile, "  );\n");
			} else
				fprintf(outfile, "errorDetectedPO <= errorVecPO(0);\n");
		}
	}

		
	//LUTS instantiation**************************************************************************
	printedSharedCheckers.clear();
	if(options[OPT_CCHAIN]) {
		list<vector<Lut*> >::iterator itLut;
		list<vector<Adder*> >::iterator itAdd;
		
		printLUTs(ft->selectedCliquesMuxFx, ft->lutsWithMuxF7, outfile);
		
		for(itLut = ft->cChainGroups.begin(), itAdd = ft->cChainCheckers.begin(); itLut != ft->cChainGroups.end(); itLut++, itAdd++){
			for(j=0; j<(*itLut).size(); j++){
				if((*itLut)[j] != NULL) {
					if((*itLut)[j]->pred == NULL) //this is a predictor
						if(options[OPT_NODUPLNET])
							(*itLut)[j]->print(outfile);
						else
							(*itLut)[j]->print(outfile, ft->duplicatedNet); //print with duplicated nets
					else
						(*itLut)[j]->print(outfile);
					printedLUTs++;
				}
			}
				
			for(j=0; j<(*itAdd).size(); j++)
				(*itAdd)[j]->print(outfile);
		}
	} else
		printLUTs(ft->selectedCliques, circ->luts, outfile);
	
	if(options[OPT_DUPLICATE_MUXES]) //forces the duplication of all LUTs with used MUXF7s	
		printLUTs(ft->selectedCliquesMuxFx, ft->lutsWithMuxF7, outfile);
	
	//PO Checkers******************************************************************************
	if(options[OPT_2RAIL]){
		if(options[OPT_NO_CMP_MODULE]) {
			foreach(Lut* l, ft->POCheckers){
				l->print(outfile);
				printedLUTs++;
			}
		} else {
			for(i=0; i<circ->POs.size(); i++)
				fprintf(outfile, "  outvec_PO_cmp0(%d) <= %s;\n", i, circ->POs[i]->getName().c_str());

			for(i=0; i<circ->POs.size(); i++){
				if(ft->duplicatedNet.count(circ->POs[i]) == 0){
					cout << "PO: " << circ->POs[i]->getName() << " without replica - XSynthOut" << endl;
					exit(0);
				}
				fprintf(outfile, "  outvec_PO_cmp1(%d) <= %s;\n", i, ft->duplicatedNet[circ->POs[i]]->getName().c_str());
			}
			
			fprintf(outfile, "  po_checker : comparator\n");
			fprintf(outfile, "    generic map (\n");
			fprintf(outfile, "      IN_WIDTH => %d,\n", circ->POs.size());
			fprintf(outfile, "      OUT_WIDTH => %d\n", ft->POCheckers.size());
			fprintf(outfile, "    )\n");
			fprintf(outfile, "    port map (\n");
			fprintf(outfile, "      inVecA => outvec_PO_cmp0,\n");
			fprintf(outfile, "      inVecB => outvec_PO_cmp1,\n");
			fprintf(outfile, "      errors => errorVecPO\n");
			fprintf(outfile, "    );\n");
		}		
	}
	
	//FF Input Checkers******************************************************************************
	if(options[OPT_FF_INPUT_CMP]){
		for(i=0, j=0; i<circ->ffs.size(); i++, j++){
			if(circ->ffs[i]->type == FDR || circ->ffs[i]->type == FDRS) { //the position of the D input may change according to the FF type
				if(circ->ffs[i]->inputs[1]->value == VARSIG){
					fprintf(outfile, "  ff_cmp0(%d) <= %s;\n", j, circ->ffs[i]->inputs[1]->getName().c_str());
					if(ft->duplicatedNet.count(circ->ffs[i]->inputs[1]) == 0){
						cout << circ->ffs[i]->inputs[1]->getName() << " without a copy - XSynthOut" << endl;
						exit(0);
					}
					fprintf(outfile, "  ff_cmp1(%d) <= %s;\n", j, ft->duplicatedNet[circ->ffs[i]->inputs[1]]->getName().c_str());
				} else j--; //flip-flop with constant input (probably has a set signal..) -> NO CHECKING
			} else if(circ->ffs[i]->type == FDRE || circ->ffs[i]->type == FDRSE) {
				if(circ->ffs[i]->inputs[2]->value == VARSIG){
					fprintf(outfile, "  ff_cmp0(%d) <= %s;\n", j, circ->ffs[i]->inputs[2]->getName().c_str());
					if(ft->duplicatedNet.count(circ->ffs[i]->inputs[2]) == 0){
						cout << circ->ffs[i]->inputs[2]->getName() << " without a copy - XSynthOut" << endl;
						exit(0);
					}
					fprintf(outfile, "  ff_cmp1(%d) <= %s;\n", j, ft->duplicatedNet[circ->ffs[i]->inputs[2]]->getName().c_str());
				} else j--; //flip-flop with constant input (probably has a set signal..) -> NO CHECKING
			} else {
				cout << "XSynthOut: Unkown FF type " << circ->ffs[i]->type << endl;
				exit(0);
			}
		}
		
		for(i=0; i<circ->POs.size(); i++)
				fprintf(outfile, "  ff_cmp0(%d) <= %s;\n", i+circ->ffs.size()-circ->constInputFFs, circ->POs[i]->getName().c_str());

		for(i=0; i<circ->POs.size(); i++){
			if(ft->duplicatedNet.count(circ->POs[i]) == 0){
				cout << "PO: " << circ->POs[i]->getName() << " without replica - XSynthOut" << endl;
				exit(0);
			}
			fprintf(outfile, "  ff_cmp1(%d) <= %s;\n", i+circ->ffs.size()-circ->constInputFFs, ft->duplicatedNet[circ->POs[i]]->getName().c_str());
		}
		
		i=0;
		foreach(Net* setNet, circ->sets){
			fprintf(outfile, "  ff_cmp0(%d) <= %s;\n", i+circ->ffs.size()+circ->POs.size()-circ->constInputFFs, setNet->getName().c_str());
			if(ft->duplicatedNet.count(setNet) == 0){
					cout << "set net " << setNet->getName() << " without a copy - XSynthOut" << endl;
					exit(0);
			}
			fprintf(outfile, "  ff_cmp1(%d) <= %s;\n", i+circ->ffs.size()+circ->POs.size()-circ->constInputFFs, ft->duplicatedNet[setNet]->getName().c_str());
			i++;
		}
		
		fprintf(outfile, "  ff_checker : comparator\n");
		fprintf(outfile, "    generic map (\n");
		fprintf(outfile, "      IN_WIDTH => %d,\n", circ->ffs.size() + circ->POs.size() + circ->sets.size() - circ->constInputFFs);
		fprintf(outfile, "      OUT_WIDTH => %d\n", ft->errorsCnt);
		fprintf(outfile, "    )\n");
		fprintf(outfile, "    port map (\n");
		fprintf(outfile, "      inVecA => ff_cmp0,\n");
		fprintf(outfile, "      inVecB => ff_cmp1,\n");
		fprintf(outfile, "      errors => errorVec\n");
		fprintf(outfile, "    );\n");
	}
		
	//Other components instatiation************************************************************	
	
	foreach(Component* comp, circ->components){
		comp->print(outfile);
		if(comp->checker != NULL && !options[OPT_NOCHECK]){ //this component may have a dedicated checker
			if(options[OPT_RSPLIT])
				((Lut*) comp->checker)->printChecker(outfile, ft->rSplitLuts);
			else
				((Lut*) comp->checker)->print(outfile, ft->duplicatedNet);
			if(comp->checker->type == LUT)
				printedLUTs++;
		}
	}
		
	foreach(Net* n, circ->nets){
		if(n->value == GND){
			fprintf(outfile, "  XST_GND : GND\n");
			fprintf(outfile, "    port map (\n");
			fprintf(outfile, "      G => %s\n", n->getName().c_str());
			fprintf(outfile, "    );\n");
		} else if(n->value == VCC){
			fprintf(outfile, "  XST_VCC : VCC\n");
			fprintf(outfile, "    port map (\n");
			fprintf(outfile, "      P => %s\n", n->getName().c_str());
			fprintf(outfile, "    );\n");
		}
	}

	//Duplicated adders************************************************************
	map<Net*, unsigned> copyIdx;
	if(options[OPT_D_ADDERS]){
		if(options[OPT_RSPLIT]){
			foreach(set<Component*> adder, ft->adders) {
				foreach(Component* comp, adder){
					copyIdx.clear();
					if(comp->type == LUT) {
						((Lut*) comp)->print(outfile, ft->duplicatedNet, copyIdx, ft->rSplitLuts);
						((Lut*) comp->pred)->print(outfile, ft->duplicatedNet, copyIdx, ft->rSplitLuts);
						printedLUTs += 2;
					} else {
						comp->print(outfile);
						comp->pred->print(outfile);
					}
				}
			}
			if(!options[OPT_NOCHECK])
				foreach(Lut* l, ft->adderCheckers){
					l->printChecker(outfile, ft->rSplitLuts);
					printedLUTs++;
				}
		} else {
			foreach(set<Component*> adder, ft->adders)
				foreach(Component* comp, adder){
					comp->print(outfile);
					comp->pred->print(outfile);
					if(comp->type == LUT)
						printedLUTs += 2;
				}
			if(!options[OPT_NOCHECK])
				foreach(Lut* l, ft->adderCheckers){
					l->print(outfile);
					printedLUTs++;
				}
		}
	}				
			
	
	//Duplicated muxes (MUXF7 and MUXF8)************************************************************
	foreach(Mux* muxf, ft->duplicatedMuxFx)
		muxf->print(outfile);
		
	//FFs and Duplicated FFs************************************************************
	foreach(FlipFlop* ff, circ->ffs)
		ff->print(outfile);
		
	foreach(FlipFlop* ff, ft->duplicatedFFs)
		ff->print(outfile);
	
	//LUT for net splitting
	pair<Net*, vector<Component*> > pairComp;
	if(options[OPT_RSPLIT])
		foreach(pairComp, ft->rSplitLuts)
			foreach(Component *comp, pairComp.second)
				comp->print(outfile);
	
	fprintf(outfile, "end Structure;\n");
	
	cout << "Printed : " << printedLUTs << " LUTs" << endl;
}
