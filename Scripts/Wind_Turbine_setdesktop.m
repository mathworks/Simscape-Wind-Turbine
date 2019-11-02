set_param(bdroot,'Solver','ODE23t','MaxStep','0.01');

tvar_solverBlock = find_system(bdroot, 'SubClassName', 'solver');

for i=1:size(tvar_solverBlock,1)
    set_param(char(tvar_solverBlock(i)), 'UseLocalSolver','off','DoFixedCost','off');
end

clear tvar_solverBlock