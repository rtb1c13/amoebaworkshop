#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=00:30:00

cd $PBS_O_WORKDIR


# Command for using Tinker dynamic:
# dynamic [xyz file] -k [key file] [steps] [timestep/fs] [snapshot interval/ps] [ensemble] [temperature/K] [pressure/atm]

dynamic AAA_eq_nvt.xyz -k AAA_eq_nvt.key 5000 1.0 0.5 2 300 > AAA_eq_nvt.out

