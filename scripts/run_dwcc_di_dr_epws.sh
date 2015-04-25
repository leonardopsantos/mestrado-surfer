#!/bin/bash

TOPDIR=$(pwd)/..
SCRIPTS=$(pwd)
EXPERIMENTDIR=$TOPDIR/experiments/dwcc_di_dr_epws_dft2015
BENCHESDIR=$EXPERIMENTDIR/benches
NETGENDIR=$TOPDIR/netgen
UCFDIR=$TOPDIR/base_projects/ucf
UCFFILE=$UCFDIR/topo.ucf

# This script fragment emits Cygwin rulez under bash/cygwin
#if [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ];then
#else 
#fi

##./xilFT comb_benches_blif_apex2_synthesis.vhd -di -dr -dwcc -epws

if [ ! -x $BENCHESDIR ]; then
	mkdir -p $BENCHESDIR
fi

cp -af $NETGENDIR/* $EXPERIMENTDIR/benches

cp -af $TOPDIR/base_vhds $EXPERIMENTDIR/

cp -af $TOPDIR/base_projects/bitgen_config.ut $EXPERIMENTDIR/

for bench in $(ls $NETGENDIR)
do
	cp -af $TOPDIR/base_vhds/* $EXPERIMENTDIR/benches/$bench/
	cp -af $TOPDIR/base_projects/injector.xscr $EXPERIMENTDIR/benches/$bench/
	cp -af $TOPDIR/base_projects/base_impact_project/* $EXPERIMENTDIR/benches/$bench/
	cd $EXPERIMENTDIR/benches/$bench
	mv comparator-1w.vhd comparator.vhd
	rm -f comparator-3wd.vhd
	cp -af $UCFFILE .
	file=$(ls $NETGENDIR/$bench/*.vhd | rev | cut -d'/' -f 1 | rev)
	$TOPDIR/src/surfer/xilFT $file -di -dr -dwcc -epws
	mkdir ipcore_dir
	mv frame_mem.vhd ipcore_dir
	cd $TOPDIR
done

for script in buildPack.sh makeprj.sh change_faddr.sh distribute_vhds_with_names.sh make_impact_projs.sh; do
	cd $EXPERIMENTDIR
	$SCRIPTS/$script
done;
