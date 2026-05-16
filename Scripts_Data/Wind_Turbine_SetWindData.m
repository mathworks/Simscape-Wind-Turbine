function Wind_Turbine_SetWindData(dataname)
% Copyright 2009-2026 The MathWorks, Inc.

sgb_path = 'Wind_Turbine/Turbine Input/Wind/Wind Input';
tri_path = 'Wind_Turbine/Turbine Input';

%[~, ~, ~, groupnames] = signalbuilder(sgb_path);
groupnames = get_param(sgb_path,"options@ActiveScenario");

dataStr = strrep(dataname,' ','_');
desired_active_index = find(strcmp(groupnames,dataStr));

if ~isempty(desired_active_index)
    set_param(sgb_path,"ActiveScenario",dataStr);
    set_param(tri_path,'Name','Turbine Input');
else
    disp(['Unknown wind data set name : ' dataname]);
end
    


 