% FIND ALL BLOCKS THAT ARE CONFIGURABLE SUBSYSTEMS
% Copyright 2011-2020 The MathWorks, Inc.

ConfigSubsysBlks_path=find_system(bdroot,'FollowLinks','on','RegExp','on','MemberBlocks','.+');

for i=1:length(ConfigSubsysBlks_path)
    CSBp_lengths(i) = length(ConfigSubsysBlks_path{i});
end

%[y i]=sort(CSBp_lengths,'descend');
[y i]=sort(CSBp_lengths,'ascend');
ConfigSubsysBlks_path_old = ConfigSubsysBlks_path;
ConfigSubsysBlks_path = ConfigSubsysBlks_path_old(i);
clear y i

Current_Model = gcs;

% REPLACE EACH CONFIG SUBSYS WITH LIB BLOCK CURRENTLY SELECTED
for i = 1:length(ConfigSubsysBlks_path)
    % GET BLOCK INFO (INSTANCE AND SOURCE)
    SourceBlkHandle = get_param(char(ConfigSubsysBlks_path(i)),'Handle');
    TemplateBlk = get_param(char(ConfigSubsysBlks_path(i)),'TemplateBlock');
    slash_ind = findstr(TemplateBlk,'/');
    ReplaceBlkFile = TemplateBlk(1:slash_ind);
    ReplaceBlkName = get_param(char(ConfigSubsysBlks_path(i)),'BlockChoice');
    ReplaceBlkFull = [ReplaceBlkFile ReplaceBlkName];
    
    % REPLACE BLOCK
    disp(['REPLACING ' ReplaceBlkFull]);
    replace_block(bdroot,'Handle',SourceBlkHandle,ReplaceBlkFull);
    %disp('post replblock');
    if(strcmp(get_param(gcb,'LinkStatus'),'resolved'))
        set_param(gcb,'LinkStatus','inactive');
    end
    for j=1:length(ConfigSubsysBlks_path)
        ConfigSubsysBlks_path(j) = strrep(ConfigSubsysBlks_path(j),[ReplaceBlkName '/'] ,'');
    end
end

% SAVE SYSTEM WITH ALL LIBRARY LINKS BROKEN
%save_system(bdroot,'Broken_Link_Test','BreakUserLinks',true);
