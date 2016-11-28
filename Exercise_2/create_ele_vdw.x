#!/bin/bash

# Script to create inputs for Tinker absolute solvation free energy calcs
# Creates solution phase discharging & vdW decoupling, and gas phase
# discharging only

# Solution phase ele
for ele in 1.0 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.0
do
 mkdir -p solution/ele${ele}
 cat << EOF > solution/ele${ele}/ethanol_run.key
parameters AMOEBA_ethanol_solv.prm

a-axis 24.662               
b-axis 24.662
c-axis 24.662

ligand -1 9
ele-lambda ${ele}
vdw-lambda 1.0

openmp-threads 8           

cutoff 9.0                 
ewald                      
ewald-cutoff 7.0           
vdw-correction             
polar-eps 0.00001             

neighbor-list              

printout 5000

thermostat andersen        
integrator verlet          

archive                    
EOF
 cp AMOEBA_ethanol_solv.prm solution/ele${ele}
 cp ethanol_npt_final.xyz solution/ele${ele}/ethanol_run.xyz
 cp ethanol_npt.dyn solution/ele${ele}/ethanol_run.dyn
 cat << EOF > solution/ele${ele}/ethanol_run.x
#!/bin/bash
dynamic ethanol_run.xyz -k ethanol_run.key 1000000 1.0 5.0 2 300 > ethanol_run.out
EOF
 chmod 755 solution/ele${ele}/ethanol_run.x
done

# Solution phase vdw
for vdw in 1.0 0.9 0.8 0.75 0.7 0.65 0.6 0.5 0.4 0.2 0.0
do
 mkdir -p solution/vdw${vdw}
 cat << EOF > solution/vdw${vdw}/ethanol_run.key
parameters AMOEBA_ethanol_solv.prm

a-axis 24.662               
b-axis 24.662
c-axis 24.662

ligand -1 9
ele-lambda 0.0
vdw-lambda ${vdw}

openmp-threads 8           

cutoff 9.0                 
ewald                      
ewald-cutoff 7.0           
vdw-correction             
polar-eps 0.00001             

neighbor-list              

printout 5000

thermostat andersen        
integrator verlet          

archive                    
EOF
 cp AMOEBA_ethanol_solv.prm solution/vdw${vdw}
 cp ethanol_npt_final.xyz solution/vdw${vdw}/ethanol_run.xyz
 cp ethanol_npt.dyn solution/vdw${vdw}/ethanol_run.dyn
 cat << EOF > solution/vdw${vdw}/ethanol_run.x
#!/bin/bash
dynamic ethanol_run.xyz -k ethanol_run.key 1000000 1.0 5.0 2 300 > ethanol_run.out
EOF
 chmod 755 solution/vdw${vdw}/ethanol_run.x
done

# Gas phase ele
for ele in 1.0 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.0
do
 mkdir -p gas/ele${ele}
 cat << EOF > gas/ele${ele}/ethanol_run.key
parameters AMOEBA_ethanol_solv.prm

ligand -1 9
ele-lambda ${ele}
vdw-lambda 1.0

openmp-threads 1           

cutoff 99.0                 
polar-eps 0.00001             

neighbor-list              

printout 5000

thermostat andersen        
integrator stochastic          

archive                    
EOF
 cp AMOEBA_ethanol_solv.prm gas/ele${ele}
 cp ethanol_minimised.xyz gas/ele${ele}/ethanol_run.xyz
 cat << EOF > gas/ele${ele}/ethanol_run.x
#!/bin/bash
dynamic ethanol_run.xyz -k ethanol_run.key 1000000 0.1 0.5 2 300 > ethanol_run.out
EOF
 chmod 755 gas/ele${ele}/ethanol_run.x
done
