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
//struct file_header_t outf_header;
struct error_sig_t *error, *last_ok;
FILE *fp;
int i, sz, count, k, total_errors;
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

#if 0
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

	printf("File %d bytes, %d signatures\n", sz, total_errors);
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

	count = 0;
	last_ok = NULL;

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
			printf("OOps, bad error signature! (%d)\n", count);
			if( last_ok != NULL )
				print_error(last_ok);
			print_error(error);
			return -1;
		}
		last_ok = error;
		error++;
		count++;
	};

ex_it:
	fclose(fp);
	return 0;
}
