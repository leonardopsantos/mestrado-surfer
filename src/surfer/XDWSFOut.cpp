/** \file XDWSFOut.cpp
    \brief Code for Duplication With Comparison Selective.

    Code for Duplication With Comparison Selective technique.

    \author Leonardo Pereira Santos <leonardo.santos@restinga.ifrs.edu.br>
*/

using namespace std;

#include <iostream>
#include <utility>

#include "XDWSFOut.h"
#include "ftSelectiveXilinx.h"
#include "XMapParser.h"

using namespace std;

/**
 * Builds a logic cone from each Primary Output
 * @param po Root Primary Output
 * @param net Current Net
 * @param node Node in graph from current Net
 * @param depth Current search depth
 */
void XDWSFOut::buildNetLogicConePOs(Net* po, Net* net, int depth)
{

	if( net->isPI == true )
		return;

	Component* input = net->input;

	if( input->type == LUT || input->type == LUT5 || input->type == LUT6 ) {

		std::pair<Net*, int> p = std::make_pair(po, depth);
		input->logicConePOs.push_back(p);

		po->luts.push_back(std::make_pair(input, depth));
	}

	vector<Net*>::iterator net_it;

	for(net_it = input->inputs.begin(); net_it < input->inputs.end(); net_it++) {
		Net* pNet = *net_it;

		if( net->isPI == false )
			buildNetLogicConePOs(po, pNet, depth+1);
	}
}

void XDWSFOut::buildLogicCones(Circuit& circIn)
{

	vector<Net*>::iterator net_it;

	for(net_it = circIn.POs.begin(); net_it < circIn.POs.end(); net_it++) {
		Net* pNet = *net_it;
		if( pNet->isPO == true ) {
			if( pNet->isPI == false )
				buildNetLogicConePOs(pNet, pNet, 0);
		}
	}

	vector<Lut*>::iterator lut_it;

	list<std::pair<Component*, int> >::iterator c_it;

	vector<Net*>::iterator po_it;

	for(po_it = circIn.POs.begin(); po_it < circIn.POs.end(); po_it++) {
		Net* pPo = *po_it;

		if( pPo->isPO == false )
			continue;

		pPo->exclusive_luts = pPo->luts;
		list<std::pair<Component*, int> >::iterator po_c_it;

		bool removed = false;

		for(po_c_it = pPo->luts.begin(); po_c_it != pPo->luts.end(); po_c_it++) {

			removed = false;

			for(net_it = circIn.POs.begin(); net_it < circIn.POs.end(); net_it++) {

				Net* pNet = *net_it;

				if( pNet->isPO == false || pNet == pPo )
					continue;

				for(c_it = pNet->luts.begin(); c_it != pNet->luts.end(); c_it++) {

					if( po_c_it->first == c_it->first ) {
						pPo->exclusive_luts.remove(*po_c_it);
						break;
					}
					if( removed == true )
						break;
				}
				if( removed == true )
					break;
			}
			if( removed == true )
				continue;
		}

		list<std::pair<Net*, int> >::iterator po_lut_it;

		for(c_it = pPo->exclusive_luts.begin(); c_it != pPo->exclusive_luts.end(); c_it++) {
			cout << "PO "<< pPo->name << " Lut " << c_it->first->name << "( " << c_it->second << " )\n";
			for( po_lut_it = c_it->first->logicConePOs.begin(); po_lut_it != c_it->first->logicConePOs.end(); po_lut_it++) {
				cout << "    NET "<< po_lut_it->first->name << "\n";
			}
		}
	}

	return;
}

// trim from end
static inline std::string &rtrim(std::string &s) {
        s.erase(std::find_if(s.rbegin(), s.rend(), std::not1(std::ptr_fun<int, int>(std::isspace))).base(), s.end());
        return s;
}

/**
 * Prints the LOC constrain for all LUT that appear on all three circuits
 * @param synth_circ Post-synthsis VHDL model
 * @param circ_cpy0 Post-mapping cut/cpy0 VHDL model
 * @param circ_cpy1 Post-mapping cut/cpy1 VHDL model
 */
