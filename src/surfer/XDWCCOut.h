/*************************************************************************/
/*
 *  Circuit printing
 *  by Gabriel Luca Nazar <glnazar@inf.ufrgs.br>
 *
 */
/*************************************************************************/

#ifndef _INCLUDED_XDWCCOUT_H_
#define _INCLUDED_XDWCCOUT_H_

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

class XDWCCOut {
	private:
		bool isVector(Net* netptr);
		void buildSignalVec(vector<Net*> &nets, unsigned *high, unsigned *low, char* buf, vector<bool> &printed, unsigned id);
		
	public:
		void printOutput(Circuit* circIn, const char* filename);
};

#endif
