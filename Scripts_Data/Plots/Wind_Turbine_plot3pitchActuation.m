function Wind_Turbine_plot3pitchActuation(simlog_hydrAct)
% Code to plot simulation results from Wind_Turbine.slx
%
% Copyright 2023-2024 The MathWorks, Inc.

%% Reuse figure if it exists, else create new figure
if~(hasChild(simlog_hydrAct,'Hydraulic_Cylinder'))
    warning('Please run a simulation that contains the hydraulic pitch actuation system')
else
    figString = ['h3_' mfilename];
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
    simlog_t     = simlog_hydrAct.Hydraulic_Cylinder.hard_stop.x.series.time;
    simlog_xAct  = simlog_hydrAct.Hydraulic_Cylinder.hard_stop.x.series.values('m');
    simlog_paAct = simlog_hydrAct.Hydraulic_Cylinder.A.p.series.values('MPa');
    simlog_pbAct = simlog_hydrAct.Hydraulic_Cylinder.B.p.series.values('MPa');

    tmpclr = colororder(gca);

    %% Plot results
    ah(1) = subplot(2,1,1);
    plot(simlog_t, simlog_paAct,'LineWidth', 1,'DisplayName','Chamber A')
    hold on
    plot(simlog_t, simlog_pbAct,'LineWidth', 1,'DisplayName','Chamber B')
    hold off
    grid on
    legend('Location','Best');
    title('Pitch Cylinder Pressures')
    ylabel('Pressure (MPa)')

    ah(2) = subplot(2,1,2);
    plot(simlog_t, simlog_xAct,'LineWidth', 1)
    grid on
    title('Pitch Actuator Extension')
    ylabel('Length (m)')
    xlabel('Time (s)')
end

%% Remove temporary variables
