% Copyright 2009-2017 The MathWorks, Inc.

tvar_Nonlinear_Iterations = '3';
tvar_StepSize = '0.01';
tvar_LocalSolver='NE_BACKWARD_EULER_ADVANCER';
set_param(bdroot,'Solver','ode3','FixedStep','auto');
tvar_solverBlock = find_system(bdroot, 'SubClassName', 'solver');
for i=1:size(tvar_solverBlock,1)
    set_param(char(tvar_solverBlock(i)), 'UseLocalSolver','on','DoFixedCost','on','MaxNonlinIter',tvar_Nonlinear_Iterations,'LocalSolverChoice',tvar_LocalSolver,'LocalSolverSampleTime',tvar_StepSize);
end
clear tvar_Nonlinear_Iterations tvar_StepSize tvar_LocalSolver tvar_solverBlock