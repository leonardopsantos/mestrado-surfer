
COUNT=/home/lsantos/work/pep/scripts_cygwin_xilinx/signFaultInjector/src/capture_and_check/count_sens_bits

rm -f count.log

for i in apex4 ex5p apex2 alu_cell_64b seq misex3 alu_cell spla ex1010 alu4 pdc des
do
#	circname=$(echo $i | sed s/.txt/""/ | sed s:dwcf_nri_di_signs/full/:"":)
	circname=$i
	file=$(ls *$circname.sig)
	if [ -z "$file" ]; then
		continue
	fi
	int_bits=$(cat sizes_table | grep "$circname int" | sed s/"$circname int"//)
	po_bits=$(cat sizes_table | grep "$circname po" | sed s/"$circname po"//)
	$COUNT $file $int_bits $po_bits | tee -a count.log
done
