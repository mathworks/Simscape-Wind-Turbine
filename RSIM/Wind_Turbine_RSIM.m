%% RSIM FOR PARAMETER SWEEP
% Copyright 2009-2015 The MathWorks(TM), Inc.
Model_Name = 'Wind_Turbine';
open_system(Model_Name);

%% BUILD STANDALONE EXECUTABLE
disp(['Building standalone executable for ' Model_Name '.mdl']);
set_param(gcs,'SystemTargetFile','rsim.tlc')
setup_Wind_Turbine_RSIM

rtwbuild(Model_Name);
[rtpstruct]= rsimgetrtp(Model_Name); % NECESSARY FOR 10a
disp(['Finished building standalone executable for ' Model_Name '.mdl']);


%% CREATE RSIM PARAMETER FILES
disp(' ');disp('Creating RSIM parameter files...')

WT_Params.Pitch_Controller.P_Gain = 100000; 
[rtpstruct]= rsimgetrtp(Model_Name);
save Wind_Turbine_Parameters_01 rtpstruct;

cleanup_Wind_Turbine_RSIM
disp('Finished creating parameter data files.')

%% RUN STANDALONE EXECUTABLE
disp(' ');disp('Running RSIM simulations...')
!Wind_Turbine -p Wind_Turbine_Parameters_01.mat -o results_01.mat
disp('Finished RSIM simulations...')

%% PLOT RESULTS
colordef black
figure
set(gcf,'Position',[16   361   449   336]);

load results_01.mat; HS_h(1)=plot(rt_Geartrain_Input_Torque_DATA.time, rt_Geartrain_Input_Torque_DATA.signals.values); 
set(HS_h,'LineWidth',3);

title_h = title('Geartrain Torque (Nm)');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Torque (Nm)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on

%axis([0 200 0 120]);
colordef white

%% CLEANUP DIRECTORY RESET MODEL
delete Wind_Turbine.exe
delete Wind_Turbine_Parameters*.mat
delete results*.mat
delete Wind_Turbine_sfun.mexw32
delete Wind_Turbine_sfun.mexw64
rmdir('Wind_Turbine_rsim_rtw','s')
rmdir('slprj','s')




