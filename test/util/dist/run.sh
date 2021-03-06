#! /bin/bash -e

example_path=../../examples/amber-enk-vacuum
prmtop_fp=$example_path/system.prmtop.gz

rm -rf outdata
mkdir -p outdata

curp conv-trj -crd \
    -p $prmtop_fp  -pf amber \
    -i $example_path/sam.nccrd -if netcdf  --irange 1 -1 1 \
    -o outdata/sam.nccrd       -of netcdf  --orange 1 -1 1 \
    dist -m nearest -c 20.0 > outdata/dist.dat
