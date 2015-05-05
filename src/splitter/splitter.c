#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char* argv[]){
	FILE *in, *out0, *out1;
	int sigs0, sigSize, readBytes, i, namePos = 0;
	int cnt0 = 0, cnt1 = 0;
	unsigned char* signature;
	unsigned char outName[64];
	unsigned char skip;
	
	if(argc < 5){
		printf("Use %s infile size_int size_po sigs_in_0\n", argv[0]);
		exit(0);
	}
	
	in = fopen(argv[1], "r");
	
	if(in == NULL){
		printf("Unable to open %s\n", argv[1]);
		exit(0);
	}
	
	for(i=0; argv[1][i] != 0; i++)
		if(argv[1][i] == '/')
			namePos = i+1;
			
	for(i=namePos; argv[1][i] != 0; i++)
		outName[i-namePos] = argv[1][i];
	
	outName[i-namePos] = '0';
	outName[i-namePos + 1] = 0;
	out0 = fopen(outName, "w");
	outName[i-namePos] = '1';	
	out1 = fopen(outName, "w");
	
	sigSize = 4 + ceil((double) atoi(argv[2]) / 8.0) + ceil((double) atoi(argv[3]) / 8.0);
	sigs0 = atoi(argv[4]);
	
	printf("size: %d\n", sigSize);
	
	signature = (unsigned char*) malloc(sigSize * sizeof(unsigned char));
	
	readBytes = fread(signature, sizeof(unsigned char), sigSize, in);
	while(readBytes == sizeof(unsigned char)*sigSize) {
		skip = 0;
		for(i=0; i<sigs0; i++){
			if(readBytes != sizeof(unsigned char)*sigSize) {
				skip = 1;
				break;
			}
				
			if((signature[0] & 0x80) && i != 0){ //early new injected bit
				skip = 1;
				break;
			}
			cnt0++;
			fwrite(signature, sizeof(unsigned char), sigSize, out0);
			readBytes = fread(signature, sizeof(unsigned char), sigSize, in);
		}
		
		if(!skip){
			while((signature[0] & 0x80) == 0 && readBytes == sizeof(unsigned char)*sigSize){
				fwrite(signature, sizeof(unsigned char), sigSize, out1);
				cnt1++;
				readBytes = fread(signature, sizeof(unsigned char), sigSize, in);
			}
		}
	}
	printf("cnt0: %d - cnt1: %d - ratio: %f\n", cnt0, cnt1, (double) cnt0 / (double)(cnt0 + cnt1));
	free(signature);
	fclose(in);
	fclose(out0);
	fclose(out1);
	return 0;	
}
