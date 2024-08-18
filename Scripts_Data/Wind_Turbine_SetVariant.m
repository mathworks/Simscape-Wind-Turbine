function Wind_Turbine_SetVariant(system,variant)
% Copyright 2009-2024 The MathWorks, Inc.

mdl = 'Wind_Turbine';
nacelle_sys = [mdl '/Nacelle'];

variant_str = strrep(variant, ' ', '_');
switch system
    case {'Pitch System', 'Yaw System', 'Hub Axis', 'Geartrain', 'Generator'}
        update_sys = [nacelle_sys '/' system];
        set_param(update_sys,'OverrideUsingVariant',variant_str);
        set_param(nacelle_sys,'Name','Nacelle'); % Trigger update of mask icon
    case {'Blade Load', 'Pitch Controller','Main Controller', 'Turbine Input'}
        update_sys = [mdl '/' system];
        set_param(update_sys,'OverrideUsingVariant',variant_str);
    otherwise
        disp(['WT Set Variant: Unknown system ' system]);
end


