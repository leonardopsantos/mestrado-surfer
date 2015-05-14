for folder in benches/*
do
	for i in $(ls $folder/*.vhd | grep "\_ft\_")
	do
		name=$(cat $i | grep entity | cut -d' ' -f 2 | sed s/_ft/""/ | sed s/_ea/""/)
		ft_name=$(cat $i | grep entity | cut -d' ' -f 2)
#		name=$(echo $i | sed s/"benches\/"/""/)
#		name=$(echo $name | sed s/_ft_df_di.vhd/""/)
#		name=$(echo $name | sed s/".*\/"/""/)
#		name=$(echo $name | sed s/_synthesis/""/)

		echo $i
		echo name = $name
		echo folder = $folder

		cat base_vhds/fault_inj_top.vhd | sed s/BENCH_NAME/$ft_name/ > $folder/fault_inj_top.vhd
		cat base_vhds/in_out_ctrl.vhd | sed s/BENCH_NAME/$name/ > $folder/in_out_ctrl.vhd
	done
done
