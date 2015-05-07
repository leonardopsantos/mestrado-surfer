#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>
#include <termios.h>
#include <string.h>
#include <time.h>
#include <errno.h>
#include <stdint.h>
#include <sys/select.h>
#include <math.h>

int int_size = -1, po_size = -1;

int total_sens_bits;

int v_error( unsigned char *p )
{
int i, j, k;
uint8_t result, *inj_faddr, *errorVecPO, *errorVec;

	result = p[0] & 0x7F;

	inj_faddr = p+1;

	if( result != 'O' && result != 'U' && result != 'X' && result != 'M' )
		return -1;

	errorVecPO = inj_faddr + 3;

	errorVec = inj_faddr + po_size;

	for(i = 0, k = 0; i < int_size; i++) {
		if( errorVec[i] != 0 )
		k = 1;
	}
	for(i = 0, j = 0; i < po_size; i++) {
		if( errorVecPO[i] != 0 )
		j = 1;
	}

	if( k == 0 && j == 0 && inj_faddr[0] == 0 && inj_faddr[1] == 0 && inj_faddr[3] == 0 )
		return -2;

	if( (p[0] & 0x80) != 0 )
		total_sens_bits++;

	return 0;
}

int main ( int argc, char *argv[] )
{
FILE *fp = NULL;
unsigned char *buff, *p;
int i, sz, sig_size, count, total_errors;

	if( argc != 4) {
		printf("Counts the number of sensitive bits in a signature file. USed to calculate FIT\n");
		printf("%s <signature_file> <int_size> <po_size>\n", argv[0]);
		return -1;
	}

	total_sens_bits = 0;

	buff = NULL;

	fp = fopen(argv[1], "r");
	if( fp == NULL ) {
		printf("Error opening %s for reading!\n", argv[1]);
		return -1;
	}

	int_size = atoi(argv[2]);
	po_size = atoi(argv[3]);

	if( int_size <= 0 || po_size <= 0 ) {
		printf("Error in size values\n");
		goto ex_it;
	}

	int_size = ceil(((float) int_size)/8);
	po_size = ceil(((float) po_size)/8);
	sig_size = int_size + po_size + 4;

	i = ftell(fp);
	fseek(fp, 0L, SEEK_END);
	sz = ftell(fp)-i;
	fseek(fp, i, SEEK_SET);

	total_errors = sz/sig_size;

	if( (sz%sig_size) != 0 ) {
		printf("ERROR\n");
		goto ex_it;
	}

	buff = malloc(sz);
	if( buff == NULL ) {
		printf("Error on malloc\n");
		goto ex_it;
	}

	i = fread(buff, 1, sz, fp);
	if( i != sz ) {
		printf("Error reading %s\n", argv[1]);
		goto ex_it;
	}

	count = 0;
	p = buff;

	while ( count < total_errors) {
		i = v_error(p);
		if( i != 0 ) {
			printf("ERROR\n");
			goto ex_it;
		}

		p += sig_size;
		count++;
	};

	printf("Sensitive bits for %s : %d\n", argv[1], total_sens_bits);

ex_it:
	if( buff != NULL )
		free(buff);

	if( fp != NULL )
		fclose(fp);
	return 0;
}
