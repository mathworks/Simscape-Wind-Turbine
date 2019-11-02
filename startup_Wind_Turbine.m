% Copyright 2009-2016 The MathWorks, Inc.
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

if(exist('Libraries/Environment')==7)
    cd Libraries/Environment
    if((exist('+AerodynamicLoads')==7) && ~exist('AerodynamicLoads_Lib'))
        ssc_build AerodynamicLoads
    end
    cd(WT_HomeDir)
end

Wind_Turbine_Parameters
load Actuator_Lookup_data
Wind_Turbine
open('Wind_Turbine_Demo_Script.html')

