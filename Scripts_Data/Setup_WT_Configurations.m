% Copyright 2009-2020 The MathWorks(TM), Inc.

hub_axis_path = char(find_system(gcs,'FollowLinks','on','Name','Hub Axis'));
blade_load_path = char(find_system(gcs,'FollowLinks','on','Name','Blade Load'));
pitch_controller_path = char(find_system(gcs,'FollowLinks','off','Name','Pitch Controller')); % OFF TO CATCH ONLY TOP LEVEL
yaw_controller_path = char(find_system(gcs,'FollowLinks','off','Name','Yaw Controller')); % OFF TO CATCH ONLY TOP LEVEL
main_controller_path = char(find_system(gcs,'FollowLinks','on','Name','Main Controller'));
pitch_system_path = char(find_system(gcs,'FollowLinks','on','Name','Pitch System'));
yaw_system_path = char(find_system(gcs,'FollowLinks','on','Name','Yaw System'));
geartrain_system_path = char(find_system(gcs,'FollowLinks','on','Name','Geartrain'));
generator_system_path = char(find_system(gcs,'FollowLinks','on','Name','Generator'));
turbine_input_path = char(find_system(gcs,'FollowLinks','off','Name','Turbine Input'));

WT_Configs_TBL_COLS  = {'Type'                           'BLADE LOAD'    'GEARTRAIN' 'GENERATOR' 'HUB AXIS' 'TURBINE INPUTS'  'MAIN CONTROLLER' 'PITCH ACTUATOR' 'PITCH CONTROLLER' 'YAW ACTUATOR'   'YAW CONTROLLER' 'SIM_TIME'};
WT_Configs_TABLE{1}  = {'I_Pitch Test'                   'Torque'        'Empty'     'Simple'    'Locked'   'Commands'        'Direct Input'    'Ideal'          'Inner Loop'       'Locked'         'Speed Limit'    15}; % 15
WT_Configs_TABLE{2}  = {'H_Pitch Test'                   'Torque'        'Empty'     'Simple'    'Locked'   'Commands'        'Direct Input'    'Hydraulic'      'Inner Loop'       'Locked'         'Speed Limit'    15}; % 15
WT_Configs_TABLE{3}  = {'IA_Yaw Test'                    'Torque'        'Empty'     'Simple'    'Locked'   'Commands'        'Direct Input'    'Locked'         'Inner Loop'       'Ideal Actuator' 'Speed Limit'    40}; % 40
WT_Configs_TABLE{4}  = {'IM_Yaw Test'                    'Torque'        'Empty'     'Simple'    'Locked'   'Commands'        'Direct Input'    'Locked'         'Inner Loop'       'Ideal Motor'    'Speed Limit'    40}; % 40
WT_Configs_TABLE{5}  = {'S_Yaw Test'                     'Torque'        'Empty'     'Simple'    'Locked'   'Commands'        'Direct Input'    'Locked'         'Inner Loop'       'Servomotor'     'Speed Limit'    40};
WT_Configs_TABLE{6}  = {'I_Pitch IA_Yaw Test'            'Torque'        'Empty'     'Simple'    'Locked'   'Commands'        'Direct Input'    'Ideal'          'Inner Loop'       'Ideal Actuator' 'Speed Limit'    40};
WT_Configs_TABLE{7}  = {'I_Pitch IM_Yaw Test'            'Torque'        'Empty'     'Simple'    'Locked'   'Commands'        'Direct Input'    'Ideal'          'Inner Loop'       'Ideal Motor'    'Speed Limit'    40};
WT_Configs_TABLE{8}  = {'I_Pitch S_Yaw Test'             'Torque'        'Empty'     'Simple'    'Locked'   'Commands'        'Direct Input'    'Ideal'          'Inner Loop'       'Servomotor'     'Speed Limit'    40};
WT_Configs_TABLE{9}  = {'H_Pitch IA_Yaw Test'            'Torque'        'Empty'     'Simple'    'Locked'   'Commands'        'Direct Input'    'Hydraulic'      'Inner Loop'       'Ideal Actuator' 'Speed Limit'    40};
WT_Configs_TABLE{10} = {'H_Pitch IM_Yaw Test'            'Torque'        'Empty'     'Simple'    'Locked'   'Commands'        'Direct Input'    'Hydraulic'      'Inner Loop'       'Ideal Motor'    'Speed Limit'    40};
WT_Configs_TABLE{11} = {'H_Pitch S_Yaw Test'             'Torque'        'Empty'     'Simple'    'Locked'   'Commands'        'Direct Input'    'Hydraulic'      'Inner Loop'       'Servomotor'     'Speed Limit'    40};
WT_Configs_TABLE{12} = {'I_Pitch IA_Yaw Lift_Drag'       'Lift and Drag' 'Empty'     'Simple'    'Rotate'   'Wind'            'Wind Input'      'Ideal'          'PI on AoA'        'Ideal Actuator' 'Speed Limit'    80}; % 80
WT_Configs_TABLE{13} = {'H_Pitch IA_Yaw Lift_Drag'       'Lift and Drag' 'Empty'     'Simple'    'Rotate'   'Wind'            'Wind Input'      'Hydraulic'      'PI on AoA'        'Ideal Actuator' 'Speed Limit'    80};
WT_Configs_TABLE{14} = {'H_Pitch IM_Yaw Lift_Drag'       'Lift and Drag' 'Empty'     'Simple'    'Rotate'   'Wind'            'Wind Input'      'Hydraulic'      'PI on AoA'        'Ideal Motor'    'Speed Limit'    80};
WT_Configs_TABLE{15} = {'H_Pitch S_Yaw Lift_Drag'        'Lift and Drag' 'Empty'     'Simple'    'Rotate'   'Wind'            'Wind Input'      'Hydraulic'      'PI on AoA'        'Servomotor'     'Speed Limit'    80};
WT_Configs_TABLE{16} = {'I_Pitch IA_Yaw Ge Lift_Drag'    'Lift and Drag' 'Ideal'     'Simple'    'Rotate'   'Wind'            'Wind Input'      'Ideal'          'PI on AoA'        'Ideal Actuator' 'Speed Limit'    80};
WT_Configs_TABLE{17} = {'H_Pitch S_Yaw Ge Lift_Drag'     'Lift and Drag' 'Ideal'     'Simple'    'Rotate'   'Wind'            'Wind Input'      'Hydraulic'      'PI on AoA'        'Servomotor'     'Speed Limit'    80};
WT_Configs_TABLE{18} = {'I_Pitch L_Yaw Ge Gn Lift_Drag'  'Lift and Drag' 'Ideal'     'Full'      'Rotate'   'Wind'            'Wind Input'      'Ideal'          'PI on AoA'        'Locked'         'Speed Limit'    70};
WT_Configs_TABLE{19} = {'I_Pitch IA_Yaw Ge Gn Lift_Drag' 'Lift and Drag' 'Ideal'     'Full'      'Rotate'   'Wind'            'Wind Input'      'Ideal'          'PI on AoA'        'Ideal Actuator' 'Speed Limit'    70};
WT_Configs_TABLE{20} = {'H_Pitch S_Yaw Ge Gn Lift_Drag'  'Lift and Drag' 'Ideal'     'Full'      'Rotate'   'Wind'            'Wind Input'      'Hydraulic'      'PI on AoA'        'Servomotor'     'Speed Limit'    70};
WT_Configs_TABLE{21} = {'I_Pitch IA_Yaw Segments'        'Segments'      'Empty'     'Simple'    'Rotate'   'Wind'            'Wind Input'      'Ideal'          'PI on AoA'        'Ideal Actuator' 'Speed Limit'    80};
WT_Configs_TABLE{22} = {'H_Pitch IA_Yaw Segments'        'Segments'      'Empty'     'Simple'    'Rotate'   'Wind'            'Wind Input'      'Hydraulic'      'PI on AoA'        'Ideal Actuator' 'Speed Limit'    80};
WT_Configs_TABLE{23} = {'H_Pitch IM_Yaw Segments'        'Segments'      'Empty'     'Simple'    'Rotate'   'Wind'            'Wind Input'      'Hydraulic'      'PI on AoA'        'Ideal Motor'    'Speed Limit'    80};
WT_Configs_TABLE{24} = {'H_Pitch S_Yaw Segments'         'Segments'      'Empty'     'Simple'    'Rotate'   'Wind'            'Wind Input'      'Hydraulic'      'PI on AoA'        'Servomotor'     'Speed Limit'    80};
WT_Configs_TABLE{25} = {'I_Pitch IA_Yaw Ge Segments'     'Segments'      'Ideal'     'Simple'    'Rotate'   'Wind'            'Wind Input'      'Ideal'          'PI on AoA'        'Ideal Actuator' 'Speed Limit'    80};
WT_Configs_TABLE{26} = {'H_Pitch S_Yaw Ge Segments'      'Segments'      'Ideal'     'Simple'    'Rotate'   'Wind'            'Wind Input'      'Hydraulic'      'PI on AoA'        'Servomotor'     'Speed Limit'    80};
WT_Configs_TABLE{27} = {'I_Pitch L_Yaw Ge Gn Segments'   'Segments'      'Ideal'     'Full'      'Rotate'   'Wind'            'Wind Input'      'Ideal'          'PI on AoA'        'Locked'         'Speed Limit'    70};
WT_Configs_TABLE{28} = {'I_Pitch IA_Yaw Ge Gn Segments'  'Segments'      'Ideal'     'Full'      'Rotate'   'Wind'            'Wind Input'      'Ideal'          'PI on AoA'        'Ideal Actuator' 'Speed Limit'    70};
WT_Configs_TABLE{29} = {'H_Pitch S_Yaw Ge Gn Segments'   'Segments'      'Ideal'     'Full'      'Rotate'   'Wind'            'Wind Input'      'Hydraulic'      'PI on AoA'        'Servomotor'     'Speed Limit'    70};
WT_Configs_TABLE{30} = {'I_Pitch IA_Yaw Ge Lift_Drag W2' 'Lift and Drag' 'Ideal'     'Simple'    'Rotate'   'Wind High Speed' 'Wind Input'      'Ideal'          'PI on AoA'        'Ideal Actuator' 'Speed Limit'    60};


