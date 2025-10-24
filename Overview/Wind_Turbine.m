%% Wind Turbine Model with Simscape
% 
% <<Wind_Turbine_Overview_640x360.png>>
%
% This example models a wind turbine with pitch actuators, yaw actuators,
% geartrain, and generator.  The fidelity level of each system can be adjusted 
% so that it is suitable for the test being performed.  Systems can be
% locked if they are not in use to reduce the amount of computation and
% enable targeted testing.
% 
% Copyright 2009-2025 The MathWorks, Inc.

%% Model
%
% The wind turbine model includes the tower, blades, blade loads due to wind,
% electric grid, and supervisory control.
%
% <matlab:open_system('Wind_Turbine'); Open Model>

open_system('Wind_Turbine')
set_param(bdroot,'LibraryLinkDisplay','none')
ann_h = find_system('Wind_Turbine','MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures');
for anhi=1:length(ann_h)
    set_param(ann_h(anhi),'Interpreter','off');
end

Wind_Turbine_SetVariant('Pitch System','Hydraulic');
Wind_Turbine_SetVariant('Yaw System','Servomotor');
Wind_Turbine_SetVariant('Hub Axis','Rotate');
Wind_Turbine_SetVariant('Geartrain','Ideal');
Wind_Turbine_SetVariant('Generator','Full');
set_param(bdroot,'SimulationCommand','update')

%% Nacelle Subsystem
%
% The nacelle houses the main subsystems of the wind turbine.  The fidelity
% level of each system can be adjusted using Variant Subsystems.  Ideal
% actuators can be used to assess actuator requirements.  Systems that are
% not used can be locked to reduce computational requirements and simplify
% analysis of the results.
%
% <matlab:open_system('Wind_Turbine');open_system('Wind_Turbine/Nacelle','force'); Open Subsystem>

open_system('Wind_Turbine/Nacelle','force');


%% Pitch Actuation
%
% A hydraulic network is used to model the blade pitch actuation system. A
% hydraulic valve controls the flow of fluid to a cylinder that extends or
% contracts to control the pitch of the blade.  The pressure supply is
% assumed steady.  In the event of a power failure to this system, valves
% will open that enable a spring-loaded accumulator to force the blades to
% a position that will stop the wind turbine.
%
% <matlab:open_system('sm_wheel_loader');open_system('Wind_Turbine/Nacelle/Pitch%20System/Hydraulic/Hydraulic/Actuator_1','force'); Open Subsystem>

open_system('Wind_Turbine/Nacelle/Pitch System/Hydraulic/Hydraulic/Actuator_1','force');

%% Yaw Actuation
%
% An electric motor and geartrain serve as the actuation system to orient
% the nacelle in the desired direction.  The electric motor is
% parameterized with a torque-speed curve and the gearbox is modeled as a
% series of planetary gears to achieve the necessary gear reduction.  Four
% motors are used to orient the nacelle.
%
% <matlab:open_system('sm_wheel_loader');open_system('Wind_Turbine/Nacelle/Yaw%20System/Servomotor/Yaw%20Motor%201','force'); Open Subsystem>

open_system('Wind_Turbine/Nacelle/Yaw System/Servomotor/Servomotor/Yaw Motor 1','force');

%% Generator Subsystem
%
% The generator is modeled with an induction machine which is connected to
% electrical loads and a transformer. The generator can be disconnected
% from the grid using switches which are opened by the supervisory
% controller. A flexible shaft connects the generator to the geartrain.
% The compliance in the shaft is used to separate the mechanical and the
% electrical networks so that they can be simulated using different
% techniques.  An abstract mathematical formulation is used to model
% the grid, avoiding the high frequency sinusoidal signals and enabling the
% simulation to run much faster.
%
% <matlab:open_system('sm_wheel_loader');open_system('Wind_Turbine/Nacelle/Generator/Full','force'); Open Subsystem>

open_system('Wind_Turbine/Nacelle/Generator/Full','force');

%% Simulation Results: High Fidelity, Start-Stop Test
%%
%
% The results below come from a simulation test where the turbine starts at
% rest, accelerates to operating speed, orients itself to point at the
% wind, and shuts down.
%

Select_Turbine_Systems('H_Pitch S_Yaw Ge Lift_Drag', WT_Configs);
Wind_Turbine_SetWindData('Start Stop');
sim('Wind_Turbine');

Wind_Turbine_plot1pitch
Wind_Turbine_plot3pitchActuation(simlog_Wind_Turbine.Nacelle.Pitch_System.Hydraulic.Hydraulic.Actuator_1)
Wind_Turbine_plot2yaw

%%

close all
bdclose('Wind_Turbine');
