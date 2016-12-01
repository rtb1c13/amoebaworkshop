#!/usr/bin/env python

# Script to run bar calculations for ethanol solvation free energies

import os
from subprocess import call

# Get working directory & lambda windows 

basedir = os.getcwd()
ele_l = [1.0,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0.0]
vdw_l = [1.0,0.9,0.8,0.75,0.7,0.65,0.6,0.5,0.4,0.2,0.0]

# Solution phase ele
for idx,val in enumerate(ele_l[1:]):
   relpath = os.path.join("solution","ele%s" % ele_l[idx])
   os.chdir(relpath)
   call('bar ethanol_run.arc 1 200 1 300 ../ele%s/ethanol_run.arc 1 200 1 300 > %s/sol_ele%s-%s_bar.out' % (val,basedir,ele_l[idx],val),shell=True)
   os.chdir(basedir)

# Solution phase vdw
for idx,val in enumerate(vdw_l[1:]):
   relpath = os.path.join("solution","vdw%s" % vdw_l[idx])
   os.chdir(relpath)
   call('bar ethanol_run.arc 1 200 1 300 ../vdw%s/ethanol_run.arc 1 200 1 300 > %s/sol_vdw%s-%s_bar.out' % (val,basedir,vdw_l[idx],val),shell=True)
   os.chdir(basedir)

# Gas phase ele
for idx,val in enumerate(ele_l[1:]):
   relpath = os.path.join("gas","ele%s" % ele_l[idx])
   os.chdir(relpath)
   call('bar ethanol_run.arc 1 200 1 300 ../ele%s/ethanol_run.arc 1 200 1 300 > %s/gas_ele%s-%s_bar.out' % (val,basedir,ele_l[idx],val),shell=True)
   os.chdir(basedir)
