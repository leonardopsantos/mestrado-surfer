/*************************************************************************/
/*
 *  Circuit printing
 *  by Gabriel Luca Nazar <glnazar@inf.ufrgs.br>
 *
 */
/*************************************************************************/

#ifndef _INCLUDED_XSYNTHOUT_H_
#define _INCLUDED_XSYNTHOUT_H_

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <fstream>
#include <vector>
#include <map>
#include "circuit.h"
#include "ftXilinx.h"
#include "common.h"

using namespace std;

class XSynthOut {
	private:
		unsigned printedLUTs; //counts how many LUTs were already printed
		bool isVector(Net* netptr);
		void buildSignalVec(vector<Net*> &nets, unsigned *high, unsigned *low, char* buf, vector<bool> &printed, unsigned id);
		void printLUTs(vector<vector<set<unsigned> > > &selectedCliques_in, vector<Lut*> &lutVec_in, FILE* outfile);
		set<Component*> printedSharedCheckers;
	
		Circuit* circ;
		ftXilinx* ft;
	public:
		void printOutput(Circuit* circIn, ftXilinx* ftIn, const char* filename);
};

#endif
