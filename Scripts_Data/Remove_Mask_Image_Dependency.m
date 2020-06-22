% Copyright 2009-2020 The MathWorks, Inc.

masked_blk_list = find_system(bdroot,'Mask','on');
for i = 1:length(masked_blk_list)
    maskdispstr = strrep(get_param(masked_blk_list(i),'MaskDisplay'),'image','%image');
    set_param(gcb,'MaskDisplay',maskdispstr);
end


%maskdispstr = strrep(get_param(gcb,'MaskDisplay'),'image','%image')
