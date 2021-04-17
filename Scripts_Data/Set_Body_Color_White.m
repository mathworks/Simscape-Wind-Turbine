% Copyright 2009-2021 The MathWorks(TM), Inc.

BodyList = find_system(gcs,'LookUnderMasks','on','ClassName','Body');
BCKColor = [1 1 1];
for i = 1:length(BodyList)
    BlockPath = char(BodyList(i));
    BCKColor = '[1 1 1]';
    set_param(BlockPath,'BodyColor',BCKColor);
    set_param(BlockPath,'BodyColorSelMode','COLORPALETTE');
end
