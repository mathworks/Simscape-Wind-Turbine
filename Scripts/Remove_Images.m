% REMOVE MASK LINES
% Copyright 2009-2017 The MathWorks(TM), Inc.

ImagedBlocks =find_system(gcs,'FollowLinks','on','RegExp','on','MaskDisplay','i*IMAGE.jpg*');
for i=1:size(ImagedBlocks,1)
    maskdispstr = strrep(get_param(char(ImagedBlocks(i)),'MaskDisplay'),'image','%image');
    set_param(char(ImagedBlocks(i)),'MaskDisplay',maskdispstr);
    %set_param
    %set_param(char(ImagedBlocks(i)),'MaskDisplay','')
end
