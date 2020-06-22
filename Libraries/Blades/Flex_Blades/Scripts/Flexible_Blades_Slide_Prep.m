colordef black;

Special_Blue = [0 204 255]/255;
%Special_Blue = [0 0.5 1];

Change_Flex_Body_To_Lumped_Parameter;
sim('Wind_Turbine_Flexible_Blades');

time_lp = Flexible_Blade1_Load_DATA.time;
Speed_lp_Data = Flexible_Blade_Rotor_Speed_DATA.signals.values;
Torque_lp_Data = Flexible_Blade1_Load_DATA.signals(1,:).values;

Change_Flex_Body_To_FEA_Approach;
sim('Wind_Turbine_Flexible_Blades');

time_fe = Flexible_Blade1_Load_DATA.time;
Speed_fe_Data = Flexible_Blade_Rotor_Speed_DATA.signals.values;
Torque_fe_Data = Flexible_Blade1_Load_DATA.signals(1,:).values;

%end
figure(1);
clf;

%new_sb211_h = 400;
set(gcf,'Position',[510   205   449   336]);

%set(gca,'Position',[0.15 0.63/522*new_sb211_h 0.775 0.341163*522/new_sb211_h])
%POSITION_211 = [0.15 0.583837 0.775 0.341163*522/new_sb211_h];

subplot(211)
lp_h = plot(time_lp,Speed_lp_Data,'color','r','LineWidth',3);
hold on
fe_h = plot(time_fe,Speed_fe_Data,'color',Special_Blue,'LineWidth',3,'LineStyle','-.');
hold off
title_h = title('Rotor Speed (RPM)');
ylabel_h = ylabel('Speed (RPM) ');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_lp(end) 0 20]);

legend_set = {'Lumped' 'FEA'};
leg_h = legend(legend_set,'Location','Best');

subplot(212)

lp_h = plot(time_lp,Torque_lp_Data,'color','r','LineWidth',3);
hold on
fe_h = plot(time_fe,Torque_fe_Data,'color',Special_Blue,'LineWidth',3,'LineStyle','-.');
hold off

title_h = title('Torque At Blade Base (Nm)');
xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Torque (Nm) ');
set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([0 time_fe(end) -200 200]);

colordef white;

% Copyright 2009-2020 The MathWorks(TM), Inc.
