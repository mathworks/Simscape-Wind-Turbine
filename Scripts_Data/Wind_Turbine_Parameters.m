%%% STANDARD CONSTANTS
% Copyright 2009-2022 The MathWorks(TM), Inc.

radps2rpm = (1/(2*pi))*60;
degps2radps = pi/180;

torque_pu2Nm = (1/(2*pi))*60;

% PHYSICAL PARAMETERS
steel_density = 7.85*(100)^3/1000; % kg/m^3
hydr_fluid_density = 961.873; % kg/m^3

%HYDR_BONUS_FACTOR = 0.25*1e-3;

%%% SIMPLE LIFT AND DRAG PARAMETERS
WT_Params.Lift_Drag_Coeff.angle_of_attack = [-12.5 -7.5 -5   -1 0   2    3    6   8   10  12.5 15  16  18  20   25   30  40   50  60  70   80   90  100];
WT_Params.Lift_Drag_Coeff.coeff_lift =      [-1.1 -0.7  -0.5 0  0.2 0.42 0.65 0.9 1.1 1.3 1.4 1.5  1.4 1.2 1.05 1.05 1.0 0.95 0.8 0.6 0.4  0.2  0   0];
WT_Params.Lift_Drag_Coeff.coeff_drag =      [0     0     0   0  0   0    0    0   0   0   0.01 0.02  0.05 0.07 0.15 0.3  0.4 0.7  0.9 1.05 1.15 1.2 1.25 1.3];
WT_Params.Lift_Drag_Coeff.air_density   = 1.22;
WT_Params.Lift_Drag_Coeff.lift_factor = 200;
WT_Params.Lift_Drag_Coeff.drag_factor = 10;
WT_Params.Lift_Drag_Coeff.time_constant = 1e-2;

WT_Params.Air.Density      = 1.22;  % [kg/m^3] (std. day sea-level)
WT_Params.Air.SpeedOfSound = 340;   % [m/s]    (std. day sea-level)


%%% ROTOR DISC AIRFOIL LIFT & DRAG POLAR (based on NACA0015)
WT_Params.Rotor.MaxLiftCoefficent       = 1.4;
WT_Params.Rotor.ParasiteDragCoefficient = 0.0070;
WT_Params.Rotor.InducedDragFactor       = 0.0040;
WT_Params.Rotor.MaxDragCoefficient      = 1.8;


%%% NACA0015 airfoil lift and drag coefficients
txt = importdata( 'naca0015cl.txt', ' ', 30 );
WT_Params.NACA0015.Re = txt.data;

txt = importdata( 'naca0015cl.txt', ' ', 32 );
WT_Params.NACA0015.AoA = txt.data(:,1) /180*pi;
WT_Params.NACA0015.Cl = txt.data(:,end);

txt = importdata( 'naca0015cd.txt', ' ', 32 );
WT_Params.NACA0015.Cd = txt.data(:,end);


%%% TOWER PARAMETERS
WT_Params.Tower.mass = 100;
WT_Params.Tower.inertia = 1000*[100 0 0;0 1 0;0 0 100];
WT_Params.Tower.height = 100;
WT_Params.Tower.base_radius = 2;
WT_Params.Tower.top_radius = 1.15;

%WT_Params.Tower.base_radius = 0;
%WT_Params.Tower.top_radius = 0;

%%% BLADE PARAMETERS
WT_Params.Blade.mass = 6600;
WT_Params.Blade.inertia= 100*[100 0 0;0 1 0;0 0 100];
%WT_Params.Blade.inertia = Rectangular_Block_Inertia(1.5,20,3.4,0.001*steel_density);
WT_Params.Blade.inertia = 1.0e+004*[2.7461 0 0;0 0.0921 0;0 0 2.6840];
WT_Params.Blade.length = 40;
WT_Params.Blade.width = 2;
WT_Params.Blade.damping = 1000;

WT_Params.Blade.Actuator_Offset.x = 0;
WT_Params.Blade.Actuator_Offset.y = -0.1;
WT_Params.Blade.Actuator_Offset.z = 0.5;

