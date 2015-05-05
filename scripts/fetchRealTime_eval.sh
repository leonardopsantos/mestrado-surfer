
if [ ! -x evaluatorRT/realTime/tables ]; then
	mkdir evaluatorRT/realTime/tables
fi

rm -f evaluatorRT/realTime/tables/*.txt

for type in "evalRT_coverage_0" "evalRT_MTTRTable_coverage_"
do
	cp outputs/realTime/circNamesFile.txt evaluatorRT/realTime/tables/$type.table.txt
	
	#rm evaluatorRT/tables/$type.table.txt
	#touch evaluatorRT/tables/$type.table.txt
	for i in evaluatorRT/realTime/$type*
	do
		echo $i
		paste evaluatorRT/realTime/tables/$type.table.txt $i > temp
		cat temp
		mv temp evaluatorRT/realTime/tables/$type.table.txt
	done
	echo $type >> evaluatorRT/realTime/tables/fulltable_eval.txt
	cat evaluatorRT/realTime/tables/$type.table.txt >> evaluatorRT/realTime/tables/fulltable_eval.txt
done