for i=1:length(WT_Configs_TABLE)
    WT_Configs(i).Type = WT_Configs_TABLE{i}{1};
    WT_Configs(i).Blade_Load.choice = WT_Configs_TABLE{i}{2};
    WT_Configs(i).Geartrain.choice = WT_Configs_TABLE{i}{3};
    WT_Configs(i).Generator.choice = WT_Configs_TABLE{i}{4};
    WT_Configs(i).Hub_Axis.choice = WT_Configs_TABLE{i}{5};
    WT_Configs(i).Turbine_Input.choice = WT_Configs_TABLE{i}{6};
    WT_Configs(i).Main_Controller.choice = WT_Configs_TABLE{i}{7};
    WT_Configs(i).Pitch_System.choice = WT_Configs_TABLE{i}{8};
    WT_Configs(i).Pitch_Controller.choice = WT_Configs_TABLE{i}{9};
    WT_Configs(i).Yaw_System.choice = WT_Configs_TABLE{i}{10};
    WT_Configs(i).Yaw_Controller.choice = WT_Configs_TABLE{i}{11};
    WT_Configs(i).Sim_Time = WT_Configs_TABLE{i}{12};
end


for i=1:length(WT_Configs)
    WT_Configs(i).Hub_Axis.path = {hub_axis_path};
    WT_Configs(i).Turbine_Input.path = {turbine_input_path};
    WT_Configs(i).Pitch_System.path = {pitch_system_path};
    WT_Configs(i).Pitch_Controller.path = {pitch_controller_path};
    WT_Configs(i).Yaw_System.path = {yaw_system_path};
    WT_Configs(i).Yaw_Controller.path = {yaw_controller_path};
    WT_Configs(i).Main_Controller.path = {main_controller_path};
    WT_Configs(i).Geartrain.path = {geartrain_system_path};
    WT_Configs(i).Generator.path = {generator_system_path};
    WT_Configs(i).Blade_Load.path = {blade_load_path};
end
