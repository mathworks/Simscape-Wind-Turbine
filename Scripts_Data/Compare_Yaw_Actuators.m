% Copyright 2009-2020 The MathWorks(TM), Inc.

Select_Turbine_Systems('IM_Yaw Test', WT_Configs);
open_system('Wind_Turbine/Nacelle');

sim('Wind_Turbine',20);
Yaw_Data.ideal_act.time = Nacelle_Yaw_DATA.time;
Yaw_Data.ideal_act.angle = Nacelle_Yaw_DATA.signals.values(:,1);
Yaw_Data.ideal_act.Actuator_Torque_Data = Yaw_Actuator_Torque_DATA.signals.values;

Select_Turbine_Systems('S_Yaw Test', WT_Configs);
sim('Wind_Turbine',20);
Yaw_Data.servomotor.time = Nacelle_Yaw_DATA.time;
Yaw_Data.servomotor.angle = Nacelle_Yaw_DATA.signals.values(:,1);
Yaw_Data.servomotor.Actuator_Torque_Data = Yaw_Actuator_Torque_DATA.signals.values;

colordef black
figure(1);
clf;
set(gcf,'Position',[333   248   449   336]);

subplot(211)
plot(Yaw_Data.ideal_act.time,Yaw_Data.ideal_act.angle,'r','LineWidth',3);
hold on
plot(Yaw_Data.servomotor.time,Yaw_Data.servomotor.angle,'c-.','LineWidth',3);
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

subplot(212)
plot(Yaw_Data.ideal_act.time,Yaw_Data.ideal_act.Actuator_Torque_Data,'r','LineWidth',3);
hold on
plot(Yaw_Data.servomotor.time,Yaw_Data.servomotor.Actuator_Torque_Data,'c-.','LineWidth',2.5);
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

colordef white


