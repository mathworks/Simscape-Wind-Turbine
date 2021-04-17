function Wind_Turbine_setdesktop(mdl)
% Copyright 2009-2021 The MathWorks, Inc.
set_param(mdl,'Solver','ODE23t','MaxStep','0.01');

tvar_solverBlock = find_system(mdl, 'SubClassName', 'solver');

for i=1:size(tvar_solverBlock,1)
    set_param(char(tvar_solverBlock(i)), 'UseLocalSolver','off','DoFixedCost','off');
end

%clear tvar_solverBlock