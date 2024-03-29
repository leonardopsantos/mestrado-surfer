/** \file XMapParser.cpp
    \brief Parser for Xilinx post-mapping netlist

    \author Leonardo Pereira Santos <leonardo.santos@restinga.ifrs.edu.br>
*/


using namespace std;

#include <sstream>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <map>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <sstream>

#include "XMapParser.h"

void XMapParser::getNetName(char *src, char *dst)
{
	int i;

	for(i=0; src[i] != ' ' && src[i] != 0 && src[i] != ',' && src[i] != ';'; i++)
		dst[i] = src[i];

	dst[i] = 0;
}


compType XMapParser::string2type(char *src)
{
	if(strstr(src, "LUT"))
		return LUT;

	if(strstr(src, "X_BUF"))
		return BUF;

	if(strstr(src, "MUXF7") || strstr(src, "X_MUX2") )
		return MUXF7;

	if(strstr(src, "MUXF8"))
		return MUXF8;

	if(strstr(src, "MUXCY"))
		return MUXCY;

	if(strstr(src, "XORCY"))
		return XORCY;

	if(strstr(src, "INV"))
		return INV;

	if(strstr(src, "FDR") && strlen(src) == 3)
		return FDR;

	if(strstr(src, "FDRS") && strlen(src) == 4)
		return FDRS;

	if(strstr(src, "FDRSE") && strlen(src) == 5)
		return FDRSE;

	if(strstr(src, "FDRE") && strlen(src) == 4)
		return FDRE;

	//if(strstr(src, "DSP48E"))
	//	return DSP48E;

	if(strstr(src, "GND"))
		return ZERO;

	if(strstr(src, "VCC"))
		return ONE;

	if(strstr(src, "X_ROC"))
		return X_ROC;

	if(strstr(src, "X_TOC"))
		return X_TOC;

	if(strstr(src, "X_CARRY4"))
		return X_CARRY4;

	if(strstr(src, "X_ONE"))
		return X_ONE;

	if(strstr(src, "X_ZERO"))
		return X_ZERO;

	if(strstr(src, "X_OBUF"))
		return X_OBUF;

	return UNKNOWN;
}

/**
 * Searches for a text sequence in the input stream, stops when the sequence is found
 * @param inFile input stream to be searched
 * @param seq text sequence to be found
 * @return 1 if sequence found, 0 otherwise
 */
int XMapParser::findSequence(ifstream &inFile, string seq, string *line)
{
	string text_line;
	bool found = false;

	while( 1 ) {
		getline(inFile,text_line);
		if (inFile.eof()) break;
		if( text_line.find(seq) != std::string::npos ) {
			found = true;
			*line = text_line;
			break;
		}
	}

	return (found == true ? 1 : 0);
}

/**
 * Parses the Primary Inputs (PIs) and Primary Outputs (POs) of an entity
 * @param inFile Input stream
 * @param circ Circuit to store the objects found
 * @return 0 if successful, -1 otherwise
 */
