% Copyright 2009-2025 The MathWorks(TM), Inc.

colordef black;

%Special_Blue = [0 204 255]/255;
Special_Blue = [0 0.5 1];

%if(1==2)
time_pitch = Blade_Pitch_DATA.time;
Pitch_Command_Data = Blade_Pitch_DATA.signals.values(:,2);
Pitch_Angle_Data = Blade_Pitch_DATA.signals.values(:,1);

Actuator_Force_Data = Pitch_Actuator_Force_DATA.signals.values;

%end
figure(1);
clf;

%new_sb211_h = 400;
set(gcf,'Position',[765   405   449   336]);

%set(gca,'Position',[0.15 0.63/522*new_sb211_h 0.775 0.341163*522/new_sb211_h])
%POSITION_211 = [0.15 0.583837 0.775 0.341163*522/new_sb211_h];

subplot(211)
pc_h = plot(time_pitch,Pitch_Command_Data,'color','m','LineWidth',3);
hold on
pa_h = plot(time_pitch,Pitch_Angle_Data,'color','y','LineWidth',3);
title_h = title('Pitch Angle (deg)');
ylabel_h = ylabel('Angle (deg)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_pitch(end) -20 20]);

subplot(212)

paf_h = plot(time_pitch,Actuator_Force_Data,'color','r','LineWidth',3);

title_h = title('Actuator Force (N)');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Force (N) ');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_pitch(end) -1e5 1e5]);

