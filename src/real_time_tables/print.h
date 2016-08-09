#ifndef _PRINT_H_INCLUDED_
#define _PRINT_H_INCLUDED_

#include "parse.h"
#include <set>
#include <map>

void printVhdl(char* circname, faddr2signsType faddr2signs, unsigned int best_static_out);
void print_header(FILE* vhdl);
void bStaticPrintVHDL(char* circname, map<int, unsigned int> &bestStatic);

#endif