int XMapParser::parsePiPos(ifstream &inFile, Circuit &circ)
{
/*	entity comb_benches_blif_alu4_INST_1 is
	  port (
		inputVector : in STD_LOGIC_VECTOR ( 13 downto 0 );
		outputVector : out STD_LOGIC_VECTOR ( 7 downto 0 )
	  );
	end comb_benches_blif_alu4_INST_1; */

	string text_line;

	Net* newNet;

	char name[1024], type[128], bitName[1024], direction[4], to_downto[32], lutInit[18];
	unsigned int upper, lower, locX, locY;
	int i;

	while(1) {
		std::getline(inFile, text_line);

		if( text_line.find("end") != std::string::npos || text_line.find("  );") != std::string::npos )
			return 0;

		if(strstr(text_line.c_str(), " STD_LOGIC_VECTOR ")){
			sscanf(text_line.c_str(), "    %s : %s %s ( %d %s %d )", name, direction, type, &upper, to_downto, &lower);
			//dealing with a vector port
			if(upper < lower){ //checks if "upper" and "lower" limits are not switched
				//"to" declaration (not "downto")
				int aux = upper;
				upper = lower;
				lower = aux;
			}
			for(i=lower; i<=upper; i++){
				if(options[OPT_NOVEC])
					snprintf(bitName, BUF_SIZE, "%s_%d_nv", name, i); //generates this bit's name
				else
					snprintf(bitName, BUF_SIZE, "%s(%d)", name, i); //generates this bit's name
				newNet = new Net(bitName, nextNet++);
				if(direction[0] == 'i'){
					newNet->isPI = true;
					circ.PIs.push_back(newNet);
				} else {
					newNet->isPO = true;
					circ.POs.push_back(newNet);
				}
				circ.nets.push_back(newNet);
				//the symbolTable must maintain the original name, i.e., as if using STD_LOGIC_VECTOR
				if(options[OPT_NOVEC]){
					snprintf(bitName, BUF_SIZE, "%s(%d)", name, i); //generates this bit's name
					symbolTable[string(bitName)] = newNet;
				} else
				 	symbolTable[newNet->name] = newNet;
			}
		} else {
			sscanf(text_line.c_str(), "    %s : %s %s", name, direction, type);
			//std_logic port
			newNet = new Net(name, nextNet++);
			if(direction[0] == 'i') {
				newNet->isPI = true;
				circ.PIs.push_back(newNet);
			} else {
				newNet->isPO = true;
				circ.POs.push_back(newNet);
			}
			circ.nets.push_back(newNet);
			symbolTable[newNet->name] = newNet;
		}
	}

	return 0;
}

/**
 * Parses the LOC IN generic map
 * @param l Lut to receive the parsed value
 * @param loc LOC to be parsed
 * @return 0 if successful, -1 otherwise
 */
// Yes, a REGEX would be perfect here. No, I'm not an idiot, I don't use it
// because g++ 4.8.2 doesn't supports the extented syntax we need for
// capture groups
int XMapParser::parseXY(Component *l, char *loc)
{
int i;
char s[128], *p;

	// SLICE_X33Y145

	if( strstr(loc, "SLICE_") != NULL ) {
		for(i = 0, p = loc+7; i < sizeof(s)-1 && *p != '\0' && *p != 'Y'; i++)
			s[i] = *p++;

		s[i] = '\0';
	} else if( strstr(loc, "IOB_") != NULL ) {
		for(i = 0, p = loc+5; i < sizeof(s)-1 && *p != '\0' && *p != 'Y'; i++)
			s[i] = *p++;

		s[i] = '\0';
	} else
		return -1;

	sscanf(s, "%d", &l->locX);
	sscanf(p+1, "%d", &l->locY);

	return 0;
}

/**
 * Parses an architecture defined in the post-mapping simulation model
 * @param inFile Post-mapping simulation model vhdl file
 * @param circ circuit to store the parsed objects
 * @return 0 if parse successful, -1 if not
 */