void XDWSFOut::printLOC(Circuit& synth_circ, Circuit& circ_cpy0, Circuit& circ_cpy1)
{
	ofstream ucf_out;
	ucf_out.open ("loc.ucf");

	ucf_out << "\n# LUTs LOC constrains\n";

	vector<Lut*>::iterator lut_it;

	// Sanity check
	for(lut_it = circ_cpy1.luts.begin(); lut_it < circ_cpy1.luts.end(); lut_it++) {
		Lut *cpy1_lut = *lut_it;
		Lut *cpy0_lut = circ_cpy0.GetLutByName(cpy1_lut->name);

		if( cpy0_lut == NULL ) {
			cout << "ERROR: " <<  cpy1_lut->name << " only found on cpy1!\n";
			continue;
		}
	}

	for(lut_it = circ_cpy0.luts.begin(); lut_it < circ_cpy0.luts.end(); lut_it++) {
		Lut *cpy0_lut = *lut_it;
		Lut *synth_lut = synth_circ.GetLutByName(cpy0_lut->name);
		Lut *cpy1_lut = circ_cpy1.GetLutByName(cpy0_lut->name);
		if( cpy1_lut == NULL ) {
			cout << "ERROR: " <<  cpy0_lut->name << " only found on cpy0!\n";
			continue;
		}

		if( synth_lut == NULL ) {
			cout << "WARNING: LUT " <<  cpy0_lut->name << " not found on post-synthesis!\n";
			continue;
		}

		cpy0_lut->printLOC("cut/cpy0/", ucf_out);
		cpy1_lut->printLOC("cut/cpy1/", ucf_out);
	}

	ucf_out.close();
}

/**
 * Prints both VHD files.
 * @param ft Fault-tolerance information
 * @param circIn Post-synthsis circuit
 * @param filename DWSF out file name
 */
void XDWSFOut::printDWSF(ftSelectiveXilinx &ft, Circuit* circ)
{

	std::ifstream inFile(circ->VhdlName.c_str());
	std::string outname;
	std::string text_line;

	std::ofstream outFile;

	if( circ->VhdlName.substr(circ->VhdlName.size()-4) == ".vhd" ) {
		outname = circ->VhdlName.substr(0, circ->VhdlName.size()-4) + "_dwsf.vhd";
	} else {
		outname = circ->VhdlName + "_synthesis_dwsf.vhd";
	}

	outFile.open(outname.c_str());

	outFile << "----------------------------------------------------------------------------------\n";
	outFile << "--Fault tolerant version of " << circ->name << "\n";
	outFile << "--Generated by ftXil, by Leonardo Pereira Santos\n";
	outFile << "----------------------------------------------------------------------------------\n";

	while( 1 ) {
		getline(inFile,text_line);
		if (inFile.eof()) break;
		if( text_line.find("entity") != std::string::npos )
			break;
		else
			outFile << text_line << "\n";
	}
	if( inFile.eof() ) {
		outFile.close();
		return;
	}

	outFile << "entity " << circ->name << "_dwsf is\n";

	getline(inFile,text_line);
	if( text_line.find("port") == std::string::npos ) {
		outFile.close();
		return;
	}
	outFile << text_line << "\n"; // port

	// now keep going until we find the last member of 'port'
	while( 1 ) {
		getline(inFile,text_line);
		if (inFile.eof()) break;
		rtrim(text_line);
		if(text_line.substr( text_line.length()-1 ) != ";" )
			break;
		else
			outFile << text_line << "\n";
	}
	if( inFile.eof() ) {
		outFile.close();
		return;
	}

	outFile << text_line << ";\n";

	outFile << "    errorVec : out STD_LOGIC_VECTOR("<< ft.maxsize-1 << " downto 0)\n";
	outFile << "  );\n";
	outFile << "end " << circ->name << "_dwsf;\n";

	getline(inFile,text_line); // ");"
	getline(inFile,text_line); // end entity

	while( 1 ) {
		getline(inFile,text_line);
		if (inFile.eof()) break;
		if( text_line.find("architecture Structure") != std::string::npos )
			break;
		else
			outFile << text_line << "\n";
	}
	if( inFile.eof() ) {
		outFile.close();
		return;
	}

	outFile << "architecture Structure of " << circ->name << "_dwsf is\n";

	while( 1 ) {
		getline(inFile,text_line);
		if (inFile.eof()) break;
		if( text_line.find("end Structure;") != std::string::npos )
			break;
		else
			outFile << text_line << "\n";
	}
	if( inFile.eof() ) {
		outFile.close();
		return;
	}

	for(int i = 0; i < ft.selected_nets.size(); i++) {
		outFile << "    errorVec(" << i << ") <= " << ft.selected_nets[i]->name << ";\n";
	}

	outFile << "\n" << text_line << "\n";

	outFile.close();
}

