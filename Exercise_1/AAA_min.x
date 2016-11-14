#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=00:10:00

cd $PBS_O_WORKDIR


# Command for using Tinker minimize:
# minimize [xyz file] -k [key file] [gradient convergence criterion]

minimize AAA_min.xyz -k AAA_min.key 0.01 > AAA_min.out

