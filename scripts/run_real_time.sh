RTTABLE=/home/lsantos/work/pep/scripts_cygwin_xilinx/signFaultInjector/src/real_time_tables/rtTable

	for xx in outputs exec_logs; do
		if [ ! -x $xx ]; then
			mkdir $xx
		fi
		if [ ! -x $xx/realTime ]; then
			mkdir $xx/realTime
		fi
	done

	for circname in alu4 alu_cell alu_cell_64b apex2 apex4 des ex1010 ex5p misex3 pdc seq spla
	do
		sigfile=$(ls train/*$circname.sig0)
		echo $circname
		int_bits=$(cat sizes_table | grep "$circname int" | sed s/"$circname int"//)
		po_bits=$(cat sizes_table | grep "$circname po" | sed s/"$circname po"//)
		echo SIG ANALYZER
		#$RTTABLE $sigfile $int_bits $po_bits 1 -t -d 7 | tee exec_logs/realTime/$circname.log
		$RTTABLE $sigfile $int_bits $po_bits 1 -t -d 9 | tee exec_logs/realTime/$circname.log
		mv *.tab outputs/realTime
		mv *.vhd outputs/realTime
	done

	mv *.txt outputs/realTime
