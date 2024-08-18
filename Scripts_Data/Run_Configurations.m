%WT_Tests = {'Ideal Pitch Test Only','Ideal Pitch Ideal Yaw Test Only','I_Pitch I_Yaw Simple Lift'};
% Copyright 2009-2024 The MathWorks(TM), Inc.

WT_Tests = {WT_Configs.Type};

for i=1:length(WT_Tests)
    Select_Turbine_Systems(WT_Tests(i),WT_Configs);
    disp(['Run ' num2str(i) ': ' char(WT_Tests(i))]);
    sim('Wind_Turbine',WT_Configs(i).Sim_Time);
    WT_Results(i).Config = WT_Tests(i);
    WT_Results(i).Time = Elapsed_Sim_Time;
end

for i=1:length(WT_Results)
    disp([char(WT_Results(i).Config) ' Time = ' num2str(WT_Results(i).Time)]);
end
