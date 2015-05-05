#ifndef _PRINT_H_INCLUDED_
#define _PRINT_H_INCLUDED_

#include "parse.h"

void printVhdl(char* circname, faddr2signsType faddr2signs, unsigned int best_static_out);
void print_header(FILE* vhdl);

#endif

