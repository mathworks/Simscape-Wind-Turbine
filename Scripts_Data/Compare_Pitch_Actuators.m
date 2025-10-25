% This script tests the ideal and hydraulic pitch actuator models in the
% complete wind turbine model
%
% Copyright 2009-2025 The MathWorks(TM), Inc.

%% Open main model and key Scope
open_system([bdroot '/Nacelle']);
open_system([bdroot '/Scopes/Pitch Scopes/Pitch Command and Angle (deg)']);

%% Configure model for ideal actuators
i = find(strcmp({WT_Configs.Type},'I_Pitch Test'));     % Find config number
Select_Turbine_Systems(WT_Configs(i).Type,WT_Configs);  % Configure model
disp(['Run ' num2str(i) ': ' char(WT_Configs(i).Type)]);% Feedback

%% Run simulation
sim('Wind_Turbine',WT_Configs(i).Sim_Time);

%% Extract simulation results
Itime_pitch          = Blade_Pitch_DATA.time;
IPitch_Command_Data  = Blade_Pitch_DATA.signals.values(:,2);
IPitch_Angle_Data    = Blade_Pitch_DATA.signals.values(:,1);
IActuator_Force_Data = Pitch_Actuator_Force_DATA.signals.values(:,1);

%% Configure model for hydraulic actuators
i = find(strcmp({WT_Configs.Type},'H_Pitch Test'));      % Find config number
Select_Turbine_Systems(WT_Configs(i).Type,WT_Configs);   % Configure model
disp(['Run ' num2str(i) ': ' char(WT_Configs(i).Type)]); % Feedback

%% Run simulation
sim('Wind_Turbine',WT_Configs(i).Sim_Time);

%% Extract simulation results
Htime_pitch = Blade_Pitch_DATA.time;
HPitch_Command_Data = Blade_Pitch_DATA.signals.values(:,2);
HPitch_Angle_Data = Blade_Pitch_DATA.signals.values(:,1);
HPitch_Force_Data = Pitch_Actuator_Force_DATA.signals.values(:,1);
HActuator_Force_Data = Pitch_Actuator_Force_DATA.signals.values;

% Create plot
Special_Blue = '#237BE8';
Special_Orange ='#E69248';

figure(1);
subplot(211)
pai_h = plot(Itime_pitch,IPitch_Angle_Data,'color',Special_Blue,'LineWidth',3,'DisplayName','Ideal');
hold on
pah_h = plot(Htime_pitch,HPitch_Angle_Data,'color',Special_Orange,'LineWidth',3,'LineStyle','-.','DisplayName','Hydraulic');
hold off
title_h = title('Pitch Angle (deg)');
ylabel_h = ylabel('Angle (deg)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
legend('Location','Best')

subplot(212)
pfi_h = plot(Itime_pitch,IActuator_Force_Data,'color',Special_Blue,'LineWidth',3,'DisplayName','Ideal');
hold on
pfh_h = plot(Htime_pitch,HActuator_Force_Data,'color',Special_Orange,'LineWidth',3,'LineStyle','-.','DisplayName','Hydraulic');
hold off
title_h = title('Actuator Force (N)');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Force (N) ');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');

linkaxes(ah,'x')