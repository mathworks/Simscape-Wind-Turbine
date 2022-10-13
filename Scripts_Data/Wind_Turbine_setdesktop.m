function Wind_Turbine_setdesktop(mdl)
% Copyright 2009-2022 The MathWorks, Inc.
set_param(mdl,'Solver','ODE23t','MaxStep','0.01');

f    = Simulink.FindOptions('FollowLinks',0,'LookUnderMasks','none');
tvar_solverBlock = Simulink.findBlocks(bdroot, 'SubClassName', 'solver',f);

for i=1:size(tvar_solverBlock,1)
    set_param(tvar_solverBlock(i), 'UseLocalSolver','off','DoFixedCost','off');
end

%clear tvar_solverBlock