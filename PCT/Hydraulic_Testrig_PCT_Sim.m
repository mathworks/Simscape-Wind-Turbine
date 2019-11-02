%% SETUP MODEL FOR RSIM
% Copyright 2012 The MathWorks(TM), Inc.

mdl = 'Pitch_Actuation_Hydraulic_Testrig_PCT';
open_system(mdl);
PCT_Orifice_Area =  WT_Params.Pitch_Actuator.orifice_area;

%% BUILD TARGET
rtp = Simulink.BlockDiagram.buildRapidAcceleratorTarget(mdl);

%% GENERATE PARAMETER SETS
Orifice_array = [1e-6:5e-7:2e-5]; 
SimSettings = Generate_Sim_Settings(Orifice_array,'PCT_Orifice_Area',rtp);

numSims = length(SimSettings);
out = cell(1, numSims);

%% START MATLAB POOL
matlabpool(2);
Initialize_MLPool

%% SIMULATE
tic;
parfor i = 1:numSims
    out{i} = sim(mdl, SimSettings{i});
end
Total_Testing_Time = toc;
disp(['Total Testing Time = ' num2str(Total_Testing_Time)]);

%% PLOT RESULTS
figure(1)
clf
set(gcf,'Position',[11   356   545   293]);

for i=1:numSims
    data = out{i}.find('PCT_Orifice_Test_DATA');
    plot(data.time(:,1),-data.signals.values(:,1))
    hold all
end
%plot(data.time(:,1),data.signals.values(:,2),'Color','b','LineWidth',3,'LineStyle',':')
title('Cylinder Extension vs. Time','FontSize',12,'FontWeight','Bold');
xlabel('Time (s)','FontSize',12,'FontWeight','Bold');
ylabel('Cylinder Extension','FontSize',12,'FontWeight','Bold');
legend(cellstr(num2str(fliplr(Orifice_array(1:1:end))')),'FontSize',6);

%% CLOSE MATLABPOOL 
matlabpool close
