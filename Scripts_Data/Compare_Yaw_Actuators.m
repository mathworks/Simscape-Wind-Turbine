% This script tests the ideal and electrical yaw actuator models in the
% complete wind turbine model
%
% Copyright 2009-2024 The MathWorks(TM), Inc.

%% Open main model and key Scope
open_system('Wind_Turbine/Nacelle');
open_system([bdroot '/Scopes/Yaw Ctrl Scopes/Nacelle Yaw']);

%% Configure model for ideal actuators
Select_Turbine_Systems('IM_Yaw Test', WT_Configs);

%% Run simulation
sim('Wind_Turbine',40);

%% Extract simulation results
Yaw_Data.ideal_act.time = Nacelle_Yaw_DATA.time;
Yaw_Data.ideal_act.angle = Nacelle_Yaw_DATA.signals.values(:,1);
Yaw_Data.ideal_act.Actuator_Torque_Data = Yaw_Actuator_Torque_DATA.signals.values;

%% Configure model for electric actuators
Select_Turbine_Systems('S_Yaw Test', WT_Configs);

%% Run simulation
sim('Wind_Turbine',40);

%% Extract simulation results
Yaw_Data.servomotor.time = Nacelle_Yaw_DATA.time;
Yaw_Data.servomotor.angle = Nacelle_Yaw_DATA.signals.values(:,1);
Yaw_Data.servomotor.Actuator_Torque_Data = Yaw_Actuator_Torque_DATA.signals.values;

% Create plot
figure(1);
clf;
Special_Blue = '#237BE8';
Special_Green ='#86BC05';

ah(1) = subplot(211);
plot(Yaw_Data.ideal_act.time,Yaw_Data.ideal_act.angle,'Color',Special_Blue,'LineWidth',3);
hold on
plot(Yaw_Data.servomotor.time,Yaw_Data.servomotor.angle,'LineStyle','-.','Color',Special_Green,'LineWidth',3);
hold off
grid on
set(gca,'Box','on');
title_h = title('Yaw Angle (deg)');
ylabel_h = ylabel('Angle (deg)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
axis([0 max(Yaw_Data.ideal_act.time) -5 5]);

legend_set = {'Ideal Actuator' 'Servomotor'};
leg_h = legend(legend_set,'Location','Best');

ah(2) = subplot(212);
plot(Yaw_Data.ideal_act.time,Yaw_Data.ideal_act.Actuator_Torque_Data,'Color',Special_Blue,'LineWidth',3);
hold on
plot(Yaw_Data.servomotor.time,Yaw_Data.servomotor.Actuator_Torque_Data,'LineStyle','-.','Color',Special_Green,'LineWidth',2.5);
hold off
title_h = title('Actuator Torque (Nm)');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Torque (Nm) ');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);

grid on
set(gca,'Box','on');
axis([0 max(Yaw_Data.ideal_act.time) -110 110]);

linkaxes(ah,'x')
