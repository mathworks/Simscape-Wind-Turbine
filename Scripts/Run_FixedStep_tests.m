%WT_Tests = {'Ideal Pitch Test Only','Ideal Pitch Ideal Yaw Test Only','I_Pitch I_Yaw Simple Lift'};
%WT_Tests = [WT_Configs.Type];
%Select_Turbine_Systems(WT_Tests(i),WT_Configs)

% Copyright 2009-2017 The MathWorks(TM), Inc.

FixedStepSolvers = {'ode1';'ode2';'ode3';'ode4'};

k=0;
for i=1:length(FixedStepSolvers)
    disp(['Run ' num2str(k) ' Solver ' char(FixedStepSolvers{i})]);

    set_param(gcs,'Solver',char(FixedStepSolvers{i}));
    set_param(gcs,'FixedStep',num2str(1e-4));
    
    sim('Wind_Turbine')
    Pitch_DATA(i).Data = Pitch_Com_Angle_DATA.signals.values;
    Pitch_DATA(i).Time = Pitch_Com_Angle_DATA.time;
    Pitch_DATA(i).Solver = char(FixedStepSolvers{i});
    Pitch_DATA(i).ElapsedSimTime = Elapsed_Sim_Time;
end


for i=1:length(Pitch_DATA)
    disp(['Run ' num2str(i) ': Time = ' num2str(Pitch_DATA(i).ElapsedSimTime)]);
end
