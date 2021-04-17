%% OPEN MODEL
% Copyright 2012-2021 The MathWorks, Inc.

%mdl = 'Pitch_Actuation_Hydraulic_Testrig_rt';
orig_mdl = 'Pitch_Actuation_Hydraulic_Testrig';
open_system(orig_mdl);
mdl = [orig_mdl '_rttest_temp'];
save_system(orig_mdl,mdl);

set_param(mdl,'SimscapeLogType','none');

%% Get reference results
Pitch_Actuation_Hydraulic_Testrig_setsolver(mdl,'desktop');
sim(mdl)
log_meas = logsout.get('cyl_pos_vel');
t_ref = log_meas.Values.Time; y_ref = log_meas.Values.Data(:,1);

%% CREATE PLOT
figure(1)
temp_colororder = get(gca,'DefaultAxesColorOrder');
set(gcf,'Position',[552    50   472   301]);
plot(t_ref,y_ref,'k','LineWidth',3)
title('Comparing Simulation Results','FontSize',14,'FontWeight','Bold');
xlabel('Time (s)','FontSize',12);ylabel('Results');
legend({'Reference'},'Location','NorthEast')

%% Get results with real-time solver settings
Pitch_Actuation_Hydraulic_Testrig_setsolver(mdl,'realtime');
sim(mdl)
log_meas = logsout.get('cyl_pos_vel');
t_fs = log_meas.Values.Time; y_fs = log_meas.Values.Data(:,1);

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
y_slrt1 = logsout.LiveStreamSignals.get('cyl_pos_vel');

%% Plot reference and real-time results
figure(1)
hold on
h3=stairs(y_slrt1.Values.Time,y_slrt1.Values.Data(:,1),'c:','LineWidth',2.5);
hold off
legend({'Reference','Fixed-Step','Real-Time'},'Location','NorthEast');

%% CLEANUP
cleanup_rt_dir