int XMapParser::parseArchitecture(ifstream &inFile, Circuit &circ)
{
	char buf[BUF_SIZE], name[BUF_SIZE], bitName[BUF_SIZE];
	char direction[4], type[128], to_downto[32], lutInit[18];
	char *ptr;

	Net* newNet;
	Lut* newLut;
	Short* newShort;
	Mux* newMux;
	Buf* newBuf;
	Xor* newXor;
	FlipFlop* newFF;
	Carry *newCarry;
	unsigned int upper, lower, locX, locY;
	int i, j;
	bool end=false;
	Net *netTarg, *netSrc;

	string text_line;

	while(1) {

		std::getline(inFile, text_line);

		if( inFile.eof() || text_line.find("begin") != std::string::npos )
			break;

		if( text_line.find("signal") != std::string::npos ) {
			this->ParseSignal(text_line, circ.nets.size(), circ);
		}
	}

	while(1){
		//parses all components
		inFile.getline(buf, BUF_SIZE); //gets the first component line

		if( inFile.eof() || strstr(buf, "end Structure") != NULL )
			break;

		if( strchr(buf, ':') != NULL ) {
			//component instance
			compType ctype;

			sscanf(buf, "  %s : %s\n", name, type);
			ctype = XMapParser::string2type(type);

			if(ctype == UNKNOWN)
				cout << "unknown type found: " << type << endl;

			switch(ctype){
				case LUT:
					newLut = new Lut(name, nextLut++);

					inFile.getline(buf, BUF_SIZE); //skips "generic map("

					inFile.getline(buf, BUF_SIZE); // LOC => "SLICE_X54Y146",

					sscanf(buf, "      LOC => \"%s\"\n", bitName);
					ptr = strchr(bitName, '\"');
					if( ptr != NULL )
						*ptr = '\0';
					parseXY(newLut, bitName);

					inFile.getline(buf, BUF_SIZE); // INIT => X"FCFC0C0C03FCF30C"
					sscanf(buf, "      INIT => X\"%s\"", lutInit);
					XSynthParser::parseTable(lutInit, newLut->tableO6);

					inFile.getline(buf, BUF_SIZE); //skips ")"
					inFile.getline(buf, BUF_SIZE); //skips "port map("
					inFile.getline(buf, BUF_SIZE); //reads first input
					while(buf[6] == 'A') { //reads all inputs
						getNetName(buf + 14, name);

						if( name[0] == '\'' && name[1] == '1' && name[2] == '\'' ) { // ADR0 => '1',
							inFile.getline(buf, BUF_SIZE); //reads next input
							continue;
						}

						netSrc = symbolTable[name];
						//if(netSrc->id == 17)
						//	cout << "name: " << newLut->name << endl;
						newLut->inputs.push_back(netSrc);
						netSrc->outputs.push_back(newLut);
						inFile.getline(buf, BUF_SIZE); //reads next input
					}
					//parses output
					getNetName(buf + 11, name);
					netTarg = symbolTable[name];
					newLut->outputs.push_back(netTarg);
					netTarg->setInput(newLut);
					circ.luts.push_back(newLut);
					inFile.getline(buf, BUF_SIZE); //skips ");"
					break;

				case BUF:
					newBuf = new Buf(name, nextComp);
					inFile.getline(buf, BUF_SIZE); //skips "generic map"
					while(buf[4] != 'p')
						inFile.getline(buf, BUF_SIZE); //skips everything until the port map

					inFile.getline(buf, BUF_SIZE); //input line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newBuf->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newBuf);

					inFile.getline(buf, BUF_SIZE); //output line
					getNetName(buf + 11, name);
					netTarg = symbolTable[name];
					newBuf->outputs.push_back(netTarg);
					netTarg->setInput(newBuf);
//					if(netTarg->isPO){
						circ.components.push_back(newBuf);
						nextComp++;
//					}

					inFile.getline(buf, BUF_SIZE); //skips ");"
					break;

				case MUXF7:
				case MUXF8:
				case MUXCY:
					newMux = new Mux(name, nextComp++);

					newMux->type = ctype;
					if(ctype == MUXF8)
						cout << "WARNING!! MUXF8 found!\n\n\n" << endl;
					inFile.getline(buf, BUF_SIZE); //skips "generic map("
					inFile.getline(buf, BUF_SIZE); // LOC => "SLICE_X68Y151"

					sscanf(buf, "      LOC => \"%s\"\n", bitName);
					ptr = strchr(bitName, '\"');
					if( ptr != NULL )
						*ptr = '\0';
					parseXY(newMux, bitName);

					inFile.getline(buf, BUF_SIZE); //skips ")"
					inFile.getline(buf, BUF_SIZE); //skips "port map("
					inFile.getline(buf, BUF_SIZE); //I0 (CI) line
					getNetName(buf + 12, name);

					if( !(name[0] == '\'' && name[1] == '1' && name[2] == '\'') &&
						!(name[0] == '\'' && name[1] == '0' && name[2] == '\'') ) { // '1','0'
						netSrc = symbolTable[name];
						newMux->inputs.push_back(netSrc);
						netSrc->outputs.push_back(newMux);
					}

					inFile.getline(buf, BUF_SIZE); //I1 (DI) line
					getNetName(buf + 12, name);

					if( !(name[0] == '\'' && name[1] == '1' && name[2] == '\'') &&
						!(name[0] == '\'' && name[1] == '0' && name[2] == '\'') ) { // '1','0'
						netSrc = symbolTable[name];
						newMux->inputs.push_back(netSrc);
						netSrc->outputs.push_back(newMux);
					}

					inFile.getline(buf, BUF_SIZE); //O line
					getNetName(buf + 11, name);

					netTarg = symbolTable[name];
					newMux->outputs.push_back(netTarg);
					netTarg->setInput(newMux);

					inFile.getline(buf, BUF_SIZE); //SEL line
					getNetName(buf + 13, name);
					netSrc = symbolTable[name];
					newMux->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newMux);

					circ.components.push_back(newMux);

					inFile.getline(buf, BUF_SIZE); //skips ");"
					break;

				case INV: //an inverter will be mapped into a LUT by ISE, so I might do it right now
					newLut = new Lut(name, nextLut++);
					inFile.getline(buf, BUF_SIZE); //skips "generic map"
					while(buf[4] != 'p')
						inFile.getline(buf, BUF_SIZE); //skips everything until the port map
					//inverter truth table
					newLut->tableO6.resize(2);
					newLut->tableO6[0] = true;
					newLut->tableO6[1] = false;
					inFile.getline(buf, BUF_SIZE); //input line
					getNetName(buf + 11, name);
					if( !(name[0] == '\'' && name[1] == '1' && name[2] == '\'') &&
						!(name[0] == '\'' && name[1] == '0' && name[2] == '\'') ) { // '1','0'
						netSrc = symbolTable[name];
						newLut->inputs.push_back(netSrc);
						netSrc->outputs.push_back(newLut);
					}

					inFile.getline(buf, BUF_SIZE); //output line
					getNetName(buf + 11, name);
					if( !(name[0] == '\'' && name[1] == '1' && name[2] == '\'') &&
						!(name[0] == '\'' && name[1] == '0' && name[2] == '\'') ) { // '1','0'
						netTarg = symbolTable[name];
						newLut->outputs.push_back(netTarg);
						netTarg->setInput(newLut);
					}
					circ.luts.push_back(newLut);

					inFile.getline(buf, BUF_SIZE); //skips ");"
					break;

				case XORCY:
					newXor = new Xor(name, nextComp++);

					inFile.getline(buf, BUF_SIZE); //skips "port map("
					inFile.getline(buf, BUF_SIZE); //CI line
					getNetName(buf + 12, name);
					netSrc = symbolTable[name];
					newXor->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newXor);

					inFile.getline(buf, BUF_SIZE); //LI line
					getNetName(buf + 12, name);
					netSrc = symbolTable[name];
					newXor->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newXor);

					inFile.getline(buf, BUF_SIZE); //O line
					getNetName(buf + 11, name);
					netTarg = symbolTable[name];
					newXor->outputs.push_back(netTarg);
					netTarg->setInput(newXor);

					circ.components.push_back(newXor);

					inFile.getline(buf, BUF_SIZE); //skips ");"

					break;

				case DSP48E:
					while(buf[5] != ';')
						inFile.getline(buf, BUF_SIZE);
					break;

				case FDR:
					newFF = new FlipFlop(name, nextComp++, FDR);
					inFile.getline(buf, BUF_SIZE); //skips "port map("

					inFile.getline(buf, BUF_SIZE); //(C) clock line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);
					circ.clocks.insert(netSrc); //This net is a clock, it may need special treatment

					inFile.getline(buf, BUF_SIZE); //D line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);

					inFile.getline(buf, BUF_SIZE); //R line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);
					circ.resets.insert(netSrc); //This net is a reset, it may need special treatment
					if(!(strstr(name, "GLNRST") && strlen(name) == 6)){
						fprintf(stderr, "Rst named: %s\n", name);
						exit(0);
					}

					inFile.getline(buf, BUF_SIZE); //Q line
					getNetName(buf + 11, name);
					netTarg = symbolTable[name];
					newFF->outputs.push_back(netTarg);
					netTarg->setInput(newFF);

					circ.ffs.push_back(newFF);
					inFile.getline(buf, BUF_SIZE); //skips ");"
					break;

				case FDRS:
					newFF = new FlipFlop(name, nextComp++, FDRS);
					inFile.getline(buf, BUF_SIZE); //skips "port map("

					inFile.getline(buf, BUF_SIZE); //(C) clock line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);
					circ.clocks.insert(netSrc); //This net is a clock, it may need special treatment

					inFile.getline(buf, BUF_SIZE); //D line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);

					inFile.getline(buf, BUF_SIZE); //R line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);
					circ.resets.insert(netSrc); //This net is a reset, it may need special treatment
					if(!(strstr(name, "GLNRST") && strlen(name) == 6)){
						fprintf(stderr, "Rst named: %s\n", name);
						exit(0);
					}

					inFile.getline(buf, BUF_SIZE); //S line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);
					circ.sets.insert(netSrc); //This net is a set, it may need special treatment
					if(strstr(name, "GLNRST")){
						fprintf(stderr, "Set named: %s\n", name);
						exit(0);
					}

					inFile.getline(buf, BUF_SIZE); //Q line
					getNetName(buf + 11, name);
					netTarg = symbolTable[name];
					newFF->outputs.push_back(netTarg);
					netTarg->setInput(newFF);

					circ.ffs.push_back(newFF);
					inFile.getline(buf, BUF_SIZE); //skips ");"
					break;

				case FDRSE:
					newFF = new FlipFlop(name, nextComp++, FDRSE);
					inFile.getline(buf, BUF_SIZE); //skips "port map("

					inFile.getline(buf, BUF_SIZE); //(C) clock line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);
					circ.clocks.insert(netSrc); //This net is a clock, it may need special treatment

					inFile.getline(buf, BUF_SIZE); //CE line
					getNetName(buf + 12, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);

					inFile.getline(buf, BUF_SIZE); //D line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);

					inFile.getline(buf, BUF_SIZE); //R line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);
					circ.resets.insert(netSrc); //This net is a reset, it may need special treatment
					if(!(strstr(name, "GLNRST") && strlen(name) == 6)){
						fprintf(stderr, "Rst named: %s\n", name);
						exit(0);
					}

					inFile.getline(buf, BUF_SIZE); //S line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);
					circ.sets.insert(netSrc); //This net is a set, it may need special treatment
					if(strstr(name, "GLNRST")){
						fprintf(stderr, "Set named: %s\n", name);
						exit(0);
					}

					inFile.getline(buf, BUF_SIZE); //Q line
					getNetName(buf + 11, name);
					netTarg = symbolTable[name];
					newFF->outputs.push_back(netTarg);
					netTarg->setInput(newFF);

					circ.ffs.push_back(newFF);
					inFile.getline(buf, BUF_SIZE); //skips ");"
					break;

				case FDRE:
					newFF = new FlipFlop(name, nextComp++, FDRE);
					inFile.getline(buf, BUF_SIZE); //skips "port map("

					inFile.getline(buf, BUF_SIZE); //(C) clock line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);
					circ.clocks.insert(netSrc); //This net is a clock, it may need special treatment

					inFile.getline(buf, BUF_SIZE); //CE line
					getNetName(buf + 12, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);

					inFile.getline(buf, BUF_SIZE); //D line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);

					inFile.getline(buf, BUF_SIZE); //R line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newFF->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newFF);
					circ.resets.insert(netSrc); //This net is a reset, it may need special treatment
					if(!(strstr(name, "GLNRST") && strlen(name) == 6)){
						fprintf(stderr, "Rst named: %s\n", name);
						exit(0);
					}

					inFile.getline(buf, BUF_SIZE); //Q line
					getNetName(buf + 11, name);
					netTarg = symbolTable[name];
					newFF->outputs.push_back(netTarg);
					netTarg->setInput(newFF);

					circ.ffs.push_back(newFF);
					inFile.getline(buf, BUF_SIZE); //skips ");"
					break;

				case ZERO:
					inFile.getline(buf, BUF_SIZE); //skips "generic map"
					while(buf[4] != 'p') //skips everything until the port map
						inFile.getline(buf, BUF_SIZE); //some X_ZEROs have generic map..

					inFile.getline(buf, BUF_SIZE); //reads output
					getNetName(buf + 11, name);
					netTarg = symbolTable[name];
					netTarg->setInput(NULL, GND);
					circ.gndNet = netTarg;

					inFile.getline(buf, BUF_SIZE); //skips ");"
					break;

				case ONE:
					inFile.getline(buf, BUF_SIZE); //skips "generic map"
					while(buf[4] != 'p') //skips everything until the port map
						inFile.getline(buf, BUF_SIZE);

					inFile.getline(buf, BUF_SIZE); //reads output
					getNetName(buf + 11, name);
					netTarg = symbolTable[name];
					netTarg->setInput(NULL, VCC);
					circ.vccNet = netTarg;

					inFile.getline(buf, BUF_SIZE); //skips ");"
					break;

				case X_ROC: // Do nothing
					inFile.getline(buf, BUF_SIZE); //skips "generic map"
					inFile.getline(buf, BUF_SIZE); //skips "port map"
					break;

				case X_TOC: // Do nothing
					inFile.getline(buf, BUF_SIZE); //skips "port map"
					break;

				case X_CARRY4: // Do nothing
					newCarry = new Carry(name, nextComp++);

					inFile.getline(buf, BUF_SIZE); //skips "generic map("

					inFile.getline(buf, BUF_SIZE); // LOC => "SLICE_X54Y146",

					sscanf(buf, "      LOC => \"%s\"\n", bitName);
					ptr = strchr(bitName, '\"');
					if( ptr != NULL )
						*ptr = '\0';
					parseXY(newCarry, bitName);

					inFile.getline(buf, BUF_SIZE); //skips ")"
					inFile.getline(buf, BUF_SIZE); //skips "port map("

					inFile.getline(buf, BUF_SIZE); // CI => '0',
					getNetName(buf + 12, name);
					if( !(name[0] == '\'' && name[1] == '1' && name[2] == '\'') &&
						!(name[0] == '\'' && name[1] == '0' && name[2] == '\'') ) { // '1', '0'
						netSrc = symbolTable[name];
						newCarry->inputs.push_back(netSrc);
						netSrc->outputs.push_back(newCarry);
					}

					inFile.getline(buf, BUF_SIZE); // CYINIT => comp_op2,
					getNetName(buf + 16, name);
					if( !(name[0] == '\'' && name[1] == '1' && name[2] == '\'') &&
						!(name[0] == '\'' && name[1] == '0' && name[2] == '\'') ) { // '1', '0'
						netSrc = symbolTable[name];
						newCarry->inputs.push_back(netSrc);
						netSrc->outputs.push_back(newCarry);
					}

					for(i = 0; i < 4; i++) {
						inFile.getline(buf, BUF_SIZE); // CO(3) => Madd_res_add_Madd_cy_3_Q_2348,
						getNetName(buf + 15, name);
						netTarg = symbolTable[name];
						newCarry->outputs.push_back(netTarg);
						netTarg->setInput(newCarry);
					}

					for(i = 0; i < 4; i++) {
						inFile.getline(buf, BUF_SIZE); // DI(3) => op1(3),
						getNetName(buf + 15, name);
						if( !(name[0] == '\'' && name[1] == '1' && name[2] == '\'') &&
							!(name[0] == '\'' && name[1] == '0' && name[2] == '\'') ) { // '1', '0'
							netSrc = symbolTable[name];
							newCarry->inputs.push_back(netSrc);
							netSrc->outputs.push_back(newCarry);
						}
					}

					for(i = 0; i < 4; i++) {
						inFile.getline(buf, BUF_SIZE); // O(3) => res_add(3),
						getNetName(buf + 14, name);
						netTarg = symbolTable[name];
						newCarry->outputs.push_back(netTarg);
						netTarg->setInput(newCarry);
					}

					for(i = 0; i < 4; i++) {
						inFile.getline(buf, BUF_SIZE); // S(3) => Madd_res_add_Madd_lut(3),
						getNetName(buf + 14, name);
						if( !(name[0] == '\'' && name[1] == '1' && name[2] == '\'') &&
							!(name[0] == '\'' && name[1] == '0' && name[2] == '\'') ) { // '1', '0'
							netSrc = symbolTable[name];
							newCarry->inputs.push_back(netSrc);
							netSrc->outputs.push_back(newCarry);
						}
					}

					circ.components.push_back(newCarry);
					inFile.getline(buf, BUF_SIZE); //skips ");"
					break;

				case X_ONE: // Do nothing
				case X_ZERO: // Do nothing
					do {
						inFile.getline(buf, BUF_SIZE); // DI(3) => op1(3),
					} while( strstr(buf, "    );") == NULL );
					break;

				case X_OBUF:
					newBuf = new Buf(name, nextComp++);

					inFile.getline(buf, BUF_SIZE); //skips "generic map("

					inFile.getline(buf, BUF_SIZE); // LOC => "SLICE_X54Y146",

					sscanf(buf, "      LOC => \"%s\"\n", bitName);
					ptr = strchr(bitName, '\"');
					if( ptr != NULL )
						*ptr = '\0';
					parseXY(newBuf, bitName);

					inFile.getline(buf, BUF_SIZE); //skips ")"
					inFile.getline(buf, BUF_SIZE); //skips "port map("

					inFile.getline(buf, BUF_SIZE); //input line
					getNetName(buf + 11, name);
					netSrc = symbolTable[name];
					newBuf->inputs.push_back(netSrc);
					netSrc->outputs.push_back(newBuf);

					inFile.getline(buf, BUF_SIZE); //output line
					getNetName(buf + 11, name);
					netTarg = symbolTable[name];
					newBuf->outputs.push_back(netTarg);
					netTarg->setInput(newBuf);
//					if(netTarg->isPO){
						circ.components.push_back(newBuf);
						nextComp++;
//					}

					inFile.getline(buf, BUF_SIZE); //skips ");"
					break;

				default:
					end = true;
					break;
			}
			if(end) //if an unknown component was found, then it's the end (usually an X_)
				break;
		}
	}
	return 0;
}

