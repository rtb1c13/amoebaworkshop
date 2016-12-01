#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=2:00:00

cd $PBS_O_WORKDIR

./ethanol_run.x
