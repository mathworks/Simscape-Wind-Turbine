function Wind_Turbine_setrealtime(mdl)
% Copyright 2009-2023 The MathWorks, Inc.

tvar_Nonlinear_Iterations = '3';
tvar_StepSize = '0.01';
tvar_LocalSolver='NE_BACKWARD_EULER_ADVANCER';
set_param(mdl,'Solver','ode1be','FixedStep','auto');

f    = Simulink.FindOptions('FollowLinks',0,'LookUnderMasks','none');
tvar_solverBlock = Simulink.findBlocks(bdroot, 'SubClassName', 'solver',f);
for i=1:size(tvar_solverBlock,1)
    set_param(tvar_solverBlock(i), 'UseLocalSolver','on','DoFixedCost','on','MaxNonlinIter',tvar_Nonlinear_Iterations,'LocalSolverChoice',tvar_LocalSolver,'LocalSolverSampleTime',tvar_StepSize);
end
