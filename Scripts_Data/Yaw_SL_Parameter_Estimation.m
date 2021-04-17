% Copyright 2009-2021 The MathWorks(TM), Inc.

TurbineInputBlockPath = find_system('Wind_Turbine','Name','Turbine Input');
TurbineInputBlockHandle = get_param(TurbineInputBlockPath,'Handle');
replace_block('Wind_Turbine','Handle',cell2mat(TurbineInputBlockHandle),'Inport');

inportBlockPath = find_system('Wind_Turbine','Name','In1');
inportBlockHandle = get_param(inportBlockPath,'Handle');
replace_block('Wind_Turbine','Handle',cell2mat(inportBlockHandle),'Integrator');

find_system('Wind_Turbine','Handle',cell2mat(inportBlockHandle))
