

#ifndef _INCLUDED_XDWSFOUT_H_
#define _INCLUDED_XDWSFOUT_H_

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <fstream>
#include <vector>
#include <list>
#include <map>

#include "circuit.h"
#include "ftSelectiveXilinx.h"
#include "common.h"

using namespace std;

class XDWSFOut {
	public:
		void buildLogicCones(Circuit& circIn);
		void printOutput(ftSelectiveXilinx &ft, Circuit* circIn, const char* filename);

	private:
		void buildNetLogicConePOs(Net* po, Net* net, int depth);
		void printDWSF(ftSelectiveXilinx &ft, Circuit* circIn);
};

#endif // _INCLUDED_XDWSFOUT_H_


