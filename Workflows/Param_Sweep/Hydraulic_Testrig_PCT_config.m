function Hydraulic_Testrig_PCT_config(mdl,setupclean)
% Copyright 2013-2021 The MathWorks(TM), Inc.

if strcmp(setupclean,'setup')
    set_param([mdl '/SLRT Scope'],'Commented','on');
    set_param(mdl,'SimscapeLogType','none');
    set_param(mdl,'StopTime','6');
    
    set_param([mdl '/Actuator_1/Fixed Orifice A'],'area','PCT_Orifice_Area');
    set_param([mdl '/Actuator_1/Fixed Orifice B'],'area','PCT_Orifice_Area');
    save_system(mdl);
else
    set_param([mdl '/SLRT Scope'],'Commented','off');
    set_param(mdl,'SimscapeLogType','all');
    set_param(mdl,'StopTime','10');
    
    set_param([mdl '/Actuator_1/Fixed Orifice A'],'area','WT_Params.Pitch_Actuator.orifice_area');
    set_param([mdl '/Actuator_1/Fixed Orifice B'],'area','WT_Params.Pitch_Actuator.orifice_area');
    save_system(mdl);
end
