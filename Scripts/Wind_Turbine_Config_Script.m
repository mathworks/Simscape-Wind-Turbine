%% Wind Turbine Configurations
%
% <html>
% <span style="font-family:Arial">
% <span style="font-size:10pt">
% <tr><b><u>Example Tasks:</u></b> <a href="matlab:web('Wind_Turbine_Demo_Script.html');">Demo Script</a><br><br>
% <tr><b><u>Subystem Test Configurations:</u></b><br>
% <tr>1. Pitch System: <a href="matlab:Select_Turbine_Systems('I_Pitch Test', WT_Configs);">Ideal</a>, <a href="matlab:Select_Turbine_Systems('H_Pitch Test', WT_Configs);">Hydraulic</a><br>
% <tr>2. Yaw System: <a href="matlab:Select_Turbine_Systems('IA_Yaw Test', WT_Configs);">Ideal Actuator</a>, <a href="matlab:Select_Turbine_Systems('IM_Yaw Test', WT_Configs);">Ideal Motor</a>, <a href="matlab:Select_Turbine_Systems('S_Yaw Test', WT_Configs);">Servomotor</a><br>
% <tr>3. Pitch + Yaw: <a href="matlab:Select_Turbine_Systems('I_Pitch IA_Yaw Test', WT_Configs);">Ideal Actuators</a>, <a href="matlab:Select_Turbine_Systems('H_Pitch S_Yaw Test', WT_Configs);">Detailed Actuators</a><br>
% <tr><br><b><u>Full Turbine Test Configurations:</u></b><br>
% <tr>1. Simple: <a href="matlab:Select_Turbine_Systems('I_Pitch IA_Yaw Ge Lift_Drag', WT_Configs);Wind_Turbine_SetWindData('Start Stop');">Start Stop Wind</a>, <a href="matlab:Select_Turbine_Systems('I_Pitch IA_Yaw Ge Lift_Drag', WT_Configs);Wind_Turbine_SetWindData('High Wind Speed');">High Speed Wind</a><br>
% <tr>2. Detailed: <a href="matlab:Select_Turbine_Systems('H_Pitch S_Yaw Ge Gn Segments', WT_Configs);Wind_Turbine_SetWindData('Start Stop');">Start Stop Wind</a>, <a href="matlab:Select_Turbine_Systems('H_Pitch S_Yaw Ge Gn Segments', WT_Configs);Wind_Turbine_SetWindData('High Wind Speed');">High Speed Wind</a><br>
% <tr><br><b><u>System Inputs:</u></b>  <a href="matlab:Wind_Turbine_SetVariant('Turbine Input','Commands');Wind_Turbine_SetVariant('Main Controller','Direct Input');Wind_Turbine_SetVariant('Blade Load','Torque');Wind_Turbine_SetVariant('Pitch Controller','Inner Loop');">Testing</a>, <a href="matlab:Wind_Turbine_SetVariant('Turbine Input','Wind');Wind_Turbine_SetVariant('Main Controller','Wind Input');Wind_Turbine_SetVariant('Blade Load','Lift and Drag');Wind_Turbine_SetVariant('Pitch Controller','PI on AoA');">Wind</a><br><br>
% <tr><b><u>Systems</u></b><br>
% <table border=1><tr>
% <td>Pitch Actuation: </td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Pitch System','Locked');">Locked</a></td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Pitch System','Ideal');">Ideal</a></td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Pitch System','Hydraulic');">Hydraulic</a></td></tr>
% <td>Yaw Actuation: </td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Yaw System','Locked');">Locked</a></td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Yaw System','Ideal Actuator');">Ideal Actuator</a></td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Yaw System','Ideal Motor');">Ideal Motor</a></td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Yaw System','Servomotor');">Servomotor</a></td></tr>
% <td>Hub Axis: </td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Hub Axis','Locked');">Locked</a></td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Hub Axis','Rotate');">Rotate</a></td></tr>
% <td>Geartrain: </td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Geartrain','Empty');">Empty</a></td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Geartrain','Ideal');">Ideal</a></td></tr>
% <td>Generator: </td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Generator','Simple');">Simple</a></td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Generator','Full');">Full</a></td></tr>
% <td>Blade Load: </td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Blade Load','Lift and Drag');">Lift & Drag</a></td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Blade Load','Lift and Drag Simscape');">Lift & Drag SSC</a></td>
% <td><a href="matlab:Wind_Turbine_SetVariant('Blade Load','Segments');">Segments</a></td></tr>
% </table><br>
% </style>
% </style>
% </html>
% 
% Copyright 2009-2018 The MathWorks(TM), Inc.

