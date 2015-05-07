#!/bin/bash

if [ ! -x outputs/realTime_tables ]; then
	mkdir outputs/realTime_tables
fi

rm -f outputs/realTime_tables/fulltable.txt

for type in "zeroAccRT" "bestStaticAccRT" "perfectRT" "heuristcRT" "PmttrTableRT" "HmttrTableRT" 
do
	cp outputs/realTime/circNamesFile.txt outputs/realTime_tables/$type.table.txt
	for i in outputs/realTime/$type*
	do
		echo $i
		paste outputs/realTime_tables/$type.table.txt $i > temp
		mv temp outputs/realTime_tables/$type.table.txt
	done
	echo $type >> outputs/realTime_tables/fulltable.txt
	cat outputs/realTime_tables/$type.table.txt >> outputs/realTime_tables/fulltable.txt
done
