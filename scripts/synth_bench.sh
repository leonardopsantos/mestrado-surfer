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
    #ISE_PATH="/opt/Xilinx/13.4/ISE_DS/ISE/bin/lin64"
    ISE_PATH="/opt/Xilinx/13.4/ISE_DS/ISE/bin/lin"
    XST=$ISE_PATH"/xst"
    NGDBUILD=$ISE_PATH"/ngdbuild"
    MAP=$ISE_PATH"/map"
    PAR=$ISE_PATH"/par"
    BITGEN=$ISE_PATH"/bitgen"
fi

if [ $# -ne 1 ]; then
	echo "Need argument!!!"
	exit -1;
elif [ ! -x benches/$1 ]; then
	echo "Can't find benchmark $1!!!"
	exit -1;
fi

HOMEDIR=$(pwd)

nome=$(echo $1 | sed 's/benches\///')
cd benches/$1
echo -e "$nome:\tSYNTH"
$XST -ifn injector.xscr > $nome.synth.log
if [ $? -ne 0 ]; then
	cat $nome.synth.log
	exit
fi

echo -e "$nome:\tTRANSLATE"
$NGDBUILD -nt timestamp -uc topo.ucf -p xc5vlx110t-ff1136-1 -sd ipcore_dir "netlist.ngc" $nome.ngd > $nome.translate.log
if [ $? -ne 0 ]; then
	cat $nome.translate.log
	exit
fi

echo -e "$nome:\tMAP"
$MAP -p xc5vlx110t-ff1136-1 -w -logic_opt off -ol high -t 1 -register_duplication off -global_opt off -mt off -cm area -ir off -pr off -lc off -power off -o $nome.map.ncd $nome.ngd $nome.pcf > $nome.map.log
if [ $? -ne 0 ]; then
	cat $nome.map.log
	exit
fi

echo -e "$nome:\tPAR"
$PAR -w -ol high -mt off $nome.map.ncd $nome.ncd $nome.pcf > $nome.par.log
if [ $? -ne 0 ]; then
	cat $nome.par.log
	exit
fi

echo -e "$nome:\tBITGEN"
$BITGEN -f ../../bitgen_config.ut $nome.ncd $nome.bit $nome.pcf > $nome.bit.log
if [ $? -ne 0 ]; then
	cat $nome.bit.log
	exit
fi

cd $HOMEDIR