WT_Params.Blade.Geometry.root_radius = 0.6;
WT_Params.Blade.Geometry.ctr_to_leading_edge.z = 1.2;
WT_Params.Blade.Geometry.ctr_to_leading_edge.x = 0;
WT_Params.Blade.Geometry.ctr_to_a1.z = 1;
WT_Params.Blade.Geometry.ctr_to_a1.x = 0.4;
WT_Params.Blade.Geometry.ctr_to_a2.z = 1;
WT_Params.Blade.Geometry.ctr_to_a2.x = -0.45;
WT_Params.Blade.Geometry.ctr_to_b1.z = 0.75;
WT_Params.Blade.Geometry.ctr_to_b1.x = 0.7;
WT_Params.Blade.Geometry.ctr_to_b2.z = 0.75;
WT_Params.Blade.Geometry.ctr_to_b2.x = -0.7;
WT_Params.Blade.Geometry.ctr_to_c1.z = 0.3;
WT_Params.Blade.Geometry.ctr_to_c1.x = 0.8;
WT_Params.Blade.Geometry.ctr_to_d1.z = -0.6;
WT_Params.Blade.Geometry.ctr_to_d1.x = 0.55;
WT_Params.Blade.Geometry.ctr_to_e1.z = 0.2;
WT_Params.Blade.Geometry.ctr_to_e1.x = 0;
WT_Params.Blade.Geometry.ctr_to_trailing_edge.z = -2.2;
WT_Params.Blade.Geometry.ctr_to_trailing_edge.x = -0.7;
WT_Params.Blade.Geometry.scaling_tip = 0.5;


%%% ROTOR PARAMETERS
WT_Params.Rotor.mass = 8500;
WT_Params.Rotor.inertia= 10*[1 0 0;0 10 0;0 0 1];
WT_Params.Rotor.radius = 2;
WT_Params.Rotor.Geometry.length = 1.6*WT_Params.Rotor.radius;
WT_Params.Rotor.Pitch_Actuator_Offset.x = 1.2*WT_Params.Rotor.radius;
WT_Params.Rotor.Pitch_Actuator_Offset.y = WT_Params.Rotor.radius+WT_Params.Blade.Actuator_Offset.y;
WT_Params.Rotor.Pitch_Actuator_Offset.z = 0.5;
WT_Params.Rotor.Pitch_Actuator_Offset.radius = 1.8;
WT_Params.Rotor.Pitch_Actuator_Offset.angle = 15*0;  % CHANGED FOR JOINT TEST 
WT_Params.Rotor.damping = 100;

WT_Params.Rotor.nominal_rpm = 14.3004;  %RPM
WT_Params.Rotor.min_rpm = WT_Params.Rotor.nominal_rpm*0.95;  %RPM
WT_Params.Rotor.max_rpm = WT_Params.Rotor.nominal_rpm*1.05;  %RPM
%WT_Params.Rotor.Geometry.Profile = SRev_Data_Ellipse(WT_Params.Rotor.radius*1.3,WT_Params.Rotor.Geometry.length*1.7,0,90);
WT_Params.Rotor.Geometry.Profile = Extr_Data_Ellipse(WT_Params.Rotor.radius*1.3,WT_Params.Rotor.Geometry.length*1.7,0,90,0);

%%% GEARTRAIN PARAMETERS
WT_Params.Geartrain.mass = 23000;
WT_Params.Geartrain.Gear_Ratio.first_step = 4;
WT_Params.Geartrain.Gear_Ratio.planetary = 5;
WT_Params.Geartrain.Planetary.viscous_losses = [0.1 0.1]*0;
WT_Params.Geartrain.Gear_Ratio.second_step_primary_generator = 3.5125;
WT_Params.Geartrain.inertia_carrier_shaft = 10;
WT_Params.Geartrain.inertia_sun_shaft = 10;
WT_Params.Geartrain.inertia_first_step_shaft = 10;
WT_Params.Geartrain.Solver_Consistency_Tolerance = 1e-9;
WT_Params.Geartrain.MSLD_Interface_TF_Coeff = 1e-4;
WT_Params.Empty_Geartrain.inertia = 1e-1;
WT_Params.Empty_Geartrain.damping = 1e-1;
WT_Params.Geartrain.MSLD_Interface_Filter_Coeff = 0.001;

