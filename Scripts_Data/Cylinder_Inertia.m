function [Inertia] = Cylinder_Inertia(length, radius,density,sym_axis)
% Example function for calculating cylinder inertia
% Copyright 2009-2023 The MathWorks(TM), Inc.

mass = density*pi*radius^2*length;
inertia_about_sym_axis = mass*(radius^2)/2;
inertia_perp_sym_axis = mass*((length^2)/12+(radius^2)/4);

Inertia_xx = inertia_perp_sym_axis;
Inertia_yy = inertia_perp_sym_axis;
Inertia_zz = inertia_perp_sym_axis;

if (lower(sym_axis)=='x')
    Inertia_xx = inertia_about_sym_axis;
elseif (lower(sym_axis)=='y')
    Inertia_yy = inertia_about_sym_axis;
elseif(lower(sym_axis)=='z')
    Inertia_zz = inertia_about_sym_axis;
end

Inertia=[Inertia_xx 0 0;0 Inertia_yy 0;0 0 Inertia_zz];     
