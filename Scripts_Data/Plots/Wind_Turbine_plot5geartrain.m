% Code to plot simulation results from Wind_Turbine
%
% Copyright 2023-2025 The MathWorks, Inc.

%% Reuse figure if it exists, else create new figure
figString = ['h5_' mfilename];
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
time_torque = Geartrain_Input_Torque_DATA.time;
Geartrain_Torque_Data = Geartrain_Input_Torque_DATA.signals.values(:,1);

%% Plot results
gt_h = plot(time_torque,Geartrain_Torque_Data,'LineWidth',2);
title_h = title('Geartrain Input Torque (Nm)','FontSize',14);
ylabel_h = ylabel('Torque (Nm)','FontSize',12);
xlabel_h = xlabel('Time (s)','FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_torque(end) -8e5 6e5]);

