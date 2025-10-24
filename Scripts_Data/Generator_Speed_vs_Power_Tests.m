% Copyright 2009-2024 The MathWorks(TM), Inc.
k=0;
open_system('Generator_Testrig')

for i = 10:1:18
    k=k+1;
    Final_Speed = i;
    disp(['Run ' num2str(k) ': Final Speed = ' num2str(i)]);
    sim('Generator_Testrig')
    Generator_Final_Power(k) = Generator_Power_DATA.signals.values(end,2);
    Generator_Final_Speed_RPM(k) = Generator_Speed_DATA.signals.values(end,2);
    Generator_Final_Speed_pu(k) = Generator_Speed_DATA.signals.values(end,3);
end

    
