function Pitch_Control_Hydraulic_Testrig_setparam(initialtuned)
% Copyright 2017-2018 The MathWorks, Inc.

if strcmp(initialtuned,'Initial')
    evalin('base','Pitch_Kp = 7000;');
    evalin('base','Pitch_Ki = 10;');
elseif strcmp(initialtuned, 'Linear')
    evalin('base','Pitch_Kp = 5.179497061871020e+04;');
    evalin('base','Pitch_Ki = 1.686514883366910e+03;');
else
    evalin('base','Pitch_Kp = 100000;');
    evalin('base','Pitch_Ki = 10;'); 
end
    