# Introduction
This repo contains the scripts for power distribution system restoration. 

# Pre-requisite
Most of the scripts are written in MATLAB 2016a and optimization requires MATLAB to be linked with CPLEX. Please be familiar with mixed-integer linear programming. https://www.ibm.com/support/knowledgecenter/pl/SSSA5P_12.8.0/ilog.odms.cplex.help/refmatlabcplex/html/cplexmilp-m.html

MATLAB can be linked with CPLEX by simply following the steps given below in MATLAB command window:
1. Contains header m files, parsed p files and mex files for the CPLEX class and toolbox. 

    addpath (‘CPLEX install dir\cplex\matlab\x64_win64’)
    
    savepath
    
    
    
2. Contains MATLAB examples for the CPLEX API utilization.

    addpath (‘CPLEX install dir\cplex\examples\src\matlab’)
    
    savepath
