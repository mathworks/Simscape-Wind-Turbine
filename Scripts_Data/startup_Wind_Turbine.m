% Copyright 2009-2024 The MathWorks, Inc.
WT_HomeDir = pwd;

curr_proj = simulinkproject;
cd(curr_proj.RootFolder);
cd(['Libraries' filesep 'Environment']);
if(exist('+AerodynamicLoads','dir') && ~exist('AerodynamicLoads_Lib.slx','file'))
    ssc_build AerodynamicLoads
end
cd(curr_proj.RootFolder);

Wind_Turbine_Parameters
load Actuator_Lookup_data

open_start_content = 1;

% If running in a parallel pool
% do not open model or demo script
if(~isempty(ver('parallel')))
    if(~isempty(getCurrentTask()))
        open_start_content = 0;
    end
end

if(open_start_content)
    Wind_Turbine
    web('Wind_Turbine_Demo_Script.html')
end