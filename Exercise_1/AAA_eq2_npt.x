#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=00:30:00

cd $PBS_O_WORKDIR


# Command for using Tinker dynamic:
# dynamic [xyz file] -k [key file] [steps] [timestep/fs] [snapshot interval/ps] [ensemble] [temperature/K] [pressure/atm]

dynamic AAA_eq2_npt.xyz -k AAA_eq2_npt.key 5000 1.0 0.5 4 300 1.0 > AAA_eq2_npt.out

