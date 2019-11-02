
test_model = bdroot(gcs);
%open(test_model);

set_param([test_model '/Flexible Cantilever1'],'BlockChoice','FEA Modes');
set_param([test_model '/Flexible Cantilever2'],'BlockChoice','FEA Modes');
set_param([test_model '/Flexible Cantilever3'],'BlockChoice','FEA Modes');

% Copyright 2009-2017 The MathWorks(TM), Inc.
