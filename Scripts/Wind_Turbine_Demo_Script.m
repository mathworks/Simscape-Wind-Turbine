%% Wind Turbine Demo Script
%
% <html>
% <span style="font-family:Arial">
% <span style="font-size:10pt">
% <tr>1.  <a href="matlab:startup_Wind_Turbine;Select_Turbine_Systems('I_Pitch IA_Yaw Ge Lift_Drag', WT_Configs);">Wind Turbine System Level Model</a><br>
% <tr>2.  Model Blade Pitch Linkage <a href="matlab:open_system('Pitch_Actuation_Linkage_Lib');new_system('untitled');open_system('untitled');">From Scratch</a>, <a href="matlab:Pitch_Actuation_Linkage;">Finished Model</a><br>
% <tr>3.  <a href="matlab:Wind_Turbine;">Link Specification and Design</a><br>
% <tr>4.  <a href="matlab:Pitch_Control_Ideal_Testrig;">Determine Pitch Actuator Requirements</a><br>
% <tr>5.  <a href="matlab:Pitch_Actuation_Hydraulic_Testrig;">Test Hydraulic Pitch Actuator Design</a><br>
% <tr>6.  <a href="matlab:cd([WT_HomeDir '\PCT']);Pitch_Actuation_Hydraulic_Testrig_PCT;edit Hydraulic_Testrig_PCT_Sim;">Distribute Simulations Using Parallel Computing</a><br>
% <tr>7.  <a href="matlab:Wind_Turbine;Compare_Pitch_Actuators;">Compare Pitch Actuators Using Full Turbine Model</a><br>
% <tr>8.  <a href="matlab:Wind_Turbine;Select_Turbine_Systems('IA_Yaw Test', WT_Configs);open_system('Wind_Turbine/Nacelle');open_system('Wind_Turbine/Yaw Ctrl Scopes/Yaw Actuator Torque');">Determine Yaw Actuator Requirements</a><br>
% <tr>9.  <a href="matlab:Compare_Yaw_Actuators;">Compare Yaw Actuators Using Full Turbine Model</a><br>
% <tr>10. <a href="matlab:Generator_Testrig;">Model Geartrain, Generator and Grid</a><br>
% <tr>11. <a href="matlab:Wind_Turbine;Select_Turbine_Systems('I_Pitch IA_Yaw Ge Gn Lift_Drag', WT_Configs);open_system('Wind_Turbine/Generator Scopes/Power');open_system('Wind_Turbine/Nacelle');">Add Generator to Full Model</a><br>
% <tr>12. <a href="matlab:Wind_Turbine;Select_Turbine_Systems('I_Pitch IA_Yaw Ge Lift_Drag', WT_Configs);open_system('Wind_Turbine/Blade Load');">Model Force of Wind On Blades</a><br>
% <tr>13. <a href="matlab:cd([WT_HomeDir '\Libraries\Blades\Flex_Blades']);startup_Flexible_Blades">Model Blade Flexibility</a><br>
% <tr>14. <a href="matlab:cd([WT_HomeDir '\Libraries\Pitch_Controller']);Pitch_Control_Hydraulic_Testrig;">Use Linear Control Theory To Design Compensator</a><br>
% <tr>15. <a href="matlab:Pitch_Control_Hydraulic_Testrig;">Use Optimization Algorithms To Tune Compensator</a><br>
% <tr>16. <a href="matlab:cd([WT_HomeDir '\Libraries\Main_Controller']);Turbine_State_Machine_Testrig;">Open Supervisory Control Testrig</a><br>
% <tr>17. Document Results: <a href="matlab:open('Wind_Turbine_Report_WIND_TESTS.html');">View Report</a>, <a href="matlab:open('Wind_Turbine_Report_WIND_TESTS.rpt');">Generate Report</a><br>
% <tr>18. <a href="matlab:cd([WT_HomeDir '\Local_Solver']);Pitch_Actuation_Hydraulic_Testrig_rt;edit Test_RT_Model;">Improve Simulation Performance With Local Solvers</a><br>
% </style>
% </style>
% </html>
% 
% Copyright 2011 The MathWorks(TM), Inc.

