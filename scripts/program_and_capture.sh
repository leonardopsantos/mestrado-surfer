#!/bin/bash

HPWD=$(pwd)

# This script fragment emits Cygwin rulez under bash/cygwin
if [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ];then
    ISE_PATH="/cygdrive/c/Xilinx/13.2/ISE_DS/ISE/bin/nt64"
    IMPACT=$ISE_PATH"/impact.exe"
else 
    ISE_PATH="/opt/Xilinx/13.4/ISE_DS/ISE/bin/lin64"
	IMPACT=$ISE_PATH"/impact"
fi

##for bench in $(ls benches/); do
for bench in alu4 pdc; do
	cd $HPWD/$bench
	$IMPACT -batch program.cmd

	if [ $? -eq 0 ]; then
		../capture `date +%Y%m%d-%H%M`-$bench.sig
	fi
done
