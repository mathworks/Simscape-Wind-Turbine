% Copyright 2009-2023 The MathWorks(TM), Inc.

WT_Tests = {'I_Pitch Test','H_Pitch Test','IA_Yaw Test','IM_Yaw Test','S_Yaw Test','I_Pitch L_Yaw Ge Gn Lift_Drag','I_Pitch IA_Yaw Ge Lift_Drag'};

for i=1:length(WT_Tests)
    Select_Turbine_Systems(WT_Tests(i),WT_Configs);
    disp(['Run ' num2str(i) ': ' char(WT_Tests(i))]);
    sim('Wind_Turbine');
    WT_Results(i).Config = WT_Tests(i);
    WT_Results(i).Time = Elapsed_Sim_Time;
end

%for i=1:length(WT_Results)
%    disp([char(WT_Results(i).Config) ' Time = ' num2str(WT_Results(i).Time)]);
%end
