%RWF=/tmp/,10GB
%Nosave
%Chk=ethanol_esp.chk
%Mem=8000MB
%Nproc=8
#Sp MP2/aug-cc-pvtz Density=MP2 MaxDisk=10GB Geom=AllCheck

Ethanol MEP calculation 

0  1


