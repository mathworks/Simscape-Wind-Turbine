% Copyright 2009-2015 The MathWorks(TM), Inc.
set_param([Model_Name,'/powergui'],'SimulationMode','Discrete');
set_param([Model_Name,'/powergui'],'SampleTime','1e-1');

PhBlock_Path = char(find_system(Model_Name,'Name','pu to MW/MVar'));
SourceBlkHandle = get_param(PhBlock_Path,'Handle');
replace_block(Model_Name,'Handle',SourceBlkHandle,'Generator_Lib/Placeholder_RSIM','noprompt');