%%% PITCH CONTROLLER PARAMETERS, INNER LOOP
WT_Params.Pitch_Controller.P_Gain = 100000;
WT_Params.Pitch_Controller.I_Gain = 10;
WT_Params.Pitch_Controller.D_Gain = 0.1;
WT_Params.Pitch_Actuator.hydraulic_actuator_scale_factor = 6.2500e-010;
WT_Params.Pitch_Actuator.ideal_actuator_scale_factor = 4.7;



% OUTER LOOP -- BLOCKS IN LIGHT GRAY BENEATH MAGENTA BLOCK
WT_Params.Pitch_Controller.Angle_Of_Attack.P_Gain = 20;
WT_Params.Pitch_Controller.Angle_Of_Attack.I_Gain = 5;
WT_Params.Pitch_Controller.Angle_Of_Attack.D_Gain = 200;
WT_Params.Pitch_Controller.Angle_Of_Attack.max_angle = 10.26;

WT_Params.Pitch_Controller.emergency_brake_pitch_angle = -95;
WT_Params.Pitch_Controller.park_pitch_angle = 0;

WT_Params.Pitch_Controller.Angle_Of_Attack.max_lift = 15;
WT_Params.Pitch_Controller.Angle_Of_Attack.enough_lift = 10;
WT_Params.Pitch_Controller.Angle_Of_Attack.stall = 25;


%%% PITCH ACTUATOR PARAMETERS
WT_Params.Pitch_Actuator.hydraulic_pressure = 2e7;

WT_Params.Pitch_Actuator.hydraulic_tf_coeff = 0.0001;

WT_Params.Pitch_Actuator.Servo.gain = 20;
WT_Params.Pitch_Actuator.Servo.time_constant = 0.002;
WT_Params.Pitch_Actuator.Servo.saturation = 0.3;
WT_Params.Pitch_Actuator.servo2valve_conversion = 0.25*1e-3;


WT_Params.Pitch_Actuator.Valve.max_area = 5e-03;
WT_Params.Pitch_Actuator.Valve.max_opening = 0.003;
WT_Params.Pitch_Actuator.Valve.leakage_area = 1e-12;
WT_Params.Pitch_Actuator.Valve.initial_opening_pa = 0;
WT_Params.Pitch_Actuator.Valve.initial_opening_at = 0;
WT_Params.Pitch_Actuator.Valve.initial_opening_pb = WT_Params.Pitch_Actuator.Valve.initial_opening_pa;
WT_Params.Pitch_Actuator.Valve.initial_opening_bt = WT_Params.Pitch_Actuator.Valve.initial_opening_at;

WT_Params.Pitch_Actuator.Cylinder.damping = 500;
WT_Params.Pitch_Actuator.Cylinder.piston_area = 0.005;
WT_Params.Pitch_Actuator.Cylinder.stroke = 1.4967; 
WT_Params.Pitch_Actuator.Cylinder.initial_disp_from_a = 0.4450;
WT_Params.Pitch_Actuator.Cylinder.contact_stiffness = 1e7;
WT_Params.Pitch_Actuator.Cylinder.contact_damping = 850;
WT_Params.Pitch_Actuation.Rotor_Connection.damping = 10000;

WT_Params.Pitch_Actuator.Geometry.outer_radius = 0.1;
WT_Params.Pitch_Actuator.Geometry.inner_radius = 0.03;

WT_Params.Pitch_Actuator.orifice_area = 1e-03;
PCT_Orifice_Area =  WT_Params.Pitch_Actuator.orifice_area;

WT_Params.Pitch_Actuator.Sensor.initial_position = 0;

