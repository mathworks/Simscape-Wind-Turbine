% Copyright 2009-2015 The MathWorks(TM), Inc.

colordef black;

%Special_Blue = [0 204 255]/255;
Special_Blue = [0 0.5 1];

%if(1==2)
time_yaw = Nacelle_Yaw_DATA.time;
Yaw_Command_Data = Nacelle_Yaw_DATA.signals.values(:,2);
Yaw_Angle_Data = Nacelle_Yaw_DATA.signals.values(:,1);
Actuator_Torque_Data = Yaw_Actuator_Torque_DATA.signals.values;

%end
figure(1);
clf;

%new_sb211_h = 400;
set(gcf,'Position',[765   405   449   336]);

%set(gca,'Position',[0.15 0.63/522*new_sb211_h 0.775 0.341163*522/new_sb211_h])
%POSITION_211 = [0.15 0.583837 0.775 0.341163*522/new_sb211_h];

subplot(211)
yc_h = plot(time_yaw,Yaw_Command_Data,'color','m','LineWidth',3);
hold on
ya_h = plot(time_yaw,Yaw_Angle_Data,'color','y','LineWidth',3);
hold off
title_h = title('Yaw Angle (deg)');
ylabel_h = ylabel('Angle (deg)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_yaw(end) -5 5]);

legend_set = {'Command' 'Measured'};
leg_h = legend(legend_set,'Location','Best');

subplot(212)

yaf_h = plot(time_yaw,Actuator_Torque_Data,'color','r','LineWidth',3);

title_h = title('Actuator Torque (Nm)');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Torque (Nm) ');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_yaw(end) -4e5 4e5]);

