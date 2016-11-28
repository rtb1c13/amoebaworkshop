#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=1:00:00
#PBS -l mem=8GB

cd $PBS_O_WORKDIR
export PATH=$PBS_O_PATH:$PATH
export g09root=/opt/gridware/apps/gaussian
export GAUSS_SCRDIR=/tmp
. $g09root/g09/bsd/g09.profile

cp ethanol_dma_opt.chk ethanol_esp.chk
g09 ethanol_esp.com