WT_Params.Pitch_Actuator.Accumulator.capacity = 0.1;
WT_Params.Pitch_Actuator.Accumulator.preload_pressure = 1.5e7; % Pa
WT_Params.Pitch_Actuator.Accumulator.maximum_pressure = 2.5e7; % Pa
WT_Params.Pitch_Actuator.Accumulator.initial_volume = 0.1;
WT_Params.Pitch_Actuator.Emergency_Pitch_Valve.max_area = 5e-05;

WT_Params.Pitch_Actuator.constraint_tol = 1e-9;

WT_Params.Pitch_Actuator.cylinder_length = 0.8*WT_Params.Rotor.radius;
WT_Params.Pitch_Actuator.cylinder_inertia =[1.0358 0 0;0 39.1912 0;0 0 39.1912];
WT_Params.Pitch_Actuator.cylinder_mass = 207.1681;
WT_Params.Pitch_Actuator.rod_inertia = [0.0757 0 0;0 13.9908 0;0 0 13.9908];
WT_Params.Pitch_Actuator.rod_mass = 74.7445;

WT_Params.Pitch_Actuator.ideal_actuator_time_constant = 1e-1;
%WT_Params.Pitch_Actuator.ideal_actuator_time_constant = 1e-2;
WT_Params.Pitch_Actuator.hydraulic_actuator_time_constant = 1e-1;


%%% GENERATOR PARAMETERS
WT_Params.Generator.mass = 8500;
WT_Params.Generator.nominal_power = 1.65e6/0.9;
WT_Params.Generator.voltage = 600;
WT_Params.Generator.frequency = 60;
WT_Params.Generator.Stator.resistance = 0.004843;   % PER UNIT
WT_Params.Generator.Stator.inductance = 0.1248;     % PER UNIT
WT_Params.Generator.Rotor.resistance = 0.004377;    % PER UNIT
WT_Params.Generator.Rotor.inductance = 0.1791;      % PER UNIT
WT_Params.Generator.mutual_inductance = 6.77;       % PER UNIT
WT_Params.Generator.poles = 6;
WT_Params.Generator.Simple.damping = 20;
WT_Params.Generator.Simple.inertia = 250;
WT_Params.Generator.generator_time_constant = 0.01;
WT_Params.Generator.PSLD_Interface_Filter_Coeff = 0.001;


WT_Params.Transformer.mass = 8000;
WT_Params.Transformer.rated_power = 3.16e6;

WT_Params.Generator.Breakers.ron = 0.001;
WT_Params.Generator.Breakers.rp = 1e6;  %OHMS
WT_Params.Generator.Breakers.cp = 1e9;  %FARADS

WT_Params.Generator.radps2pu = (1/(2*pi*WT_Params.Generator.frequency/(WT_Params.Generator.poles/2)));
WT_Params.Generator.torque_pu2Nm = WT_Params.Generator.nominal_power/(WT_Params.Generator.frequency*2*pi/(WT_Params.Generator.poles/2));


%%% GRID PARAMETERS
WT_Params.Grid.voltage = 25e3;
WT_Params.Grid.frequency = WT_Params.Generator.frequency;


%%% BRAKE PARAMETERS
WT_Params.Brakes.stiffness = 0;
WT_Params.Brakes.damping = 1e6*10*1e-2;
WT_Params.Brakes.torque_radius = 1;
WT_Params.Brakes.peak_normal_force = 1e5*10;
WT_Params.Brakes.engagement_threshold = 1e-1;
WT_Params.Brakes.inertia_housing = 1e5*10;
%WT_Params.Brakes.inertia_housing = 10;
WT_Params.Brakes.piston_area = 10*10;
WT_Params.Brakes.threshold_pressure = 100;
WT_Params.Brakes.kinetic_friction_coeff = 0.7;
WT_Params.Brakes.static_friction_coeff = 0.8;
WT_Params.Brakes.num_friction_surfaces = 4;

% CHANGES -- FEB 21
WT_Params.Brakes.clutch_vel_tol = 0.001;
%WT_Params.Brakes.clutch_vel_tol = 1;

