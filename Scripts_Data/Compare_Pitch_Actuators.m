% Copyright 2009-2023 The MathWorks(TM), Inc.

open_system([bdroot '/Nacelle']);
open_system([bdroot '/Scopes/Pitch Scopes/Pitch Command and Angle (deg)']);

i = find(strcmp({WT_Configs.Type},'I_Pitch Test'));
Select_Turbine_Systems(WT_Configs(i).Type,WT_Configs);
disp(['Run ' num2str(i) ': ' char(WT_Configs(i).Type)]);
sim('Wind_Turbine',WT_Configs(i).Sim_Time);
Itime_pitch = Blade_Pitch_DATA.time;
IPitch_Command_Data = Blade_Pitch_DATA.signals.values(:,2);
IPitch_Angle_Data = Blade_Pitch_DATA.signals.values(:,1);
IActuator_Force_Data = Pitch_Actuator_Force_DATA.signals.values(:,1);

i = find(strcmp({WT_Configs.Type},'H_Pitch Test'));
Select_Turbine_Systems(WT_Configs(i).Type,WT_Configs);
disp(['Run ' num2str(i) ': ' char(WT_Configs(i).Type)]);
sim('Wind_Turbine',WT_Configs(i).Sim_Time);
disp('I Pitch Test');
Htime_pitch = Blade_Pitch_DATA.time;
HPitch_Command_Data = Blade_Pitch_DATA.signals.values(:,2);
HPitch_Angle_Data = Blade_Pitch_DATA.signals.values(:,1);
HPitch_Force_Data = Pitch_Actuator_Force_DATA.signals.values(:,1);
HActuator_Force_Data = Pitch_Actuator_Force_DATA.signals.values;

%end
Special_Blue = [0 204 255]/255;
Special_Orange = [245 200 100]/255;

colordef black;
figure(1);
clf;

%new_sb211_h = 400;
set(gcf,'Position',[504   324   449   336]);

%set(gca,'Position',[0.15 0.63/522*new_sb211_h 0.775 0.341163*522/new_sb211_h])
%POSITION_211 = [0.15 0.583837 0.775 0.341163*522/new_sb211_h];

subplot(211)
pai_h = plot(Itime_pitch,IPitch_Angle_Data,'color','r','LineWidth',3);
hold on
pah_h = plot(Htime_pitch,HPitch_Angle_Data,'color','c','LineWidth',3,'LineStyle','-.');
title_h = title('Pitch Angle (deg)');
ylabel_h = ylabel('Angle (deg)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
%axis([0.2 1.3 -2.15 -0.65]);

subplot(212)

pfi_h = plot(Itime_pitch,IActuator_Force_Data,'color','r','LineWidth',3);
hold on
pfh_h = plot(Htime_pitch,HActuator_Force_Data,'color','c','LineWidth',3,'LineStyle','-.');

title_h = title('Actuator Force (N)');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Force (N) ');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
%axis([0.6 0.9 0.042 0.0447]);

colordef white;
