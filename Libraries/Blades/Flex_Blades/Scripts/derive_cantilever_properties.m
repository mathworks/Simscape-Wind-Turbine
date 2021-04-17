function derivedData = cantilever_init( cantileverData )
% Copyright 2009-2021 The MathWorks(TM), Inc.
L = cantileverData.length;
a = cantileverData.height / 2;
b = cantileverData.width  / 2;

volume = cantileverData.height * cantileverData.width * L;
mass   = volume * cantileverData.material.density ;
principalMoments = (1/3) * mass * [     a^2   + b^2
    L^2/4 + b^2
    a^2   + L^2/4  ];
inertia = diag( principalMoments );
yzyBendingMoment = 4 * b * a^3 / 3;
springConstantAtTip = 3 * cantileverData.material.youngsModulus * yzyBendingMoment / ( L^3 );

derivedData.L                  = L;
derivedData.a                  = a;
derivedData.b                  = b;
derivedData.volume             = volume;
derivedData.mass               = mass;
derivedData.inertia            = inertia;
derivedData.yzyBendingMoment   = yzyBendingMoment;
derivedData.springConstantAtTip = springConstantAtTip;
derivedData.a = a;

% Test with the following
% [a,b,volume,mass,inertia]=cantilever_init( c.length , c.height , c.width , c.material.density )
