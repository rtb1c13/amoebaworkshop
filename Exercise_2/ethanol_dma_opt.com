%RWF=/tmp/,10GB
%Nosave
%Chk=ethanol_dma_opt.chk
%Mem=8000MB
%Nproc=8
#opt=(maxcycle=400) MP2/6-311G(1d,1p) Density=MP2 MaxDisk=10GB Geom=AllCheck

Ethanol second optimisation 

0  1


