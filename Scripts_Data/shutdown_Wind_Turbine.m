% Copyright 2009-2019 The MathWorks, Inc.
cd(fileparts(which('Wind_Turbine.slx')))
cd(['Libraries' filesep 'Environment']);
    if(exist('+AerodynamicLoads','dir') && exist('AerodynamicLoads_Lib.slx','file'))
        bdclose('AerodynamicLoads_Lib')
        ssc_clean AerodynamicLoads
    end
cd(fileparts(which('Wind_Turbine.slx')))

% Testing for generated code
if(exist(['Libraries' filesep 'Pitch_Controller' filesep 'PCG'],'dir'))
    cd(['Libraries' filesep 'Pitch_Controller' filesep 'PCG']);
    %startup_Pitch_Controller_PCG
    rmpath([pwd '\Scripts_Test_Case_Data_Slides']);
    rmpath([pwd '\DD']);
    rmpath([pwd '\wpi_target']);
    rmpath(pwd);
    cd(fileparts(which('Wind_Turbine.slx')))
end
