% Copyright 2013-2023 The MathWorks, Inc.
TempSimSettings = SimSettings;
Temppool = gcp;
Temppoolsize = Temppool.NumWorkers;

for i = 1:Temppoolsize
    TempSimSettings{i}.StopTime = '0.01';
end

parfor i = 1:Temppoolsize
    out{i} = sim(mdl, TempSimSettings{i});
end
