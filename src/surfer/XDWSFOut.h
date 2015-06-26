

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
#include "ftXilinx.h"
#include "common.h"

using namespace std;

class XDWSFOut {
	public:
		void buildLogicCones(Circuit& circIn);

	private:
		void buildNetLogicConePOs(Net* po, Net* net, int depth);
};

#endif // _INCLUDED_XDWSFOUT_H_


