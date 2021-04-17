% Copyright 2016-2021 The MathWorks, Inc.

% MAT file containing session
load('ControlSystemDesignerSession_start.mat');

% Updating the operating point
op = ControlSystemDesignerSession.DesignerData.Architecture.Data.OperatingPoints;
ControlSystemDesignerSession.DesignerData.Architecture.Data.OperatingPoints = update(op);
% If needed, here is how to obtain op_snapshot1 
% op_snapshot1 = ControlSystemDesignerSession.DesignerData.Architecture.Data.OperatingPoints

save ControlSystemDesignerSession_start ControlSystemDesignerSession

clear ControlSystemDesignerSession

% MAT file containing session
load('ControlSystemDesignerSession_end.mat');

% Updating the operating point
op = ControlSystemDesignerSession.DesignerData.Architecture.Data.OperatingPoints;
ControlSystemDesignerSession.DesignerData.Architecture.Data.OperatingPoints = update(op);
% If needed, here is how to obtain op_snapshot1 
% op_snapshot1 = ControlSystemDesignerSession.DesignerData.Architecture.Data.OperatingPoints

save ControlSystemDesignerSession_end ControlSystemDesignerSession

clear ControlSystemDesignerSession


% Call controlSystemDesigner with updated OP
%controlSystemDesigner(ControlSystemDesignerSession);
