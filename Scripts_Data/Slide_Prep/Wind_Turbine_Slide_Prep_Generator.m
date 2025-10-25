% Copyright 2009-2025 The MathWorks(TM), Inc.

%colordef black;

%Special_Blue = [0 204 255]/255;
Special_Blue = [0 0.5 1];

%if(1==2)
time_gen = Generator_Power_DATA.time;
Speed_Data = Generator_Speed_DATA.signals.values(:,2);
Power_Data = Generator_Power_DATA.signals.values(:,1);

%end
figure(1);
clf;

%new_sb211_h = 400;
set(gcf,'Position',[765   180   449   336]);

%set(gca,'Position',[0.15 0.63/522*new_sb211_h 0.775 0.341163*522/new_sb211_h])
%POSITION_211 = [0.15 0.583837 0.775 0.341163*522/new_sb211_h];

subplot(211)
gs_h = plot(time_gen,Speed_Data,'color','y','LineWidth',3);
title_h = title('Generator Speed (RPM)');
ylabel_h = ylabel('Speed (RPM)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_gen(end) 0 1500]);

%legend_set = {'Command' 'Measured'};
%leg_h = legend(legend_set,'Location','Best');

subplot(212)

gp_h = plot(time_gen,Power_Data/1e6,'color','g','LineWidth',3);

title_h = title('Generator Power (MW)');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Power (MW) ');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_gen(end) 0 2]);