%%% YAW ACTUATOR PARAMETERS
WT_Params.Yaw_Actuator.inertia_motor_shaft = 0.01;
WT_Params.Yaw_Actuator.inertia_carrier = 0.01;
WT_Params.Yaw_Actuator.p_gear_rato_step_1 = 5;
WT_Params.Yaw_Actuator.p_gear_rato_step_2 = 4.5;
WT_Params.Yaw_Actuator.p_gear_rato_step_3 = 4;
WT_Params.Yaw_Actuator.p_gear_rato_step_4 = 3;
WT_Params.Yaw_Actuator.yaw_gear_diameter = 0.368;
WT_Params.Yaw_Actuator.yaw_gear_thickness = 0.1;
WT_Params.Yaw_Actuator.Gearbox_Flexibility.stiffness = 1e5;
WT_Params.Yaw_Actuator.Gearbox_Flexibility.damping = 1e7;
WT_Params.Yaw_Actuator.damping = 100000;
WT_Params.Yaw_Actuator.MSLD_Interface_TF_Coeff = 1e-1;
WT_Params.Yaw_Actuator.MSLD_Interface_Filter_Coeff = 0.001;

WT_Params.Yaw_Actuator.yaw_ring_diameter = 2.3;
WT_Params.Yaw_Actuator.yaw_ring_thickness = 0.1;

WT_Params.Yaw_Actuator.Motor.max_torque_vector=[900 800 700 0];    %RPM
WT_Params.Yaw_Actuator.Motor.max_speed_vector=[0 600 1200 1410];  %Nm

WT_Params.Yaw_Actuator.Motor.control_time_constant = 0.02*0.01; %s
WT_Params.Yaw_Actuator.Motor.resistance = 3.5; %Ohm
WT_Params.Yaw_Actuator.Motor.damping = 10; %Nm/(rad/s)
WT_Params.Yaw_Actuator.Motor.voltage = 480; %V
WT_Params.Yaw_Actuator.Motor.filter_constant = 1e-2; %s

WT_Params.Yaw_Actuator.Ideal.scaling_factor = 2;

WT_Params.Yaw_Actuator.max_yaw_rate = 0.5;  %deg/sec

WT_Params.Yaw_Actuator.ideal_actuator_time_constant = 1e-1;



%%% YAW CONTROLLER PARAMETERS
WT_Params.Yaw_Controller.P_Gain = 1;
WT_Params.Yaw_Controller.I_Gain = 0.01;
WT_Params.Yaw_Controller.D_Gain = 0.001;
WT_Params.Yaw_Controller.Yaw_Rate.P_Gain = 3000;
WT_Params.Yaw_Controller.Yaw_Rate.I_Gain = 10;


%%% NACELLE PARAMETERS
WT_Params.Nacelle.mass = 68000 - WT_Params.Rotor.mass + WT_Params.Geartrain.mass + WT_Params.Transformer.mass;
WT_Params.Nacelle.inertia = 100*[10 0 0;0 1 0;0 0 10];
WT_Params.Nacelle.length = 13;
WT_Params.Nacelle.CG_Offset.x = 5;
WT_Params.Nacelle.CG_Offset.y = 0;
WT_Params.Nacelle.CG_Offset.z = 0;
WT_Params.Nacelle.Yaw_Ctr_Offset.x = 7;
WT_Params.Nacelle.Yaw_Ctr_Offset.y = 3;
WT_Params.Nacelle.Yaw_Ctr_Offset.z = 0;
WT_Params.Nacelle.damping = 1e6;

