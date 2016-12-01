#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=36:00:00

cd $PBS_O_WORKDIR

./ethanol_run.x
