function Pitch_Actuation_Hydraulic_Testrig_setsolver(mdl,deskreal)
% Copyright 2011-2023 The MathWorks, Inc.

desktop_solver = 'ode23t';

realtime_nonlinIter = '3';
realtime_stepSize = '0.005';
realtime_localSolver = 'NE_BACKWARD_EULER_ADVANCER';
realtime_globalSolver = 'ode3';

f    = Simulink.FindOptions('FollowLinks',0,'LookUnderMasks','none');
solverBlock_pth = Simulink.findBlocks(mdl, 'SubClassName', 'solver',f);

if strcmpi(deskreal,'desktop')
    set_param(mdl,'Solver',desktop_solver);    
    for svb_i=1:size(solverBlock_pth,1)
        set_param(solverBlock_pth(svb_i), 'UseLocalSolver','off','DoFixedCost','off');
    end
else
    set_param(mdl,'Solver',realtime_globalSolver,'FixedStep','auto');
    for svb_i=1:size(solverBlock_pth,1)
        set_param(solverBlock_pth(svb_i),...
            'UseLocalSolver','on',...
            'DoFixedCost','on',...
            'MaxNonlinIter',realtime_nonlinIter,...
            'LocalSolverChoice',realtime_localSolver,...
            'LocalSolverSampleTime',realtime_stepSize);
    end
end
