#ifndef _MISC_H_INCLUDED_
#define _MISC_H_INCLUDED_

#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>

typedef signed char int8_t;

const unsigned int maxMinPerMaj[65] = {53, 35, 35, 35, 35, 29, 35, 35, 35, 35, 35, 35,
				      35, 35, 35, 35, 29, 35, 35, 27, 35, 35, 35, 35,
				      35, 35, 35, 35, 53, 3,  35, 35, 35, 35, 35, 35,
				      35, 35, 35, 35, 35, 35, 29, 35, 35, 35, 35, 35,
				      35, 35, 35, 35, 35, 29, 35, 35, 35, 35, 53, 35,
				      35, 35, 35, 29, 31};

const unsigned int initColumnIdx[65] = {0, 54, 90, 126, 162, 198, 228, 264, 300, 336, 372,
					408, 444, 480, 516, 552, 588, 618, 654, 690, 718,
					754, 790, 826, 862, 898, 934, 970, 1006, 1060, 1064,
					1100, 1136, 1172, 1208, 1244, 1280, 1316, 1352, 1388,
					1424, 1460, 1496, 1526, 1562, 1598, 1634, 1670, 1706,
					1742, 1778, 1814, 1850, 1886, 1916, 1952, 1988, 2024,
					2060, 2114, 2150, 2186, 2222, 2258, 2288};

unsigned int faddr2Idx(int8_t *faddr, unsigned int *valid);
unsigned int faddr2Idx(unsigned int full_faddr);
unsigned int idx2Faddr(unsigned int idx);
unsigned int getMajor(unsigned int idx);

#endif
