% Code to plot simulation results from Wind_Turbine
%
% Copyright 2023-2024 The MathWorks, Inc.

%% Reuse figure if it exists, else create new figure
figString = ['h2_' mfilename];
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
Yaw_Data_time  = Nacelle_Yaw_DATA.time;
Yaw_Data_angle = Nacelle_Yaw_DATA.signals.values(:,1);
Yaw_Data_cmd   = Nacelle_Yaw_DATA.signals.values(:,2);
Yaw_Data_Torque_Data = Yaw_Actuator_Torque_DATA.signals.values;

tmpclr = colororder(gca);

%% Plot results
ah(1) = subplot(2,1,1);
plot(Yaw_Data_time, Yaw_Data_cmd,'k-.','LineWidth', 1,'DisplayName','Command')
hold on
plot(Yaw_Data_time, Yaw_Data_angle,'LineWidth', 1,'Color',tmpclr(1,:),'DisplayName','Angle')
hold off
grid on
title('Nacelle Yaw Angle')
ylabel('Angle (deg)')
legend('Location','Best');

ah(2) = subplot(2,1,2);
plot(Yaw_Data_time, Yaw_Data_Torque_Data,'LineWidth', 1)
title('Nacelle Yaw Actuator Torque')
ylabel('Torque (N*m)')
xlabel('Time (s)')
grid on

%% Remove temporary variables
