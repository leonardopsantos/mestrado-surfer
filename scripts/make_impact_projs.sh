#/bin/bash

for i in benches/*
do

	nome=$(echo $i | sed 's/benches\///')
	cd benches/$nome
	cat program.cmd | sed s/BITFILENAME/$nome.bit/ > program.cmd-2
	mv program.cmd-2 program.cmd
	cd ../..
done
