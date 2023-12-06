% Copyright 2009-2023 The MathWorks, Inc.
cd(fileparts(which('Wind_Turbine.slx')))
cd(['Libraries' filesep 'Environment']);
    if(exist('+AerodynamicLoads','dir') && exist('AerodynamicLoads_Lib.slx','file'))
        bdclose('AerodynamicLoads_Lib')
        bdclose('Wind_Turbine')
        ssc_clean AerodynamicLoads
    end
cd(fileparts(which('Wind_Turbine.slx')))

% If parameter sweep plot still open, close it
try close(h4_wind_turbine_pct),end
clear h4_wind_turbine_pct
