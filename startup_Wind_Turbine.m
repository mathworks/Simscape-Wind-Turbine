% Copyright 2012-2015 The MathWorks(TM), Inc.
WT_HomeDir = pwd;
addpath(pwd);
addpath([pwd '\Libraries']);
addpath([pwd '\Libraries\Blades']);
addpath([pwd '\Libraries\Brakes']);
addpath([pwd '\Libraries\Environment']);
addpath([pwd '\Libraries\Geartrain']);
addpath([pwd '\Libraries\Generator']);
addpath([pwd '\Libraries\Main_Controller']);
addpath([pwd '\Libraries\Nacelle']);
addpath([pwd '\Libraries\Pitch_Actuation']);
addpath([pwd '\Libraries\Pitch_Controller']);
addpath([pwd '\Libraries\Tower']);
addpath([pwd '\Libraries\Yaw_Actuation']);
addpath([pwd '\Libraries\Yaw_Controller']);
addpath([pwd '\Scripts']);
addpath([pwd '\Scripts\Slide_Prep']);
addpath([pwd '\Reports']);
addpath([pwd '\Images']);
addpath([pwd '\Images\Nacelle']);
addpath([pwd '\PCT']);

if(exist('PCT')==7)
    cd PCT
    if((exist('+Hydraulic')==7) && ~exist('Hydraulic_Lib'))
        ssc_build Hydraulic
    end
    cd(WT_HomeDir)
end

if(exist('Libraries/Environment')==7)
    cd Libraries/Environment
    if((exist('+AerodynamicLoads')==7) && ~exist('AerodynamicLoads_Lib'))
        ssc_build AerodynamicLoads
    end
    cd(WT_HomeDir)
end

% FOR GENERATED CODE PORTION
%cd Libraries\Pitch_Controller\PCG
%startup_Pitch_Controller_PCG
%cd(WT_HomeDir)

Wind_Turbine_Parameters
load Actuator_Lookup_data
Wind_Turbine
open('Wind_Turbine_Demo_Script.html')

