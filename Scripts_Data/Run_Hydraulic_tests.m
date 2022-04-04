%WT_Tests = {'Ideal Pitch Test Only','Ideal Pitch Ideal Yaw Test Only','I_Pitch I_Yaw Simple Lift'};
%WT_Tests = [WT_Configs.Type];
%Select_Turbine_Systems(WT_Tests(i),WT_Configs)

% Copyright 2009-2022 The MathWorks(TM), Inc.

leakage_area_set = [1e-9 1e-10 1e-11 1e-12];
init_opening_set = [0 -1e-5 -3e-5 -5e-5];

k=0;
for i=1:length(leakage_area_set)
    for j=1:length(init_opening_set)
        k=k+1;
        disp(['Run ' num2str(k)]);
        
        WT_Params.Pitch_Actuator.Valve.leakage_area = leakage_area_set(i);
        WT_Params.Pitch_Actuator.Valve.initial_opening_pa = init_opening_set(j);
        WT_Params.Pitch_Actuator.Valve.initial_opening_at = init_opening_set(j);
        WT_Params.Pitch_Actuator.Valve.initial_opening_pb = init_opening_set(j);
        WT_Params.Pitch_Actuator.Valve.initial_opening_bt = init_opening_set(j);
        
        sim('Wind_Turbine')
        Hy_Results(k).leakage_area = leakage_area_set(i);
        Hy_Results(k).init_opening = init_opening_set(j);
        Hy_Results(k).Time = Elapsed_Sim_Time;
    end
end

for i=1:length(Hy_Results)
    disp(['Run ' num2str(i) ': Time = ' num2str(Hy_Results(i).Time)]);
end
