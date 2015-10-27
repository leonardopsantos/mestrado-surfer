base_folder=("evaluatorRT")

if [ ! -x $base_folder/tables ]; then
	mkdir $base_folder/tables
fi

rm -f $base_folder/tables/*.txt

for type in "evalRT_coverage_0" "evalRT_MTTRTable_coverage_"
do
	for occup in "0.75" "0.5" "0.25"
	do
		cp $base_folder/$occup/circNamesFile.txt $base_folder/tables/$type.table.txt
		#rm $base_folder/tables/$type.table.txt
		#touch $base_folder/tables/$type.table.txt
		for i in $base_folder/$occup/$type*
		do
			echo $i
			paste $base_folder/tables/$type.table.txt $i > temp
			mv temp $base_folder/tables/$type.table.txt
		done
		echo $occup $type >> $base_folder/tables/fulltable_eval.txt
		cat $base_folder/tables/$type.table.txt >> $base_folder/tables/fulltable_eval.txt
	done
done