/**
 * Parser for post-mapping simulation model. DOES NOT call the post-synthesis parser.
 * @param filename Name of the .vhd post-mapping simulation model.
 * @param circ Circuit
 */
int XMapParser::parse(char *synth_filename, Circuit &synth_circ, string &map_filename, Circuit &circ_cpy0, Circuit &circ_cpy1)
{

	circ_cpy0.clear();
	circ_cpy1.clear();

	ifstream inFile(map_filename.c_str());
	if( inFile.is_open() != true ) {
		cout << "error opening " << map_filename.c_str() << endl;
		exit(-1);
	}

	circ_cpy0.VhdlName = map_filename;
	circ_cpy1.VhdlName = map_filename;

	string text_line, entity_name;
	bool found = false;

	if( findSequence(inFile, "entity "+synth_circ.name, &text_line) == 0 )
		return -1;

	// not the same as synth_circ.name ( _INST_1 )
	std::stringstream ss(text_line);
	std::string item;
	while (std::getline(ss, item, ' ')) {
		if( item.find(synth_circ.name) != std::string::npos ) {
			entity_name = item;
			break;
		}
	}

	int inFilePosition = inFile.tellg();

	if( findSequence(inFile, ": " + entity_name, &text_line) == 0 )
		return -1;

	ss.clear();
	ss.str ("");
	ss << text_line;
	ss >> item;

	Circuit *circ;
	bool iscpy0;

	if( item == "cpy0" ) {
		circ_cpy0.name = entity_name;
		circ = &circ_cpy0;
		iscpy0 = true;
	} else if( item == "cpy1" ) {
		circ_cpy1.name = entity_name;
		circ = &circ_cpy1;
		iscpy0 = false;
	} else {
		cout << "OOOPs, can't find cpy0 or cpy1!!\n";
		return -1;
	}

	inFile.seekg (inFilePosition, inFile.beg);

	if( findSequence(inFile, "port (", &text_line) == 0 )
		return -1;

	parsePiPos(inFile, *circ);

	if( findSequence(inFile, "architecture Structure of " + entity_name + " is", &text_line) == 0 ) {
		cout << "Can't find architecture of" << entity_name << "!!\n";
		return -1;
	}

	int i;

	// nice, we have the architecture, now parse it
	i = parseArchitecture(inFile, *circ);
	if( i != 0 ) return -1;

	// Now look for cpy1
	if( findSequence(inFile, "entity "+synth_circ.name, &text_line) == 0 )
		return -1;

	// not the same as synth_circ.name ( _INST_1 )
	ss.clear();
	ss.str ("");
	ss << text_line;
	while (std::getline(ss, item, ' ')) {
		if( item.find(synth_circ.name) != std::string::npos ) {
			entity_name = item;
			break;
		}
	}

	inFilePosition = inFile.tellg();

	if( findSequence(inFile, ": " + entity_name, &text_line) == 0 )
		return -1;

	ss.clear();
	ss.str ("");
	ss << text_line;
	ss >> item;

	if( item == "cpy0" && iscpy0 == false ) {
		circ_cpy0.name = entity_name;
		circ = &circ_cpy0;
	} else if( item == "cpy1" && iscpy0 == true ) {
		circ_cpy1.name = entity_name;
		circ = &circ_cpy1;
	} else {
		cout << "OOOPs, can't find cpy0 or cpy1!!\n";
		return -1;
	}

	inFile.seekg (inFilePosition, inFile.beg);


	if( findSequence(inFile, "port (", &text_line) == 0 )
		return -1;

	parsePiPos(inFile, *circ);

	if( findSequence(inFile, "architecture Structure of " + entity_name + " is", &text_line) == 0 ) {
		cout << "Can't find architecture of" << entity_name << "!!\n";
		return -1;
	}

	// nice, we have the architecture, now parse it
	i = parseArchitecture(inFile, *circ);
	if( i != 0 ) return -1;

	// Now we should have all components from the 3 circuits. Check everything is OK.

//	circ_cpy0.ClearBuffers();
//	circ_cpy1.ClearBuffers();

	circ_cpy0.ClearNets();
	circ_cpy1.ClearNets();

	return 0;
}

