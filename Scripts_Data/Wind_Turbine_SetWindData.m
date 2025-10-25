function Wind_Turbine_SetWindData(dataname)
% Copyright 2009-2025 The MathWorks, Inc.

sgb_path = 'Wind_Turbine/Turbine Input/Wind/Wind Input';
tri_path = 'Wind_Turbine/Turbine Input';

[~, ~, ~, groupnames] = signalbuilder(sgb_path);

desired_active_index = find(strcmp(groupnames,dataname));

if ~isempty(desired_active_index)
    signalbuilder(sgb_path,'activegroup',desired_active_index);
    set_param(tri_path,'Name','Turbine Input');
else
    disp(['Unknown wind data set name : ' dataname]);
end
    


 