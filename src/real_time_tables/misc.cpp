
#include "misc.h"

unsigned int faddr2Idx(int8_t *faddr, unsigned int *valid){
	unsigned int retVal = 0;
	unsigned int full_faddr, maj, min, msbs;
	unsigned int i;
	
	full_faddr = ((unsigned char) faddr[0] << 16) | ((unsigned char) faddr[1] << 8) | ((unsigned char) faddr[2]);
	
	maj = (full_faddr & 0x007F80) >> 7;
	min = full_faddr & 0x00007F;
	msbs = full_faddr & 0xFFFF8000;
	
	if(min > maxMinPerMaj[maj] || msbs != 0x18000) {
		printf("Invalid faddr: 0x%X\n", full_faddr);
		fprintf(stderr, "Invalid faddr: 0x%X\n", full_faddr);
	} else {
		*valid = 1;
	}
	
	for(i=0; i<maj; i++)
		retVal += maxMinPerMaj[i] + 1;
		
	retVal += min;
	
	return retVal;
}

unsigned int faddr2Idx(unsigned int full_faddr){
	unsigned int retVal = 0;
	unsigned int maj, min;
	unsigned int i;
	
	maj = (full_faddr & 0x007F80) >> 7;
	min = full_faddr & 0x00007F;
	
	if(min > maxMinPerMaj[maj]){
		printf("Invalid faddr: 0x%X\n", full_faddr);
	}
	
	for(i=0; i<maj; i++)
		retVal += maxMinPerMaj[i] + 1;
		
	retVal += min;
	
	return retVal;
}

unsigned int idx2Faddr(unsigned int idx){
	unsigned int maj;
	
	maj = 0;
	while(idx > maxMinPerMaj[maj]){
		idx -= maxMinPerMaj[maj] + 1;
		maj++;
	}
	
	return 0x18000 | (maj << 7) | idx;
}

unsigned int getMajor(unsigned int idx){
	unsigned int maj;
	
	maj = 0;
	while(idx > maxMinPerMaj[maj]){
		idx -= maxMinPerMaj[maj] + 1;
		maj++;
	}
	
	return maj;
}