int XMapParser::parseCpy0(char *synth_filename, Circuit &synth_circ, string &map_filename, Circuit &circ_cpy0)
{

	circ_cpy0.clear();

	ifstream inFile(map_filename.c_str());
	circ_cpy0.VhdlName = map_filename;

	string text_line, entity_name;

	if( findSequence(inFile, "entity "+synth_circ.name, &text_line) == 0 )
		return -1;

	// not the same as synth_circ.name ( _INST_1 )
	std::stringstream ss(text_line);
	std::string item;
	while (std::getline(ss, item, ' ')) {
		if( item.find(synth_circ.name) != std::string::npos ) {
			entity_name = item;
			break;
		}
	}

	circ_cpy0.name = entity_name;

	if( findSequence(inFile, "port (", &text_line) == 0 )
		return -1;

	parsePiPos(inFile, circ_cpy0);

	if( findSequence(inFile, "architecture Structure of " + entity_name + " is", &text_line) == 0 ) {
		cout << "Can't find architecture of" << entity_name << "!!\n";
		return -1;
	}

	int i;

	// nice, we have the architecture, now parse it
	i = parseArchitecture(inFile, circ_cpy0);
	if( i != 0 ) return -1;

//	circ_cpy0.ClearBuffers();
	circ_cpy0.ClearNets();

	return 0;
}

// /opt/Xilinx/13.4/ISE_DS/ISE/bin/lin64/netgen -intstyle ise -s 2  -pcf alu4.new.pcf -rpw 100 -tpw 0 -ar Structure -tm fault_inj_top -w -dir netgen/map -ofmt vhdl -sim alu4.new.map.ncd alu4.new_timing_map.vhd

// /opt/Xilinx/13.4/ISE_DS/ISE/bin/lin64/netgen -intstyle ise -s 2  -pcf pdc.new.pcf -rpw 100 -tpw 0 -ar Structure -tm fault_inj_top -w -dir netgen/map -ofmt vhdl -sim pdc.new.map.ncd pdc.new_timing_map.vhd

// /opt/Xilinx/13.4/ISE_DS/ISE/bin/lin64/netgen -intstyle ise -s 2  -pcf alu_cell.pcf -rpw 100 -tpw 0 -ar Structure -tm fault_inj_top -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim alu_cell.ncd alu_cell_timesim.vhd
