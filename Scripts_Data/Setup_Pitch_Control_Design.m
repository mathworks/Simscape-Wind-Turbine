% Copyright 2009-2021 The MathWorks(TM), Inc.

BlocksToSwitch = 'Pitch Controller';

BlockPath = find_system('Wind_Turbine','FollowLinks','on','Name',BlocksToSwitch);

% GET BLOCK INFO (INSTANCE AND SOURCE)

SourceBlkHandle = get_param(char(BlockPath),'Handle');
TemplateBlk = get_param(char(BlockPath),'TemplateBlock');
slash_ind = findstr(TemplateBlk,'/');
ReplaceBlkFile = TemplateBlk(1:slash_ind);
ReplaceBlkName = get_param(char(BlockPath),'BlockChoice');
ReplaceBlkFull = [ReplaceBlkFile ReplaceBlkName];

% REPLACE BLOCK
replace_block('Wind_Turbine','Handle',SourceBlkHandle,ReplaceBlkFull);
