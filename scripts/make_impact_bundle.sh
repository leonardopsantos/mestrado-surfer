#!/bin/bash

SCRIPTS=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
IMPACT=$SCRIPTS/../base_projects/base_impact_project
BUNDLE=`date +%Y%m%d`-impact_bundle

if [ ! -x $BUNDLE ]; then
	mkdir $BUNDLE
fi

BNCHS=$(find benches -iname "*.bit" | cut -d'/' -f 2)

for bench in $BNCHS; do
	if [ ! -x $BUNDLE/$bench ]; then
		mkdir $BUNDLE/$bench
	fi

	cp -af benches/$bench/$bench.bit $BUNDLE/$bench

	
	cat $IMPACT/program.cmd | sed s/BITFILENAME/$bench.bit/ > $BUNDLE/$bench/program.cmd
	cp -af $IMPACT/project.ipf $BUNDLE/$bench/
done

cp -af $SCRIPTS/../src/capture_and_check/capture $BUNDLE
cp -af $SCRIPTS/program_and_capture.sh $BUNDLE
tar -cvvjf $BUNDLE.tar.bz2 $BUNDLE 
