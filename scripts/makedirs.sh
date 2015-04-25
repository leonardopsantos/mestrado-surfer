for i in *.vhd
do

	j=$(echo $i | sed s/_ft_ea_df_di.vhd/""/)
	j=$(echo $j | sed s/_synthesis/""/)
	j=$(echo $j | sed s/comb_benches_blif_/""/)
	echo $j
	mkdir benches/$j
	#cp lalala/multiple_input_or.vhd benches/$j
done