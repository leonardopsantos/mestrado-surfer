#ifndef _DUMB_H_INCLUDED_
#define _DUMB_H_INCLUDED_

#include "parse.h"
#include "statistics.h"
#include "buildTable.h"
#include "print.h"
#include <lemon/smart_graph.h>
#include <lemon/matching.h>
#include <set>
#include <string>

using namespace lemon;

void buildDumb(char* circname, tableType &signatureTable, faddr2signsType &faddr2signs, faddr2signsType &compF2SCollisionFree,
		unsigned int best_static_out, unsigned int scaled_deadline, unsigned int deadline, list<set<unsigned int> > &groupedBits);
bool dumbOrGrouping(set<unsigned> group, vector<bool> signature);
extern unsigned dumbMaxSigSize;

#endif