void XDWSFOut::printOutput(ftSelectiveXilinx &ft, Circuit* circIn, const char* filename)
{
	this->printDWSF(ft, circIn);

	FILE* outfile;
	int i, j, k;
	char buf[BUFSIZE], buf2[BUFSIZE]; //auxiliary buffers for variable names
	vector<bool> printedNets; //if a net was already printed
	unsigned high, low; //high and low ends of a signal vector
	Lut* newLut; //pointer to newly instantiated luts
	vector<string> POsNames, POsTypes;
	vector<string> PIsNames, PIsTypes;
	vector<int> PIsVecSize;
	string newPName;
	Circuit* circ = circIn;

	cout << "Printing output file: " << filename << endl;

	outfile = fopen(filename, "w");

	fprintf(outfile, "----------------------------------------------------------------------------------\n");
	fprintf(outfile, "--Fault tolerant version of %s\n", circ->name.c_str());
	fprintf(outfile, "--Generated by ftXil, by Leonardo Pereira Santos\n");
	fprintf(outfile, "----------------------------------------------------------------------------------\n");

	fprintf(outfile, "\nlibrary IEEE;\n");
	fprintf(outfile, "use IEEE.STD_LOGIC_1164.ALL;\n");
	fprintf(outfile, "library UNISIM;\n");
	fprintf(outfile, "use UNISIM.VCOMPONENTS.ALL;\n");

	//Entity declaration************************************************************
	fprintf(outfile, "entity %s_ft_ea is\n", circ->name.c_str());

	fprintf(outfile, "    port (\n");

	//initializes printedNets
	printedNets.resize(circ->nets.size());
	for(i=0; i<printedNets.size(); i++)
		printedNets[i] = false;

	//prints primary inputs
	PIsNames.clear();
	PIsVecSize.clear();
	PIsTypes.clear();
	for(i=0; i<circ->PIs.size(); i++)
		if(!printedNets[circ->PIs[i]->id]){
			if(isVector(circ->PIs[i])){
				buildSignalVec(circ->nets, &high, &low, buf, printedNets, circ->PIs[i]->id);
				fprintf(outfile, "        %s : in STD_LOGIC_VECTOR(%d downto %d);\n", buf, high, low);

				newPName.assign(buf);
				PIsNames.push_back(newPName);

				snprintf(buf2, BUFSIZE, "STD_LOGIC_VECTOR(%d downto %d)", high, low);
				newPName.assign(buf2);
				PIsTypes.push_back(newPName);
				PIsVecSize.push_back((high - low) + 1);
			} else {
				fprintf(outfile, "        %s : in STD_LOGIC;\n", circ->PIs[i]->name.c_str());
				printedNets[circ->PIs[i]->id] = true;

				PIsNames.push_back(circ->PIs[i]->name.c_str());

				newPName.assign("STD_LOGIC");
				PIsTypes.push_back(newPName);
				PIsVecSize.push_back(1);
			}
		}

	if(options[OPT_DUPLICATE_PI]){
		fprintf(outfile, "        inputs_copy : in STD_LOGIC_VECTOR ( %ld downto 0 );\n", circ->PIs.size()-1);
	}

	//POs names must be stored to print the internal PO signals, that are required for checking.
	POsNames.clear();
	for(i=0; i<circ->POs.size(); i++){
		if(!printedNets[circ->POs[i]->id]) {
			if(isVector(circ->POs[i])){
				buildSignalVec(circ->nets, &high, &low, buf, printedNets, circ->POs[i]->id);
				fprintf(outfile, "        %s : out STD_LOGIC_VECTOR(%d downto %d);\n", buf, high, low);

				newPName.assign(buf);
				POsNames.push_back(newPName);

				snprintf(buf2, BUFSIZE, "STD_LOGIC_VECTOR(%d downto %d)", high, low);
				newPName.assign(buf2);
				POsTypes.push_back(newPName);
			} else {
				fprintf(outfile, "        %s : out STD_LOGIC;\n", circ->POs[i]->name.c_str());
				printedNets[circ->POs[i]->id] = true;

				POsNames.push_back(circ->POs[i]->name.c_str());

				newPName.assign("STD_LOGIC");
				POsTypes.push_back(newPName);
			}
		}
	}

	fprintf(outfile, "        errorVecPO : out STD_LOGIC_VECTOR(%d downto 0);\n", ft.maxsize);

	fprintf(outfile, "        errorVec : out STD_LOGIC_VECTOR(%d downto 0)\n", ft.maxsize);

	fprintf(outfile, "    );\nend %s_ft_ea;\n\n", circ->name.c_str());

	fprintf(outfile, "architecture Structure of %s_ft_ea is\n\n", circ->name.c_str());

	int errorsCnt = (int) ceil(((double) circ->POs.size()) / 3.0);

	//Signals & Components declaration************************************************************
	//error aggregation component
	if(errorsCnt > 1) {
		fprintf(outfile, "    component multiple_input_or is\n");
		fprintf(outfile, "        Generic (\n");
		fprintf(outfile, "            GATE_INPUT_SIZE : integer := %d;\n", errorsCnt);
		fprintf(outfile, "            LOG_GATE_INPUT_SIZE : integer := %d);\n", (int) ceil(log(errorsCnt)/log(2)));
		fprintf(outfile, "        Port (\n"\
						 "            input_vec : in  STD_LOGIC_VECTOR(GATE_INPUT_SIZE-1 downto 0);\n");
		fprintf(outfile, "            output : out  STD_LOGIC)\n"\
						 "        ;\n");
		fprintf(outfile, "    end component;\n\n");
	}

	fprintf(outfile, "    component comparator_coarse is\n");
	fprintf(outfile, "        Generic (\n" \
			         "            IN_WIDTH : integer := %d;\n", 6*errorsCnt);
	fprintf(outfile, "            OUT_WIDTH : integer := %d\n", 2*errorsCnt);
	fprintf(outfile, "        );\n");
	fprintf(outfile, "        Port (\n"\
			         "            inVecA : in  STD_LOGIC_VECTOR (IN_WIDTH-1 downto 0);\n");
	fprintf(outfile, "            inVecB : in  STD_LOGIC_VECTOR (IN_WIDTH-1 downto 0);\n");
	fprintf(outfile, "            errors : out  STD_LOGIC_VECTOR (OUT_WIDTH-1 downto 0)\n"\
			         "        );\n");
	fprintf(outfile, "    end component;\n\n");

	fprintf(outfile, "    component comparator_fine is\n");
	fprintf(outfile, "        Generic (\n" \
			         "            IN_WIDTH : integer := %d;\n", 2*ft.maxsize);
	fprintf(outfile, "            OUT_WIDTH : integer := %d\n", 2*ft.maxsize);
	fprintf(outfile, "        );\n");
	fprintf(outfile, "        Port (\n" \
			         "            inVecA : in  STD_LOGIC_VECTOR (IN_WIDTH-1 downto 0);\n");
	fprintf(outfile, "            inVecB : in  STD_LOGIC_VECTOR (IN_WIDTH-1 downto 0);\n");
	fprintf(outfile, "            errors : out  STD_LOGIC_VECTOR (OUT_WIDTH-1 downto 0)\n"\
			         "        );\n");
	fprintf(outfile, "    end component;\n\n");

	fprintf(outfile, "    signal cc0_cmp_in, cc1_cmp_in: STD_LOGIC_VECTOR(%d downto 0);\n", 3*errorsCnt-1);
	fprintf(outfile, "    signal cf0_cmp_outvec, cf1_cmp_outvec: STD_LOGIC_VECTOR(%d downto 0);\n", 2*ft.maxsize-1);
	fprintf(outfile, "    signal comp_coarse_out : STD_LOGIC_VECTOR(%d downto 0);\n", 2*errorsCnt-1);
	fprintf(outfile, "    signal comp_fine_in0, comp_fine_in1 : STD_LOGIC_VECTOR(%d downto 0);\n", ft.maxsize-1);
	fprintf(outfile, "    signal comp_fine_out0, comp_fine_out1 : STD_LOGIC_VECTOR(%d downto 0);\n", ft.maxsize-1);

	fprintf(outfile, "    signal sig_errorAgg : STD_LOGIC_VECTOR(1 downto 0);\n\n");

	fprintf(outfile, "    component %s is\n", (circ->name+"_dwsf").c_str());
	fprintf(outfile, "        Port (\n");
	for(i=0; i<PIsNames.size(); i++)
		fprintf(outfile, "            %s : in %s;\n", PIsNames[i].c_str(), PIsTypes[i].c_str());
	for(i=0; i<POsNames.size(); i++)
		fprintf(outfile, "            %s : out %s;\n", POsNames[i].c_str(), POsTypes[i].c_str());

	fprintf(outfile, "            errorVec : out STD_LOGIC_VECTOR(%d downto 0)\n"\
			         "        );\n", ft.maxsize-1);

	fprintf(outfile, "    end component;\n\n");

	//declares the two copies' outputs
	for(i=0; i<POsNames.size(); i++){
		fprintf(outfile, "    signal cpy0_%s :  %s;\n", POsNames[i].c_str(), POsTypes[i].c_str());
		fprintf(outfile, "    signal cpy1_%s :  %s;\n", POsNames[i].c_str(), POsTypes[i].c_str());
	}

	fprintf(outfile, "\n");

	fprintf(outfile, "begin\n"); /****************************************************/

	//instanstiate the two copies
	for(i=0; i<2; i++){
		fprintf(outfile, "    cpy%d : %s\n", i, (circ->name+"_dwsf").c_str());
		fprintf(outfile, "        port map(\n");
		if(options[OPT_DUPLICATE_PI] && i == 1) {
			int currentPIIdx = 0;
			for(j=0; j<PIsNames.size(); j++){
				if(PIsVecSize[j] > 1)
					fprintf(outfile, "            %s => inputs_copy(%d downto %d),\n", PIsNames[j].c_str(), currentPIIdx + (PIsVecSize[j]-1), currentPIIdx);
				else
					fprintf(outfile, "            %s => inputs_copy(%d),\n", PIsNames[j].c_str(), currentPIIdx);
				currentPIIdx += PIsVecSize[j];
			}
		} else {
			for(j=0; j<PIsNames.size(); j++)
				fprintf(outfile, "            %s => %s,\n", PIsNames[j].c_str(), PIsNames[j].c_str());
		}
		for(j=0; j<POsNames.size(); j++)
			fprintf(outfile, "            %s => cpy%d_%s,\n", POsNames[j].c_str(), i, POsNames[j].c_str());
		fprintf(outfile, "            errorVec => comp_fine_in%d\n", i);
		fprintf(outfile, "        );\n");
	}

	//Shorts instantiation************************************************************
	//connects one of the copies outputs to the top output
	for(i=0; i<circ->POs.size(); i++)
		fprintf(outfile, "    %s <= cpy0_%s;\n", circ->POs[i]->name.c_str(), circ->POs[i]->name.c_str());

	for(i=0; i < circ->POs.size(); i++){
		fprintf(outfile, "    cc0_cmp_in(%d) <= cpy0_%s;\n", i, circ->POs[i]->name.c_str());
		fprintf(outfile, "    cc1_cmp_in(%d) <= cpy1_%s;\n", i, circ->POs[i]->name.c_str());
	}

	for(i=circ->POs.size(); i < errorsCnt*3; i++){
		fprintf(outfile, "    cc0_cmp_in(%d) <= '0';\n", i);
		fprintf(outfile, "    cc1_cmp_in(%d) <= '0';\n", i);
	}

	fprintf(outfile, "\n");

	fprintf(outfile, "    po_checker : comparator_coarse\n");
	fprintf(outfile, "        port map (\n");
	fprintf(outfile, "            inVecA(%d downto 0) => cc0_cmp_in,\n", errorsCnt*3-1);
	fprintf(outfile, "            inVecA(%d downto %d) => cc0_cmp_in,\n", errorsCnt*6-1, errorsCnt*3);
	fprintf(outfile, "            inVecB(%d downto 0) => cc1_cmp_in,\n", errorsCnt*3-1);
	fprintf(outfile, "            inVecB(%d downto %d) => cc1_cmp_in,\n", errorsCnt*6-1, errorsCnt*3);
	fprintf(outfile, "            errors(%d downto 0) => comp_coarse_out(%d downto 0),\n", errorsCnt-1, errorsCnt-1);
	fprintf(outfile, "            errors(%d downto %d) => comp_coarse_out(%d downto %d)\n", 2*errorsCnt-1, errorsCnt, 2*errorsCnt-1, errorsCnt);
	fprintf(outfile, "        );\n");

	//Error aggregation instantiation************************************************************
	if(errorsCnt > 1){
		fprintf(outfile, "    error_aggreg : multiple_input_or\n");
		fprintf(outfile, "        port map (\n");
		fprintf(outfile, "            input_vec => comp_coarse_out(%d downto 0),\n",errorsCnt-1);
		fprintf(outfile, "            output => sig_errorAgg(0)\n");
		fprintf(outfile, "    );\n");

		fprintf(outfile, "    error_aggreg2 : multiple_input_or\n");
		fprintf(outfile, "        port map (\n");
		fprintf(outfile, "            input_vec => comp_coarse_out(%d downto %d),\n",2*errorsCnt-1, errorsCnt);
		fprintf(outfile, "            output => sig_errorAgg(1)\n");
		fprintf(outfile, "    );\n");
	} else {
		fprintf(outfile, "\n    sig_errorAgg <= comp_coarse_out;\n\n");
	}

	fprintf(outfile, "    sig_checker : comparator_fine\n");
	fprintf(outfile, "        port map (\n");
	fprintf(outfile, "            inVecA(%d downto 0) => comp_fine_in0,\n", ft.maxsize-1);
	fprintf(outfile, "            inVecA(%d downto %d) => comp_fine_in0,\n", ft.maxsize*2-1, ft.maxsize);
	fprintf(outfile, "            inVecB(%d downto 0) => comp_fine_in1,\n", ft.maxsize-1);
	fprintf(outfile, "            inVecB(%d downto %d) => comp_fine_in1,\n", ft.maxsize*2-1, ft.maxsize);
	fprintf(outfile, "            errors(%d downto 0) => comp_fine_out0,\n", ft.maxsize-1);
	fprintf(outfile, "            errors(%d downto %d) => comp_fine_out1\n", ft.maxsize*2-1, ft.maxsize);
	fprintf(outfile, "        );");

	fprintf(outfile, "\n    errorVec(%d downto 1) <= comp_fine_out0;\n", ft.maxsize);
	fprintf(outfile, "    errorVec(0) <= sig_errorAgg(0);\n");
	fprintf(outfile, "    errorVecPO(%d downto 1) <= comp_fine_out1;\n", ft.maxsize);
	fprintf(outfile, "    errorVecPO(0) <= sig_errorAgg(1);\n\n");

	fprintf(outfile, "end Structure;\n");

	fclose(outfile);
}

// netgen -intstyle ise -s 2  -pcf counter_timing.pcf -rpw 100 -tpw 0 -ar Structure -tm counter_timing -w -dir netgen/map -ofmt vhdl -sim counter_timing_map.ncd counter_timing_map.vhd

// /opt/Xilinx/13.4/ISE_DS/ISE/bin/lin64/netgen -intstyle ise -s 2  -pcf alu4.new.pcf -rpw 100 -tpw 0 -ar Structure -tm fault_inj_top -w -dir netgen/map -ofmt vhdl -sim alu4.new.map.ncd alu4.new_timing_map.vhd
