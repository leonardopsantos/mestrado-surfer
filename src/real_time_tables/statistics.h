#ifndef _STATISTICS_H_INCLUDED_
#define _STATISTICS_H_INCLUDED_

#include "parse.h"
#include <set>

void buildInterbitRelations(faddr2signsType &faddr2signs, tableType &signatureTable, vector<vector<unsigned int> > &relations);
void buildIntergroupRelations(list<set<unsigned int> > &groupedBits, faddr2signsType &faddr2signs, tableType &signatureTable, vector<vector<unsigned int> > &relations);
void buildIntergroupFaddrRelations(list<set<unsigned int> > &groupedBits, faddr2signsType &faddr2signs, tableType &signatureTable, vector<vector<unsigned int> > &relations);
void calculateIncidences(faddr2signsType &faddr2signs, tableType &signatureTable);

#endif
