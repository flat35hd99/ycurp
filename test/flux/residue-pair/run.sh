#! /bin/bash -e

mkdir -p outdata
rm -f outdata/*.dat*

# calculate energy flux
time  curp compute  erun.cfg > log

# calculate heat flux
time curp compute hrun.cfg > log

# postprocess
time  curp analyze divide-flux \
    -o outdata/eflux.dat.gz -t 1.0 \
    outdata/eflux_grp.dat00000  \
    > outdata/ana.log
