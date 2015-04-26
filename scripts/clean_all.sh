#!/bin/bash

for e in ngc ngd ncd xpi xml lst twr twx log bgn bit drc ngm xwbt bld map.* xrpt; do
	find -iname "*.$e" | grep -v "ipcore_dir" | xargs rm -f
done

for e in xst bld map.map map.* pad par srp pcf ptwx unroutes ngc_xst.* txt csv lso xrpt xlnx_* *_vhdl.prj xln_* _ngdbuild* *_xmsgs; do
	find -iname "*$e" | grep -v "ipcore_dir" | xargs rm -fr
done
