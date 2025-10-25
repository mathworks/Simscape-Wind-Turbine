% Code to plot simulation results from Wind_Turbine
%
% Copyright 2023-2025 The MathWorks, Inc.

%% Reuse figure if it exists, else create new figure
figString = ['h4_' mfilename];
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
time_pc = Wind_Turbine_Wind_DATA.time;
Wind_Speed_Data = Wind_Turbine_Wind_DATA.signals.values(:,1);
Pitch_Command_Data = Blade_Pitch_DATA.signals.values(:,2);
Pitch_Angle_Data = Blade_Pitch_DATA.signals.values(:,1);
Rotor_Speed_Data = Generator_Speed_DATA.signals.values(:,1);


ah(1) = subplot(311);
ws_h = plot(time_pc,Wind_Speed_Data,'LineWidth',2);
title_h = title('Wind Speed (m/s)');
ylabel_h = ylabel('Speed (m/s)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 70 0 20]);

ah(2) = subplot(312);

pc_h = plot(time_pc,Pitch_Command_Data,'k--','LineWidth',2);
hold on
pa_h = plot(time_pc,Pitch_Angle_Data,'Color',tmpclr(1,:),'LineWidth',2);
hold off

title_h = title('Pitch Angle (deg)');
ylabel_h = ylabel('Angle (deg)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 70 0 80]);

ah(3) = subplot(313);

pa_h = plot(time_pc,Rotor_Speed_Data,'LineWidth',2);

title_h = title('Rotor Speed (RPM)');
ylabel_h = ylabel('Speed (RPM)');
xlabel_h = xlabel('Time (s)');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 70 0 20]);
linkaxes(ah,'x')