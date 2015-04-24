#!/bin/bash

# This script fragment emits Cygwin rulez under bash/cygwin
if [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ];then
    ISE_PATH="/cygdrive/c/Xilinx/13.2/ISE_DS/ISE/bin/nt64"
    XST=$ISE_PATH"/xst.exe"
    NGDBUILD=$ISE_PATH"/ngdbuild.exe"
    MAP=$ISE_PATH"/map.exe"
    PAR=$ISE_PATH"/par.exe"
    BITGEN=$ISE_PATH"/bitgen.exe"
else 
    ISE_PATH="/opt/Xilinx/13.4/ISE_DS/ISE/bin/lin64"
    XST=$ISE_PATH"/xst"
    NGDBUILD=$ISE_PATH"/ngdbuild"
    MAP=$ISE_PATH"/map"
    PAR=$ISE_PATH"/par"
    BITGEN=$ISE_PATH"/bitgen"
fi

#for i in benches/*
for i in benches/pdc
do
	nome=$(echo $i | sed 's/benches\///')
	echo $nome
	cd $i
	echo SYNTH
	$XST -ifn injector.xscr > $nome.synth.log
	if [ $? -ne 0 ]; then
	  exit $?
	fi
	echo TRANSLATE
	$NGDBUILD -nt timestamp -uc topo.ucf -p xc5vlx110t-ff1136-1 -sd ipcore_dir "netlist.ngc" $nome.ngd > $nome.translate.log
	echo MAP
	$MAP -p xc5vlx110t-ff1136-1 -w -logic_opt off -ol high -t 1 -register_duplication off -global_opt off -mt off -cm area -ir off -pr off -lc off -power off -o $nome.map.ncd $nome.ngd $nome.pcf > $nome.map.log
	echo PAR
	$PAR -w -ol high -mt off $nome.map.ncd $nome.ncd $nome.pcf > $nome.par.log
	echo BITGEN
	$BITGEN -f ../../../bitgen_config.ut $nome.ncd $nome.bit $nome.pcf > $nome.bit.log
	cd ../../
done
