#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=01:00:00

cd $PBS_O_WORKDIR


# Run all BAR analyses

./run_bar.py


