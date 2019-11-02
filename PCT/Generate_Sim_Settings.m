function [simCmdParamValStructs] = Generate_Sim_Settings(param_vals,param_name,rtp)
% Copyright 2009-2018 The MathWorks(TM), Inc.

numParamSets = length(param_vals);

% Create parameter sets:
paramSets = cell(1, numParamSets);
for k = 1:numParamSets
    paramSets{k} = ...
        Simulink.BlockDiagram.modifyTunableParameters(rtp, ...
        param_name,param_vals(k));
end

%% Step 5: Create SIM Command Argument Sets

numSimCmdArgStructs = numParamSets;
simCmdParamValStructs = cell(1, numSimCmdArgStructs);

%paramValStruct.SaveTime = 'on';
%paramValStruct.SaveOutput = 'on';
%paramValStruct.LoadExternalInput = 'on';
% 'externalInput' is the name of the base workspace variable of
% the MATLAB worker sessions containing the external inputs data
%paramValStruct.ExternalInput = 'externalInput';
paramValStruct.RapidAcceleratorUpToDateCheck = 'off';
paramValStruct.RapidAcceleratorParameterSets = [];
paramValStruct.SimulationMode = 'rapid';

for paramSetsIdx = 1:numParamSets
    simCmdParamValStructs{paramSetsIdx} = paramValStruct;
    simCmdParamValStructs{paramSetsIdx}.RapidAcceleratorParameterSets = ...
        paramSets{paramSetsIdx};
end
