%% OPEN MODEL
% Copyright 2012-2021 The MathWorks, Inc.

orig_mdl = 'Wind_Turbine';
open_system(orig_mdl);

% Turbine *without* generator (slower real-time computers)
%Select_Turbine_Systems('H_Pitch S_Yaw Ge Lift_Drag', WT_Configs)
%rttest_StepSize = '1e-2'; rttest_NumIter = '3';

% Turbine *with* generator (fast real-time computers)
Select_Turbine_Systems('H_Pitch S_Yaw Ge Gn Lift_Drag', WT_Configs);
rttest_StepSize = '1.5e-3'; rttest_NumIter = '2';

mdl = [orig_mdl '_rttest_temp'];
save_system(orig_mdl,mdl);

set_param(mdl,'SimscapeLogType','None');
set_param(mdl,'StopTime','30');

%% GET REFERENCE RESULTS
Wind_Turbine_setdesktop(mdl)
sim(mdl)
log_meas = logsout.get('Pitch_Angle_Signal');
t_ref = log_meas.Values.Time; y_ref = log_meas.Values.Data;

%% Create plot
figure(1)
set(gcf,'Position',[552    50   472   301]);
plot(t_ref,y_ref,'k','LineWidth',3)
title('Comparing Simulation Results','FontSize',14,'FontWeight','Bold');
xlabel('Time (s)','FontSize',12);ylabel('Results');
legend({'Reference'},'Location','best')

%% Get results with real-time solver settings
Wind_Turbine_setrealtime(mdl)
set_param([mdl '/Solver Configuration'],'MaxNonlinIter',rttest_NumIter,'LocalSolverSampleTime',rttest_StepSize);
sim(mdl)
log_meas = logsout.get('Pitch_Angle_Signal');
t_fs = log_meas.Values.Time; y_fs = log_meas.Values.Data;

%% Compare desktop and real-time results
figure(1)
hold on
h2=stairs(t_fs, y_fs,'Color',temp_colororder(2,:),'LineWidth',2.5);
hold off
legend({'Reference','Fixed-Step'},'Location','NorthEast')

%% Build and download to real-time target
% Choose target
cs = getActiveConfigSet(mdl);
cs.switchTarget('slrealtime.tlc',[]);

set_param(mdl,'SimMechanicsOpenEditorOnUpdate','off');
slbuild(mdl);

%% Download to real-time target
tg = slrealtime;
tg.connect;

%% Run application
tg.load(mdl)
tg.start('ReloadOnStop',true,'ExportToBaseWorkspace',true)

open_system(mdl);
disp('Waiting for SLRT to finish...');
pause(1);
while(strcmp(tg.status,'running'))
    pause(2);
    disp(tg.status);
end
pause(2);

%% Extract results from logged data in Simulink Data Inspector
y_slrt1 = logsout.LiveStreamSignals.get('Pitch_Angle_Signal');

%% Plot reference and real-time results
figure(1)
hold on
h3=stairs(y_slrt1.Values.Time,y_slrt1.Values.Data,'c:','LineWidth',2.5);
hold off
legend({'Reference','Fixed-Step','Real-Time'},'Location','NorthEast');

%% CLEANUP
cleanup_rt_dir
