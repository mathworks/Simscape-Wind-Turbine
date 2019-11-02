% Copyright 2009-2017 The MathWorks(TM), Inc.

colordef black;

%Special_Blue = [0 204 255]/255;
Special_Blue = [0 0.5 1];

%if(1==2)
time_torque = Geartrain_Input_Torque_DATA.time;
Geartrain_Torque_Data = Geartrain_Input_Torque_DATA.signals.values(:,1);

%end
figure(1);
clf;

%new_sb211_h = 400;
set(gcf,'Position',[765   405   449   336]);

gt_h = plot(time_torque,Geartrain_Torque_Data,'color','y','LineWidth',3);
title_h = title('Geartrain Input Torque (Nm)','FontSize',14);
ylabel_h = ylabel('Torque (Nm)','FontSize',12);
xlabel_h = xlabel('Time (s)','FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_torque(end) -8e5 6e5]);

