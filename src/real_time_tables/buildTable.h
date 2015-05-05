#ifndef _BUILDTABLE_H_INCLUDED_
#define _BUILDTABLE_H_INCLUDED_

#include "parse.h"
#include "dumb.h" //for the dumbOrGrouping function

#define FRAME_CYCLES 41 //cycles required to write a frame
#define CMD_CYCLES 25 //cycles required for a write command

void buildTable(tableType &signatureTable, faddr2signsType &faddr2signs, unsigned int *best_static_out);
void buildTableRT(tableType &signatureTable, faddr2signsType &faddr2signs, unsigned int *best_static_out, unsigned int scaled_deadline, unsigned int deadline, bool first_run);
void evalMTTR4RT(tableType &signatureTable, faddr2signsType &faddr2signs, faddr2signsType &compF2S, unsigned int scaled_deadline, unsigned int deadline, list<set<unsigned int> > &groupedBits);

#endif
