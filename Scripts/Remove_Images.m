% REMOVE MASK LINES
% Copyright 2009 The MathWorks(TM), Inc.

ImagedBlocks =find_system(gcs,'FollowLinks','on','RegExp','on','MaskDisplay','i*IMAGE.jpg*');
for i=1:length(ImagedBlocks)
    set_param(char(ImagedBlocks(i)),'MaskDisplay','')
end
