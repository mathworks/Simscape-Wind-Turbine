% Copyright 2009-2024 The MathWorks(TM), Inc.

BlockPath = 'Wind_Turbine/Pitch Controller';

% GET BLOCK INFO (INSTANCE AND SOURCE)

SourceBlkHandle = get_param(char(BlockPath),'Handle');
TemplateBlk = get_param(char(BlockPath),'TemplateBlock');
slash_ind = findstr(TemplateBlk,'/');
ReplaceBlkFile = TemplateBlk(1:slash_ind);
ReplaceBlkName = get_param(char(BlockPath),'BlockChoice');
ReplaceBlkFull = [ReplaceBlkFile ReplaceBlkName];

% REPLACE BLOCK
replace_block('Wind_Turbine','Handle',SourceBlkHandle,ReplaceBlkFull);
