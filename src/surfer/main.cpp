/*************************************************************************/
/*
 *  Fault tolerance insertion for Xilinx FPGAs
 *  by Gabriel Luca Nazar <glnazar@inf.ufrgs.br>
 *
 */
/*************************************************************************/

#include "circuit.h"
#include "XSynthParser.h"
#include "XMapParser.h"
#include "ftXilinx.h"
#include "XSynthOut.h"
#include "XDWCCOut.h"
#include "XDWSFOut.h"
#include "ftSelectiveXilinx.h"
#include <cstdlib>

bool options[OPT_CNT];

using namespace std;

int main(int argc, char *argv[]){
	if(argc < 2){
		cout << "Use: " << argv[0] << " <input_file> [OPTIONS]" << endl;
		cout << "Options:" << endl;
		cout << "-use7: Use parity prediction with 7 inputs (no output is generated)" << endl;
		cout << "-use4: Use direct checking for 4-adjacencies" << endl;
		cout << "-da: Uses DWC with adders" << endl; //
		cout << "-a: Aggressive area minimization" << endl;
		cout << "-ea: Include error aggregation circuit" << endl; //*
		cout << "-dwcf: Use only DWC with fine comparison grain" << endl; //*
		cout << "-dwcc: Use only DWC with coarse comparison grain" << endl; //*
		cout << "-s: Full route splitting" << endl;
		cout << "-cm: Uses dedicated checkers for non-duplicated MUXFx's" << endl;
		cout << "-io: Merges all I/O ports into two vectors" << endl;
		cout << "-nv: Avoids using the STD_LOGIC_VECTOR type for signals in the original circuit" << endl;
		cout << "-m: The same as -ea -da -s" << endl;
		cout << "-cc: Chain checkers (uses carry chain for parity checking)" << endl; //*
		cout << "-dr: Dual rail checking" << endl; //
		cout << "-sc: Split checking" << endl; //*
		cout << "-st: Stack checkers" << endl; //*
		cout << "-mc <num>: Maximum checker has <num> LUTs (only valid with -cc)" << endl;
		cout << "-mg <num>: Maximum group size (maximum: 5)" << endl;
		cout << "-dm: Forces all MUXFx's to be duplicated" << endl; //*
		cout << "-nc: Does not print checkers" << endl;
		cout << "-ndn: No duplicated nets usage for checkers" << endl;
		cout << "-di: Duplicated inputs" << endl; //*
		cout << "-ncmp : Do not use the comparator module" << endl;
		cout << "-ffc: Flip-flop inputs and POs comparison only" << endl;
		cout << "-epws: Make comparator width the same as the # of POs" << endl;
		cout << "-dwsf <input_file>: Use only DWC with selective fine comparison grain" << endl; //*
		cout << "-loc <input_file>: Parses the post-mapping model to read the LOC constrains. Creates a UCF with duplicated LOC constrains" << endl; //*
		exit(0);
	}

	int i;
	int maxcheck = DEFAULT_MAXCHECK_CC;
	int maxgroup = DEFAULT_MAXGROUP_CC;
	
	std::string post_map_vhd;

	for(i=0; i<OPT_CNT; i++)
		options[i] = false;
	
	for(i=2; i<argc; i++){
		int length = strlen(argv[i]);
		switch(length){
			case 5:
				if(strstr(argv[i], "-use4")){
					options[OPT_USE4ADJ] = true;
					continue;
				}
				if(strstr(argv[i], "-dwcf")){
					options[OPT_DWCF] = true;
					continue;
				}
				if(strstr(argv[i], "-dwcc")){
					options[OPT_DWCC] = true;
					continue;
				}
				if(strstr(argv[i], "-ncmp")){
					options[OPT_NO_CMP_MODULE] = true;
					continue;
				}
				if(strstr(argv[i], "-epws")){
					options[OPT_ERROR_PO_SAMEW] = true;
					continue;
				}
				if(strstr(argv[i], "-dwsf")){
					options[OPT_DWSF] = true;
					if( i == argc-1 ) {
						cout << "Need post-mapping vhdl file for -dwsf option!!" << endl; //*
						exit(0);
					}
					post_map_vhd.append(argv[++i]);
					continue;
				}
				break;
			case 4:
				if(strstr(argv[i], "-ndn")){
					options[OPT_NODUPLNET] = true;
					continue;
				}
				if(strstr(argv[i], "-ffc")){
					options[OPT_FF_INPUT_CMP] = true;
					continue;
				}
				if(strstr(argv[i], "-loc")){
					options[OPT_LOC] = true;
					if( i == argc-1 ) {
						cout << "Need post-mapping vhdl file for -loc option!!" << endl; //*
						exit(0);
					}
					post_map_vhd.append(argv[++i]);
					continue;
				}
				break;
			case 3:
				if(strstr(argv[i], "-di")){
					options[OPT_DUPLICATE_PI] = true;
					continue;
				}
				if(strstr(argv[i], "-da")){
					options[OPT_D_ADDERS] = true;
					continue;
				}
				if(strstr(argv[i], "-dm")){
					options[OPT_DUPLICATE_MUXES] = true;
					continue;
				}
				if(strstr(argv[i], "-ea")){
					options[OPT_E_AGGREG] = true;
					continue;
				}
				if(strstr(argv[i], "-cm")){
					options[OPT_CMUX] = true;
					continue;
				}
				if(strstr(argv[i], "-dm")){
					options[OPT_D_ADDERS] = true;
					continue;
				}
				if(strstr(argv[i], "-io")){
					options[OPT_MERGE_IO] = true;
					continue;
				}
				if(strstr(argv[i], "-nv")){
					options[OPT_NOVEC] = true;
					continue;
				}
				if(strstr(argv[i], "-nc")){
					options[OPT_NOCHECK] = true;
					continue;
				}
				if(strstr(argv[i], "-cc")){
					options[OPT_CCHAIN] = true;
					continue;
				}
				if(strstr(argv[i], "-dr")){
					options[OPT_2RAIL] = true;
					continue;
				}
				if(strstr(argv[i], "-sc")){
					options[OPT_SPLIT_CHECK] = true;
					continue;
				}
				if(strstr(argv[i], "-st")){
					options[OPT_STACK_CHECK] = true;
					continue;
				}
				if(strstr(argv[i], "-mc")){
					if(i == argc-1){
						cout << "Use -mc <num> to define maximum checker size" << endl;
						exit(0);
					}
					maxcheck = atoi(argv[++i]);
					continue;
				}
				if(strstr(argv[i], "-mg")){
					if(i == argc-1){
						cout << "Use -mc <num> to define maximum group size" << endl;
						exit(0);
					}
					maxgroup = atoi(argv[++i]);
					continue;
				}
				break;
			case 2:
				if(strstr(argv[i], "-a")){
					options[OPT_AGGRESSIVE] = true;
					continue;
				}
				if(strstr(argv[i], "-s")){
					options[OPT_RSPLIT] = true;
					continue;
				}
				if(strstr(argv[i], "-m")){
					maxcheck = 4;
					options[OPT_CCHAIN] = true;
					options[OPT_DWCF] = true;
					options[OPT_SPLIT_CHECK] = true;
					options[OPT_2RAIL] = true;
					options[OPT_D_ADDERS] = true;
					options[OPT_E_AGGREG] = true;
					continue;
				}
				break;
			default:
				break;
		}
		
		printf("Unknown option: %s\n", argv[i]);
		exit(0);
	}
	//always true...
	options[OPT_MMATCH] = true;
	
	if(options[OPT_DWCF])
		maxgroup = 1;
	
	if(options[OPT_FF_INPUT_CMP] && !options[OPT_DWCF]){
		cout << "FF Input comparison only available with -dwcf" << endl;
		exit(0);
	}
	
	if(options[OPT_FF_INPUT_CMP] && options[OPT_CCHAIN]){
		cout << "FF Input comparison not available with carry chain checking" << endl;
		exit(0);
	}
	
	if(options[OPT_FF_INPUT_CMP] && options[OPT_NO_CMP_MODULE]){
		cout << "FF Input comparison only available with comparison module" << endl;
		exit(0);
	}
	
	if(options[OPT_FF_INPUT_CMP] && !options[OPT_2RAIL]){
		cout << "FF Input comparison only available with dual rail comparison" << endl;
		exit(0);
	}
	
	if(maxgroup > LUT_K && !options[OPT_CCHAIN]){
		cout << "The group maximum size allowed for LUT-based checking is " << LUT_K << endl;
		exit(0);
	}
	
	if((maxgroup == 1 && !options[OPT_DWCF]) || (options[OPT_CCHAIN] && maxgroup >= maxcheck)){
		cout << "Invalid maximum group size" << endl;
		exit(0);
	}
	if(options[OPT_DWCF] && (options[OPT_DWSF] || options[OPT_DWCC]) ) {
		cout << "-dwcf -dwsf -dwcc not supported concurrently" << endl;
		exit(0);
	}
	if(options[OPT_DWSF] && (options[OPT_DWCF] || options[OPT_DWCC]) ) {
		cout << "-dwcf -dwsf -dwcc not supported concurrently" << endl;
		exit(0);
	}
	if(options[OPT_DWCC] && (options[OPT_DWSF] || options[OPT_DWCF]) ) {
		cout << "-dwcf -dwsf -dwcc not supported concurrently" << endl;
		exit(0);
	}
	if(options[OPT_AGGRESSIVE] && (options[OPT_DWCF] || options[OPT_DWCC])){
		cout << "Aggressive minimization not supported for DWC" << endl;
		exit(0);
	}
	if(options[OPT_AGGRESSIVE] && options[OPT_CCHAIN]){
		cout << "Aggressive minimization not supported with carry chain checking" << endl;
		exit(0);
	}
	if(options[OPT_CCHAIN] && options[OPT_DUPLICATE_MUXES]){
		cout << "-dm and -cc not supported concurrently" << endl;
		exit(0);
	}
	if(options[OPT_DUPLICATE_PI] && options[OPT_RSPLIT]){
		cout << "-di and -s not supported concurrently" << endl;
		exit(0);
	}
	
	char filename[512];
	bool changed_folder = false;

	memset(filename, '\0', sizeof(filename));

	for(i=0; argv[1][i] != 0 && argv[1][i] != '.'; i++){
		filename[i] = argv[1][i];
		if(!changed_folder && filename[i] == '/'){
			changed_folder = true;
			filename[++i] = 'o';
		}
	}

	strcat(filename, "_ft");

	if(options[OPT_E_AGGREG]) {
		strcat(filename, "_ea");
	}
	if(options[OPT_DWCF]){
		strcat(filename, "_df");
	}
	if(options[OPT_DWCC]){
		strcat(filename, "_dc");
	}
	if(options[OPT_DUPLICATE_PI]){
		strcat(filename, "_di");
	}
	if(options[OPT_DWSF]){
		strcat(filename, "_dsf");
	}
	if(options[OPT_ERROR_PO_SAMEW]){
		strcat(filename, "_ewps");
	}
	strcat(filename, ".vhd");

	Circuit circ;
	XSynthParser parser;
	XMapParser MapParser;
	XSynthOut writer;
	XDWCCOut dwccOut;
	
	parser.parse(argv[1], circ);

	if(options[OPT_DWCC]){
		dwccOut.printOutput(&circ, filename);
		if(options[OPT_LOC]) {
			Circuit circ_cpy0, circ_cpy1;
			MapParser.parseCpy0(argv[1], circ, post_map_vhd, circ_cpy0);
			XDWSFOut dwsfOut;
			dwsfOut.printDeltaLOC(circ, circ_cpy0, circ_cpy1);
		}
		exit(0);
	}
	
	ftXilinx ft(&circ);
	ft.maxCheckerSize = maxcheck;
	ft.maxGroupSize = maxgroup;

	if(options[OPT_DWSF]){
		Circuit circ_cpy0, circ_cpy1;
		MapParser.parse(argv[1], circ, post_map_vhd, circ_cpy0, circ_cpy1);
		ftSelectiveXilinx fts(6);
		fts.buildFtSelectiveCirc(circ, circ_cpy0, circ_cpy1);
		XDWSFOut dwsfOut;
		dwsfOut.printLOC(circ, circ_cpy0, circ_cpy1);
		dwsfOut.printDWSFSelectedLOC(fts, circ_cpy0, circ_cpy1);
		dwsfOut.printDWSF(fts, &circ);
		dwsfOut.printOutput(fts, &circ, filename);
		return 0;
	}

	if(options[OPT_DWCF]){
		ft.buildFtCirc();
	}

	writer.printOutput(&circ, &ft, filename);
}
