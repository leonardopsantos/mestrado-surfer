
rm -f split.log

for i in alu4 alu_cell alu_cell_64b apex2 apex4 des ex1010 ex5p misex3 pdc seq spla
do
#	circname=$(echo $i | sed s/.txt/""/ | sed s:dwcf_nri_di_signs/full/:"":)
	circname=$i
	file=$(ls *$circname.sig)
	if [ -z "$file" ]; then
		continue
	fi
	int_bits=$(cat sizes_table | grep "$circname int" | sed s/"$circname int"//)
	po_bits=$(cat sizes_table | grep "$circname po" | sed s/"$circname po"//)
	echo $circname $int_bits $po_bits 
	echo $circname $int_bits $po_bits >> split.log
	./splitter $file $int_bits $po_bits 15 >> split.log
done

	if [ ! -x train ]; then
		mkdir train
	fi
	if [ ! -x test ]; then
		mkdir test
	fi

mv *.sig0 train
mv *.sig1 test
