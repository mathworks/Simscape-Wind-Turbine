%% Use Parallel Computing and Fast Restart to sweep parameter value
% Copyright 2013-2022 The MathWorks(TM), Inc.

% Move to folder where script is saved
cd(fileparts(which(mfilename)));
orig_mdl = 'Pitch_Actuation_Hydraulic_Testrig';
open_system(orig_mdl);
mdl = [orig_mdl '_pct_temp'];
save_system(orig_mdl,mdl);

%% Configure model for tests
Hydraulic_Testrig_PCT_config(mdl,'setup');

%% Generate parameter sets
Orifice_array = [1e-6:5e-7:1.95e-5]; 

for i=1:length(Orifice_array)
    simInput(i) = Simulink.SimulationInput(mdl);
    simInput(i) = simInput(i).setVariable('PCT_Orifice_Area',Orifice_array(i));
end


%% Adjust settings and save
set_param(mdl,'SimMechanicsOpenEditorOnUpdate','off');
save_system(mdl)

%% Run parameter sweep in parallel
timerVal = tic;
simOut = parsim(simInput,'ShowSimulationManager','on',...
    'ShowProgress','on','UseFastRestart','on',...
    'TransferBaseWorkspaceVariables','on');
Elapsed_Time_Time_parallel  = toc(timerVal);

%% Calculate elapsed time less setup of parallel
Elapsed_Time_Sweep = ...
    (datenum(simOut(end).SimulationMetadata.TimingInfo.WallClockTimestampStop) - ...
    datenum(simOut(1).SimulationMetadata.TimingInfo.WallClockTimestampStart)) * 86400;
disp(['Elapsed Sweep Time Total:       ' sprintf('%5.2f',Elapsed_Time_Sweep)]);
disp(['Elapsed Sweep Time/(Num Tests): ' sprintf('%5.2f',Elapsed_Time_Sweep/length(simOut))]);

%% Plot results
plot_sim_res(simOut,'Parallel Test',Elapsed_Time_Time_parallel)

%% Close parallel pool
delete(gcp);

%% Cleanup directory
bdclose(mdl);
delete([mdl '.slx']);

%%  Plot function
function plot_sim_res(simOut,annotation_str,elapsed_time)

% Plot Results
fig_handle_name =   'h4_wind_turbine_pct';

handle_var = evalin('base',['who(''' fig_handle_name ''')']);
if(isempty(handle_var))
    evalin('base',[fig_handle_name ' = figure(''Name'', ''' fig_handle_name ''');']);
elseif ~isgraphics(evalin('base',handle_var{:}))
    evalin('base',[fig_handle_name ' = figure(''Name'', ''' fig_handle_name ''');']);
end
figure(evalin('base',fig_handle_name))
clf(evalin('base',fig_handle_name))

for i=1:length(simOut)
    data = simOut(i).find('PCT_Orifice_Test_DATA');
    plot(data.time(:,1),-data.signals.values(:,1))
    hold all
end
%plot(data.time(:,1),data.signals.values(:,2),'Color','b','LineWidth',3,'LineStyle',':')
title('Cylinder Extension vs. Time','FontSize',12,'FontWeight','Bold');
xlabel('Time (s)','FontSize',12,'FontWeight','Bold');
ylabel('Cylinder Extension','FontSize',12,'FontWeight','Bold');
Orifice_array = evalin('base','Orifice_array');
legend(cellstr(num2str(fliplr(Orifice_array(1:1:end))')),'FontSize',6);

text(0.1,0.15,sprintf('%s\n%s',annotation_str,['Elapsed Time: ' num2str(elapsed_time)]),'Color',[1 1 1]*0.6,'Units','Normalized');
end
