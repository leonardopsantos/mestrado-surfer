#!/bin/bash

SCRIPTS=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
IMPACT=$SCRIPTS/../base_projects/base_impact_project

if [ ! -x impact_bundle ]; then
	mkdir impact_bundle
fi

BNCHS=$(find benches -iname "*.bit" | cut -d'/' -f 2)

for bench in $BNCHS; do
	if [ ! -x impact_bundle/$bench ]; then
		mkdir impact_bundle/$bench
	fi

	cp -af benches/$bench/$bench.bit impact_bundle/$bench

	
	cat $IMPACT/program.cmd | sed s/BITFILENAME/$bench.bit/ > impact_bundle/$bench/program.cmd
	cp -af $IMPACT/project.ipf impact_bundle/$bench/
done

	cp -af $SCRIPTS/../src/capture_and_check/capture impact_bundle
	cp -af $SCRIPTS/program_and_capture.sh impact_bundle
	