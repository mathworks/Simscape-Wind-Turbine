% Example function for calculating cylinder inertia
% Copyright 2009 The MathWorks(TM), Inc.

function [Inertia] = Rectangular_Block_Inertia(x, y, z, density)

mass = density*x*y*z;

Inertia_xx = 1/12*mass*(y^2+z^2);
Inertia_yy = 1/12*mass*(x^2+z^2);
Inertia_zz = 1/12*mass*(x^2+y^2);

Inertia=[Inertia_xx 0 0;0 Inertia_yy 0;0 0 Inertia_zz];     
