% Code to plot simulation results from Wind_Turbine
%
% Copyright 2023-2024 The MathWorks, Inc.

%% Reuse figure if it exists, else create new figure
figString = ['h7_' mfilename];
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
time_gen = Generator_Power_DATA.time;
if(size(Generator_Speed_DATA.signals,2)==1)
    Speed_Data = Generator_Speed_DATA.signals.values(:,2);
    Power_Data = Generator_Power_DATA.signals.values(:,1);
else
    Speed_Data = Generator_Speed_DATA.signals(:,2).values;
    Power_Data = Generator_Power_DATA.signals(:,1).values;
end

%% Plot results

ax(1) = subplot(211);
gs_h = plot(time_gen,Speed_Data,'LineWidth',3);
title_h = title('Generator Speed (RPM)');
ylabel_h = ylabel('Speed (RPM)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_gen(end) 0 1500]);

ax(2) = subplot(212);

gp_h = plot(time_gen,Power_Data/1e6,'LineWidth',3);

title_h = title('Generator Power (MW)');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Power (MW) ');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_gen(end) 0 2]);

linkaxes(ax,'x')