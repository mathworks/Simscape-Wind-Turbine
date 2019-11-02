function Select_Turbine_Systems(WT_Config_Name,WT_Configs)
% Copyright 2009-2015 The MathWorks(TM), Inc.

%Wind_Turbine
%CurrentPath = gcs;
CurrentPath = bdroot;
SlashInd = findstr(CurrentPath,'/');
if(~isempty(SlashInd))
    ModelName = CurrentPath(1:SlashInd(1)-1);
else
    ModelName = gcs;
end

WT_config_index = find(strcmp({WT_Configs.Type},WT_Config_Name));

systems_to_set = setdiff(fieldnames(WT_Configs),{'Type' 'Sim_Time'});

for i=1:length(systems_to_set)
    x = getfield(WT_Configs(WT_config_index),char(systems_to_set(i)));
    %set_param(char(x.path),'BlockChoice',char(x.choice));
    set_param(char(x.path),'OverrideUsingVariant',strrep(char(x.choice),' ','_'));
end

%set_param(ModelName,'StopTime',num2str(WT_Configs(WT_config_index).Sim_Time));
set_param(bdroot,'StopTime',num2str(WT_Configs(WT_config_index).Sim_Time));

% Trigger Update for Nacelle Mask Image
set_param([bdroot '/Nacelle'],'Name','Nacelle')





