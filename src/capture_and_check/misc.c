/*
 * misc.c
 *
 *  Created on: Oct 2, 2012
 *      Author: lsantos
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "error_sig.h"

inline struct error_t *alloc_errors(int num)
{
struct error_t *e, *p, *k;
int i;

	e = malloc(sizeof(struct error_t));
	if( e == NULL )
		return NULL;
	//memset(e, '\0', sizeof(struct error_t));

	p = e;
	for(i = 1; i < num; i++ ) {
		k = malloc(sizeof(struct error_t));
		if( k == NULL )
			return e;
		memset(k, '\0', sizeof(struct error_t));
		p->next = k;
		p = k;
	}
	return e;
}

int free_errors(struct error_t *err)
{
struct error_t *e = err, *p;

	while(e != NULL) {
		p = e->next;
		free(e);
		e = p;
	}

	return 0;
}

int print_error(struct error_sig_t *err)
{
int i;
unsigned char result, first;

	if( err == NULL )
		return 0;

	result = err->result & 0x7F;
	first = err->result & 0x80;

	if( first != 0 )
	  printf("  [f]");
	else
	  printf("     ");

	if( result == 'O' || result == 'U' || result == 'X' || result == 'M' )
	  printf(" [result = %c]\t", result);
	else
	  printf(" [result = 0x%02x]\t", result&0xFF);

	printf(" [inj_faddr  = %02x %02x %02x] ", err->inj_faddr[0]&0xFF, err->inj_faddr[1]&0xFF, err->inj_faddr[2]&0xFF);
	printf(" [errorVecPO = ");
	for(i = 0; i < ERRORPOBITS; i++) {
		printf("%02x ", err->errorVecPO[i]&0xFF);
		if( i && (i%16) == 0 )
			printf("\n               ");
	}
	printf("] ");

	printf(" [errorVec = ");
	for(i = 0; i < ERRORBITS; i++) {
		printf("%02x ", err->errorVec[i]&0xFF);
		if( i && (i%16) == 0 )
			printf("\n               ");
	}
	printf("]\n");

	return 0;
}

int check_error(struct error_sig_t *err)
{
int i, k;
unsigned char result;

	if( err == NULL )
		return 0;

//	print_error(err);

	result = err->result & 0x7F;

	if( result != 'O' && result != 'U' && result != 'X' && result != 'M' )
		return -1;

	for(i = 0, k = 0; i < ERRORBITS; i++) {
		if( err->errorVec[i] != 0 )
			k = 1;
	}
	
	if( k == 0 && err->inj_faddr[0] == 0 && err->inj_faddr[1] == 0 && err->inj_faddr[3] == 0 )
		return -2;

	return 0;
}
