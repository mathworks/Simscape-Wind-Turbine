% Copyright 2009-2017 The MathWorks(TM), Inc.

Select_Turbine_Systems('I_Pitch Test', WT_Configs);
sim('Wind_Turbine');
Pitch_Data.ideal_act.time = Pitch_Angle_DATA.time;
Pitch_Data.ideal_act.angle = Pitch_Angle_DATA.signals.values(:,1);
Select_Turbine_Systems('H_Pitch Test', WT_Configs);
sim('Wind_Turbine');
Pitch_Data.hydr_act.time = Pitch_Angle_DATA.time;
Pitch_Data.hydr_act.angle = Pitch_Angle_DATA.signals.values(:,1);

plot(Pitch_Data.ideal_act.time,Pitch_Data.ideal_act.angle,'b');
hold on
plot(Pitch_Data.hydr_act.time,Pitch_Data.hydr_act.angle,'r:');
hold off
