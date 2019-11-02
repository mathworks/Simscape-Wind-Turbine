
test_model = gcs;
open(test_model);

set_param([test_model '/Flexible Cantilever1'],'BlockChoice','Lumped Parameter');
set_param([test_model '/Flexible Cantilever2'],'BlockChoice','Lumped Parameter');
set_param([test_model '/Flexible Cantilever3'],'BlockChoice','Lumped Parameter');

% Copyright 2009-2017 The MathWorks(TM), Inc.
