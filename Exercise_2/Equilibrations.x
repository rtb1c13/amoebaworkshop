#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=01:00:00

cd $PBS_O_WORKDIR


# Command for using Tinker minimize:
# minimize [xyz file] -k [key file] [gradient convergence criterion]

minimize ethanol_solv.xyz -k ethanol_solv_min.key 0.01 > ethanol_solv_min.out
mv ethanol_solv.xyz_2 ethanol_nvt.xyz

# Command for using Tinker dynamic:
# dynamic [xyz file] -k [key file] [steps] [timestep/fs] [snapshot interval/ps] [ensemble] [temperature/K] [pressure/atm]

dynamic ethanol_nvt.xyz -k ethanol_solv_nvt.key 10000 1.0 0.5 2 300 > ethanol_nvt.out
cp ethanol_nvt.dyn ethanol_npt.dyn
archive ethanol_nvt.arc < outputs/extract_frame20.txt && mv ethanol_nvt.020 ethanol_npt.xyz
dynamic ethanol_npt.xyz -k ethanol_solv_npt.key 10000 1.0 0.5 4 300 1.0 > ethanol_npt.out
archive ethanol_npt.arc < outputs/extract_frame20.txt && mv ethanol_npt.020 ethanol_npt_final.xyz


