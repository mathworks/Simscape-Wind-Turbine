% Copyright 2009-2024 The MathWorks(TM), Inc.

colordef black;

%Special_Blue = [0 204 255]/255;
Special_Blue = [0 0.5 1];

%if(1==2)
time_pc = Wind_Turbine_Wind_DATA.time;
Wind_Speed_Data = Wind_Turbine_Wind_DATA.signals(:,1).values;
Pitch_Command_Data = Blade_Pitch_DATA.signals.values(:,2);
Pitch_Angle_Data = Blade_Pitch_DATA.signals.values(:,1);
Rotor_Speed_Data = Generator_Speed_DATA.signals(:,1).values;

%end
figure(1);
clf;

%new_sb211_h = 400;
set(gcf,'Position',[871    87   438   378]);

%set(gca,'Position',[0.15 0.63/522*new_sb211_h 0.775 0.341163*522/new_sb211_h])
%POSITION_211 = [0.15 0.583837 0.775 0.341163*522/new_sb211_h];

subplot(311)
ws_h = plot(time_pc,Wind_Speed_Data,'color','y','LineWidth',3);
title_h = title('Wind Speed (m/s)');
ylabel_h = ylabel('Speed (m/s)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 70 0 20]);

%legend_set = {'Command' 'Measured'};
%leg_h = legend(legend_set,'Location','Best');

subplot(312)

pc_h = plot(time_pc,Pitch_Command_Data,'color','m','LineWidth',3);
hold on
pa_h = plot(time_pc,Pitch_Angle_Data,'color','y','LineWidth',3,'LineStyle',':');
hold off

title_h = title('Pitch Angle (deg)');
ylabel_h = ylabel('Angle (deg)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 70 0 80]);

subplot(313)

pa_h = plot(time_pc,Rotor_Speed_Data,'color','y','LineWidth',3);

title_h = title('Rotor Speed (RPM)');
ylabel_h = ylabel('Speed (RPM)');
xlabel_h = xlabel('Time (s)');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 70 0 20]);
