% Copyright 2009-2020 The MathWorks, Inc.

PiA_Char = get_param([bdroot '/Nacelle/Pitch System'],'ActiveVariant');
YaA_Char = get_param([bdroot '/Nacelle/Yaw System'],'ActiveVariant');
Hub_Char = get_param([bdroot '/Nacelle/Hub Axis'],'ActiveVariant');
Gea_Char = get_param([bdroot '/Nacelle/Geartrain'],'ActiveVariant');
Gen_Char = get_param([bdroot '/Nacelle/Generator'],'ActiveVariant');

if(length(YaA_Char)<7)
    YaA_Char = 'LockedL';
end

image_str = ['Pi' PiA_Char(1) 'Ya' upper(YaA_Char(7)) 'Hu' Hub_Char(1) 'Ge' Gea_Char(1) 'Gn' Gen_Char(1)];
disp(image_str)
