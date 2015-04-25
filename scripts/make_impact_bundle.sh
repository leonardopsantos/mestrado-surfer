#!/bin/bash

if [ ! -x impact_bundle ]; then
	mkdir impact_bundle
fi

##for bench in $(ls benches/); do
for bench in alu4 pdc; do
	if [ ! -x impact_bundle/$bench ]; then
		mkdir impact_bundle/$bench
	fi

	cp -af benches/$bench/$bench.bit impact_bundle/$bench

	cp -af impact_projs/$bench/program.cmd impact_bundle/$bench
	cp -af impact_projs/$bench/project.ipf impact_bundle/$bench
done

	cp -af ../src/capture_and_check/capture impact_bundle
	cp -af program_and_capture.sh impact_bundle
