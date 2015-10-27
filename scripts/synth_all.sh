#!/bin/bash

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

function get_threads() {
	threads=$(ps ax | grep synth_bench.sh | grep -v grep | wc -l)
}

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

BHS=($(ls benches/))

CPUS=1
if [ $# -eq 1 ] && [ $1 == "-mt" ]; then
	CPUS=$(lscpu  | grep "^CPU(s):" | awk '{ print $2 }')
fi

COUNT=0
while [ "x${BHS[COUNT]}" != "x" ]
do
   COUNT=$(( $COUNT + 1 ))
done

threads=0
bs=0

while [ $bs -lt $COUNT ]
do
	get_threads
	if [ $threads -lt $CPUS ]
	then
		$DIR/synth_bench.sh ${BHS[bs]} &
		let bs=bs+1;
	else
		sleep 1
	fi
done

for job in `jobs -p`
do
echo $job
    wait $job
done
