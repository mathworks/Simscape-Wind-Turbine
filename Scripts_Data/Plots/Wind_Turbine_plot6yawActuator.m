% Code to plot simulation results from Wind_Turbine
%
% Copyright 2023-2025 The MathWorks, Inc.

%% Reuse figure if it exists, else create new figure
figString = ['h6_' mfilename];
% Only create a figure if no figure exists
figExist = 0;
fig_hExist = evalin('base',['exist(''' figString ''')']);
if (fig_hExist)
    figExist = evalin('base',['ishandle(' figString ') && strcmp(get(' figString ', ''type''), ''figure'')']);
end
if ~figExist
    fig_h = figure('Name',figString);
    assignin('base',figString,fig_h);
else
    fig_h = evalin('base',figString);
end
figure(fig_h)
clf(fig_h)

%% Get simulation results
time_yaw = Nacelle_Yaw_DATA.time;
Yaw_Command_Data = Nacelle_Yaw_DATA.signals.values(:,2);
Yaw_Angle_Data = Nacelle_Yaw_DATA.signals.values(:,1);
Actuator_Torque_Data = Yaw_Actuator_Torque_DATA.signals.values;

%% Plot results
ah(1) = subplot(211);
yc_h = plot(time_yaw,Yaw_Command_Data,'k--','LineWidth',2,'DisplayName','Command');
hold on
ya_h = plot(time_yaw,Yaw_Angle_Data,'Color',tmpclr(1,:),'LineWidth',2,'DisplayName','Measured');
hold off
title_h = title('Yaw Angle (deg)');
ylabel_h = ylabel('Angle (deg)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_yaw(end) -5 5]);

leg_h = legend('Location','Best');

ah(2) = subplot(212);

yaf_h = plot(time_yaw,Actuator_Torque_Data,'LineWidth',2);

title_h = title('Actuator Torque (Nm)');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Torque (Nm) ');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_yaw(end) -4e5 4e5]);

