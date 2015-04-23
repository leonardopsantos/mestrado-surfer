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

#include "error_sig.h"

int main ( int argc, char *argv[] )
{
struct file_header_t outf_header;
struct error_sig_t *error;
FILE *fp;
int i, sz, discarded, k, total_errors;
unsigned char *buff, *p;

	if( argc > 1 ) {
	  fp = fopen(argv[1], "r");
	} else {
	  fp = fopen("error.bin", "r");
	}
	if( fp == NULL ) {
		printf("Error opening %s for reading!\n", "error.bin");
		return -1;
	}

#if 1
	i = fread(&outf_header, 1, sizeof(outf_header), fp);
	if( i != sizeof(outf_header) ) {
		printf("OOps, could not read the file header\n");
		goto ex_it;
	}
#endif
	i = ftell(fp);
	fseek(fp, 0L, SEEK_END);
	sz = ftell(fp)-i;
	fseek(fp, i, SEEK_SET);

	total_errors = sz/sizeof(struct error_sig_t);

	printf("Found %d bytes, %f errors\n", sz, ((float)sz/sizeof(struct error_sig_t)));
	if( (sz%sizeof(struct error_sig_t)) != 0 ) {
		printf("OOps, file size is NOT a interger number of errors!\n");
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

	discarded = 0;

	error = (struct error_sig_t*) buff;
	while ( error - ((struct error_sig_t*) buff) < total_errors) {

#if 0
			p = (unsigned char *) error;
			printf("      ");
			for( i = 0; i < sizeof(struct error_sig_t); i++, p++ ) {
				printf(" %02x", *p);
			}
			printf("\n");
#endif

		k = check_error(error);
		if( k != 0 ){
//			printf("OOps, bad error signature! (%d)\n", k);
//			print_error(error);
//			goto ex_it;

//			error -= 2;
			p = (unsigned char *) error;

			i = 0;
			while( check_error( ((struct error_sig_t*)p) ) != 0 && 1 < 1000000 ) {
				p++;
				i++;
			}

			if( i == 1000000 ) {
				printf("OMFG!! Can't align signatures!!!!\n");
				goto ex_it;
			}

			discarded += (((struct error_sig_t*)p) - error);

			error = (struct error_sig_t*)p;
		} else
		  error++;
	};

ex_it:
	fclose(fp);
	return 0;
}
