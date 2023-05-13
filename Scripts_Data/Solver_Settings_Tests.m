% Copyright 2009-2023 The MathWorks(TM), Inc.

Solver_Set = {'ode23t' 'ode15s'};
Max_Step_Size_Set = {0.01 'auto'};

WT_Tests = {WT_Configs.Type};

%for i=1:15
k=0;
for g = 1:length(Solver_Set)
    for h = 1:length(Max_Step_Size_Set')
        k=k+1;
        for i=1:length(WT_Tests)
            Select_Turbine_Systems(WT_Tests(i),WT_Configs);
            disp(['Run ' num2str(i) ' ' num2str(k) ': ' char(WT_Tests(i))]);
            sim('Wind_Turbine',WT_Configs(i).Sim_Time,simset('Solver',char(Solver_Set(g)),'MaxStep',Max_Step_Size_Set{h}));
            WT_Results(i).Config = WT_Tests(i);
            WT_Results(i,k).Time = Elapsed_Sim_Time;
        end
    end
end

for i=1:length(WT_Results)
    disp([char(WT_Results(i).Config) ' Time = ' num2str(WT_Results(i).Time)]);
end
