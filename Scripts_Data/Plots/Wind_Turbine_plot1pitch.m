% Code to plot simulation results from Wind_Turbine
%
% Copyright 2023-2025 The MathWorks, Inc.

%% Reuse figure if it exists, else create new figure
figString = ['h1_' mfilename];
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

tmpclr = colororder(gca);

%% Get simulation results
Itime_pitch = Blade_Pitch_DATA.time;
IPitch_Command_Data  = Blade_Pitch_DATA.signals.values(:,2);
IPitch_Angle_Data    = Blade_Pitch_DATA.signals.values(:,1);
IActuator_Force_Data = Pitch_Actuator_Force_DATA.signals.values(:,1);

%% Plot results
ah(1) = subplot(2,1,1);
plot(Itime_pitch, IPitch_Command_Data,'k-.','LineWidth', 1,'DisplayName','Command')
hold on
plot(Itime_pitch, IPitch_Angle_Data,'LineWidth', 1,'Color',tmpclr(1,:),'DisplayName','Angle')
hold off
grid on
title('Blade Pitch Angle','FontSize',14)
ylabel('Angle (deg)','FontSize',12)
%set(title_h);
%set(ylabel_h);
legend('Location','Best');

ah(2) = subplot(2,1,2);
plot(Itime_pitch, IActuator_Force_Data,'LineWidth', 1)
title('Blade Actuator Force','FontSize',14)
ylabel('Force (N)','FontSize',12)
xlabel('Time (s)','FontSize',12)
grid on

%% Remove temporary variables
