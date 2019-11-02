function Pitch_Control_Hydraulic_Testrig_setparam(initialtuned)

if strcmp(initialtuned,'Initial')
    evalin('base','Pitch_Kp = 7000;');
    evalin('base','Pitch_Ki = 10;');
elseif strcmp(initialtuned, 'Linear');
    evalin('base','Pitch_Kp = 81684;');
    evalin('base','Pitch_Ki = 3544.6;');
else
    evalin('base','Pitch_Kp = 100000;');
    evalin('base','Pitch_Ki = 10;'); 
end
    