% FLEXIBLE BODY LUMPED PARAMETER DEFINITION
% Copyright 2009-2025 The MathWorks(TM), Inc.

%-----------------------------------------
% Defined in the block mask
%-----------------------------------------
fBeamElement.material = 'Aluminium 1060 Alloy';

fBeamElement.width  = 5E-2;
fBeamElement.height = 2E-2;

% Beam Length (Total) (m)
fBeamElement.lengthT = 0.5;

% No. of Beam Elements
fBeamElement.NoElms = 10;

% Beam element direction (along X direction it is [1 0 0])
fBeamElement.beamDir = [1 0 0];

% Damping Coeff
fBeamElement.matDamping =49;
%fBeamElement.matDamping =15;

% Tip Load Magnitude (N)
fBeamElement.TipMass = 20;

% Tip Load Magnitude (N)
fBeamElement.TipLoad = -196.2;


%-----------------------------------------
% Calculate the rest...
%-----------------------------------------

% Beam element length (m)
fBeamElement.length = fBeamElement.lengthT/ fBeamElement.NoElms;

% Length of CG vector along length of beam (m)
fBeamElement.cgLeng = fBeamElement.length/2;
%fBeamElement.cgLeng = fBeamElement.length / 4; %Length of each half element

% Get Material Properties
fBeamElement.material = Flexible_Cantilever_Properties_Aluminum1060;

% Calculate the derived properties

% Use another variable to modify
fBeamPassingtoFcn = fBeamElement;
fBeamPassingtoFcn.length = fBeamPassingtoFcn.length/2;
derivedData = derive_cantilever_properties(fBeamPassingtoFcn);


%%%TO COMPARE WITH THEORY, USE MASSLESS BEAM
%fBeamElement.mass = derivedData.mass*0; %Massless beam

%%%THIS VALUE DISTRIBUTES THE MASS ALONG THE CANTILEVER
fBeamElement.mass = derivedData.mass;

fBeamElement.inertia = derivedData.inertia;

%-----------------------------------------
fBeamElement.EI =  fBeamElement.material.youngsModulus * derivedData.yzyBendingMoment;
%-----------------------------------------
