% Copyright 2011 The MathWorks, Inc.
parfor i = 1:1
    out{i} = sim(mdl, SimSettings{i});
end
