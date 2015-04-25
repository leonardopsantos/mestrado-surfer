for i in benches/*
do
	cd $i
	cat injector_pack.vhd | sed s/01A01F/019CA3/ > injector_pack2.vhd
	mv injector_pack2.vhd injector_pack.vhd
	cd ../../
done