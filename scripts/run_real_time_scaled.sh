RTTABLE=/home/lsantos/work/pep/scripts_cygwin_xilinx/signFaultInjector/src/real_time_tables/rtTable

for occup in "0.75" "0.5" "0.25"
do

	for xx in outputs exec_logs; do
		if [ ! -x $xx ]; then
			mkdir $xx
		fi
		if [ ! -x $xx/realTimeScaled ]; then
			mkdir $xx/realTimeScaled
		fi
		if [ ! -x $xx/realTimeScaled/$occup ]; then
			mkdir $xx/realTimeScaled/$occup
		fi
	done

	for circname in alu4 alu_cell alu_cell_64b apex2 apex4 des ex1010 ex5p misex3 pdc seq spla
	do
		sigfile=$(ls train/*$circname.sig0)
		echo $circname
		int_bits=$(cat sizes_table | grep "$circname int" | sed s/"$circname int"//)
		po_bits=$(cat sizes_table | grep "$circname po" | sed s/"$circname po"//)
		delay1_cg=$(cat delay_table | grep "$circname cg" | sed s/"$circname cg"//)
		delay2_fg=$(cat delay_table | grep "$circname fg" | sed s/"$circname fg"//)

		echo SIG ANALYZER
		#$RTTABLE $sigfile $int_bits $po_bits 1 -t -d 7 -s $delay1_cg $delay2_fg $occup | tee exec_logs/realTimeScaled/$occup/$circname.log
		$RTTABLE $sigfile $int_bits $po_bits 1 -t -d 9 -s $delay1_cg $delay2_fg $occup | tee exec_logs/realTimeScaled/$occup/$circname.log
		mv *.tab outputs/realTimeScaled/$occup
		mv *.vhd outputs/realTimeScaled/$occup
	done
	
	mv *.txt outputs/realTimeScaled/$occup
done
