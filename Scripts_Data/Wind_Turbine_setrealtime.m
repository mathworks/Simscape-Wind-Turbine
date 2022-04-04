function Wind_Turbine_setrealtime(mdl)
% Copyright 2009-2022 The MathWorks, Inc.

tvar_Nonlinear_Iterations = '3';
tvar_StepSize = '0.01';
tvar_LocalSolver='NE_BACKWARD_EULER_ADVANCER';
set_param(mdl,'Solver','ode3','FixedStep','auto');
tvar_solverBlock = find_system(mdl, 'SubClassName', 'solver');
for i=1:size(tvar_solverBlock,1)
    set_param(char(tvar_solverBlock(i)), 'UseLocalSolver','on','DoFixedCost','on','MaxNonlinIter',tvar_Nonlinear_Iterations,'LocalSolverChoice',tvar_LocalSolver,'LocalSolverSampleTime',tvar_StepSize);
end
