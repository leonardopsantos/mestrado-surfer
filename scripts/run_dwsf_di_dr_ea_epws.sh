#!/bin/bash

SCRIPTNAME=$(basename "$0")
SCRIPTNAME="${SCRIPTNAME%.*}"
SCRIPTNAME="${SCRIPTNAME/run_/}"

SCRIPTS=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
TOPDIR=$SCRIPTS/..
EXPERIMENTDIR=$TOPDIR/experiments/$SCRIPTNAME
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
	cp -af $EXPERIMENTDIR/base_vhds/* $EXPERIMENTDIR/benches/$bench/
	cp -af $TOPDIR/base_projects/injector.xscr $EXPERIMENTDIR/benches/$bench/
	cp -af $TOPDIR/base_projects/base_impact_project/* $EXPERIMENTDIR/benches/$bench/
	cd $EXPERIMENTDIR/benches/$bench
	cp -af $UCFFILE .
	file=$(ls $NETGENDIR/$bench/*.vhd | rev | cut -d'/' -f 1 | rev)
	pmap_file=$(ls $BENCHESDIR/../netgen/$bench)
	$TOPDIR/src/surfer/xilFT $file -di -dr -dwsf $BENCHESDIR/../netgen/$bench/$pmap_file -epws -ea
	echo -e "\n" >> topo.ucf
	cat loc.ucf >> topo.ucf
	mkdir ipcore_dir
	mv frame_mem.vhd ipcore_dir
	rm -f comparator-1w.vhd comparator-3wd.vhd
	cd $TOPDIR
done

for script in buildPack.sh makeprj.sh change_faddr.sh distribute_vhds_with_names.sh make_impact_projs.sh; do
	cd $EXPERIMENTDIR
	$SCRIPTS/$script
done;
