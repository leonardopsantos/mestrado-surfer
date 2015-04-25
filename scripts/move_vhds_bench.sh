for i in *.vhd
do
	j=$(echo $i | sed s/_ft_dc_di/""/)
	j=$(echo $j | sed s/.vhd/""/)
	j=$(echo $j | sed s/_synthesis/""/)
	j=$(echo $j | sed s/comb_benches_blif_/""/)
	echo $j
	#mkdir $j
	mv $i benches/$j
	#cp lalala/multiple_input_or.vhd benches/$j
done