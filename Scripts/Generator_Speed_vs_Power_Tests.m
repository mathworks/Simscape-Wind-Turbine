% Copyright 2009-2018 The MathWorks(TM), Inc.
k=0,

for i = 10:0.1:18
    k=k+1;
    Final_Speed = i;
    disp(['Run ' k ': Final Speed = ' num2str(i)]);
    sim('Generator_Testrig')
    Generator_Final_Power(k) = Generator_Power_DATA.signals(1,1).values(end);
    Generator_Final_Speed_RPM(k) = Generator_Speed_DATA.signals(1,2).values(end);
    Generator_Final_Speed_pu(k) = Generator_Speed_DATA.signals(1,3).values(end);
end

    
