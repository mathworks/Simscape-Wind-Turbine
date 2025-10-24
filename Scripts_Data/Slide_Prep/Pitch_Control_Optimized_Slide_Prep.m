% Copyright 2009-2024 The MathWorks(TM), Inc.

%colordef black;

time = Pitch_Control_H_Angle_DATA.time;
Angle_Data = Pitch_Control_H_Angle_DATA.signals(1).values(:,1);
%Ref_Data = Pitch_Control_H_Angle_DATA.signals(1).values(:,2);
Force_Data = Pitch_Control_H_Force_DATA.signals(1).values;

patch_color = [239/256 241/256 227/256]*.8;

figure(1);
clf;

Special_Blue = [0 0.5 1];

%new_sb211_h = 400;
%set(gcf,'Position',[765   405   449   336]);

%set(gca,'Position',[0.15 0.63/522*new_sb211_h 0.775 0.341163*522/new_sb211_h])
%POSITION_211 = [0.15 0.583837 0.775 0.341163*522/new_sb211_h];
subplot(211)
%hold on;
if(1==1)
    patch1_x = [0 3 3 0]; patch1_y = [-1 -1 1 1];   patch1_h = patch(patch1_x, patch1_y, patch_color,'EdgeColor',patch_color);hold on
    patch2_x = [3 4 4 3]; patch2_y = [-1 -1 20 20]; patch2_h = patch(patch2_x, patch2_y, patch_color,'EdgeColor',patch_color);hold on
    patch3_x = [4 5 5 4]; patch3_y = [15 15 20 20]; patch3_h = patch(patch3_x, patch3_y, patch_color,'EdgeColor',patch_color);hold on
    patch4_x = [5 5.5 5.5 5]; patch4_y = [18 18 20 20]; patch4_h = patch(patch4_x, patch4_y, patch_color,'EdgeColor',patch_color);hold on
end
Angle_h = plot(time,Angle_Data,'color',Special_Blue,'LineWidth',3);
title_h = title('Pitch Angle (deg)');
set(title_h,'FontSize',14);
ylabel_h = ylabel('Angle (deg)','FontSize',12);
grid on
set(gca,'Box','on');
axis([time(1) time(end) -2 20]);

subplot(212)
patch4_x = [0 5.5 5.5 0]; patch4_y = [-5e4 -5e4 5e4 5e4]; patch4_h = patch(patch4_x, patch4_y, patch_color);hold on
Force_h = plot(time,Force_Data,'LineWidth',3,'color','r');

title_h = title('Actuator Force');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Force');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
%legend('No Friction','Friction','Location','Best');
%legend('Rod','Piston','Location',[0.2128    0.4421    0.2691    0.1622]);
axis([time(1) time(end) -6e4 6e4]);





