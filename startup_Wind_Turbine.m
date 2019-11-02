% Copyright 2009-2019 The MathWorks, Inc.
WT_HomeDir = pwd;
addpath(pwd);
addpath([pwd filesep 'Libraries']);
addpath([pwd filesep 'Libraries' filesep 'Blades']);
addpath([pwd filesep 'Libraries' filesep 'Brakes']);
addpath([pwd filesep 'Libraries' filesep 'Environment']);
addpath([pwd filesep 'Libraries' filesep 'Geartrain']);
addpath([pwd filesep 'Libraries' filesep 'Generator']);
addpath([pwd filesep 'Libraries' filesep 'Main_Controller']);
addpath([pwd filesep 'Libraries' filesep 'Nacelle']);
addpath([pwd filesep 'Libraries' filesep 'Pitch_Actuation']);
addpath([pwd filesep 'Libraries' filesep 'Pitch_Controller']);
addpath([pwd filesep 'Libraries' filesep 'Tower']);
addpath([pwd filesep 'Libraries' filesep 'Yaw_Actuation']);
addpath([pwd filesep 'Libraries' filesep 'Yaw_Controller']);
addpath([pwd filesep 'Scripts']);
addpath([pwd filesep 'Scripts' filesep 'Slide_Prep']);
addpath([pwd filesep 'Reports']);
addpath([pwd filesep 'Images']);
addpath([pwd filesep 'Images' filesep 'Nacelle']);
addpath([pwd filesep 'PCT']);

if(exist(['Libraries' filesep 'Environment'])==7)
    cd(['Libraries' filesep 'Environment']);
    if((exist('+AerodynamicLoads')==7) && ~exist('AerodynamicLoads_Lib'))
        ssc_build AerodynamicLoads
    end
    cd(WT_HomeDir)
end

% Testing for generated code
if(exist(['Libraries' filesep 'Pitch_Controller' filesep 'PCG'])==7)
    addpath([pwd filesep 'Libraries' filesep 'Pitch_Controller' filesep 'PCG']);
    cd(['Libraries' filesep 'Pitch_Controller' filesep 'PCG']);
    startup_Pitch_Controller_PCG
    cd(WT_HomeDir)
end

Wind_Turbine_Parameters
load Actuator_Lookup_data
Wind_Turbine
open('Wind_Turbine_Demo_Script.html')