%%% NACELLE GEOMETRY
WT_Params.Nacelle.chamfer = 1;
%{
width = WT_Params.Nacelle.Yaw_Ctr_Offset.y;
chamfer = WT_Params.Nacelle.chamfer;
xyset1 = [width-chamfer width;-width+chamfer width];
xyset2 = [Extr_Data_Ring(chamfer,0,91,179)];
xyset2(:,1) = xyset2(:,1)+(-width+chamfer);
xyset2(:,2) = xyset2(:,2)+(width-chamfer);
xyset3 = [-width -chamfer+width;-width -width+chamfer];
xyset4 = [Extr_Data_Ring(chamfer,0,181,269)];
xyset4(:,1) = xyset4(:,1)+(-width+chamfer);
xyset4(:,2) = xyset4(:,2)+(-width+chamfer);
xyset5 = [-width+chamfer -width;width-chamfer -width];
xyset6 = [Extr_Data_Ring(chamfer,0,271,359)];
xyset6(:,1) = xyset6(:,1)+(width-chamfer);
xyset6(:,2) = xyset6(:,2)+(-width+chamfer);
xyset7 = [width -width+chamfer;width width-chamfer];
xyset8 = [Extr_Data_Ring(chamfer,0,1,89)];
xyset8(:,1) = xyset8(:,1)+(width-chamfer);
xyset8(:,2) = xyset8(:,2)+(width-chamfer);

WT_Params.Nacelle.Geometry.profile = [xyset1; xyset2; xyset3; xyset4; xyset5; xyset6; xyset7; xyset8];
%}

WT_Params.Nacelle.Geometry.profile = Extr_Data_BoxFillet(...
    WT_Params.Nacelle.Yaw_Ctr_Offset.y*2,...
    WT_Params.Nacelle.Yaw_Ctr_Offset.y*2,...
    WT_Params.Nacelle.chamfer);

%%% MAIN CONTROLLER PARAMETERS
WT_Params.Main_Controller.wind_speed_cut_in_lower = 4;      %m/s
WT_Params.Main_Controller.wind_speed_cut_out = 20;          %m/s, 
WT_Params.Main_Controller.wind_speed_cut_in_upper = 18;     %m/s, 
WT_Params.Main_Controller.wind_speed_average_period = 600;  %WIND SPEED AVERAGE PERIOD, SECONDS
WT_Params.Main_Controller.turbine_speed_cut_in = 1200;      %RPM
WT_Params.Main_Controller.turbine_speed_cut_out = 2200;     %RPM
WT_Params.Main_Controller.turbine_speed_cut_out = 2200;     %RPM
WT_Params.Main_Controller.turbine_speed_park = 5;           %RPM

WT_Params.Main_Controller.sample_time = 0.01;               %s


%%% ENVIRONMENT PARAMETERS
WT_Params.Environment.Simple_Lift_And_Drag.AL_Dynamics = 1e-1;

%%% NEW BLADE GEOMETRY
WT_Params.Blade.Geometry.LF_Tri = [0 0;WT_Params.Blade.length/4  WT_Params.Blade.Geometry.ctr_to_trailing_edge.z;WT_Params.Blade.length/4 WT_Params.Blade.Geometry.ctr_to_leading_edge.z];
WT_Params.Blade.Geometry.UF_Tri = [0 0;0  WT_Params.Blade.Geometry.ctr_to_trailing_edge.z;WT_Params.Blade.length*3/4 0;0 WT_Params.Blade.Geometry.ctr_to_leading_edge.z];

WT_Params.Blade.Geometry.LR_Tri = [0 0;WT_Params.Blade.length/4  WT_Params.Blade.Geometry.ctr_to_trailing_edge.z*1.2;WT_Params.Blade.length/4 WT_Params.Blade.Geometry.ctr_to_leading_edge.z*0.63];
WT_Params.Blade.Geometry.UR_Tri = [0 0;WT_Params.Blade.length*3/4 WT_Params.Blade.Geometry.ctr_to_trailing_edge.z*0.9; WT_Params.Blade.length*0.752 WT_Params.Blade.Geometry.ctr_to_leading_edge.z*1.15];

WT_Params.Blade.Geometry.Lower_Leading_Edge_Cone = [0 0;WT_Params.Blade.Geometry.ctr_to_leading_edge.z*0.96 WT_Params.Blade.length/4;0 WT_Params.Blade.length/4];
WT_Params.Blade.Geometry.Upper_Leading_Edge_Cone = [0 0;WT_Params.Blade.Geometry.ctr_to_leading_edge.z*0.92 WT_Params.Blade.length*0.752;0 WT_Params.Blade.length*0.752];

