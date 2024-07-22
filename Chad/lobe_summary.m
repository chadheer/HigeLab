clear all 
close all
%% fly05012024 000
% ImagingData/05012024/fly000

folder = 'ImagingData/05012024/fly000/session1';

data.fly05012024_000.session1 = extract_data(folder);



%% fly04302024_002
% ImagingData/04302024/fly002

folder = 'ImagingData/04302024/fly002/session1';

data.fly04302024_002.session1 = extract_data(folder);


%% fly04302024_001
% ImagingData/04302024/fly001

folder = 'ImagingData/04302024/fly001/session2';

data.fly04302024_001.session2 = extract_data(folder);

folder = 'ImagingData/04302024/fly001/session1';

data.fly04302024_001.session1= extract_data(folder);

%% fly04252024_001
% ImagingData/04302024/fly001

folder = 'ImagingData/04302024/fly001/session1';

data.fly04302024_001.session1 = extract_data(folder);

%% 05092024 000
% ImagingData/05092024/fly001

folder = 'ImagingData/05092024/fly000/session1';

data.fly05092024_000.session1 = extract_data(folder);

folder = 'ImagingData/05092024/fly000/session2';

data.fly05092024_000.session2 = extract_data(folder);
%% 05092024
% ImagingData/04302024/fly001

folder = 'ImagingData/05092024/fly001/session1';

data.fly05092024_001.session1 = extract_data(folder);

folder = 'ImagingData/05092024/fly001/session2';

data.fly05092024_001.session1 = extract_data(folder);

%% 05092024
% ImagingData/05092024/fly002

folder = 'ImagingData/05092024/fly002/session1';

data.fly05092024_002.session1 = extract_data(folder);
% 
% folder = 'ImagingData/05092024/fly002/session2';
% 
% data.fly05092024_002.session1 = extract_data(folder);

%% 05092024
% ImagingData/05092024/fly003

folder = 'ImagingData/05092024/fly003/session1';

data.fly05092024_003.session1 = extract_data(folder);

folder = 'ImagingData/05092024/fly003/session2';

data.fly05092024_003.session2 = extract_data(folder);

%% 05102024
% ImagingData/05102024/fly003
% 
% folder = 'ImagingData/05102024/fly000/session1';
% 
% data.fly05102024_000.session1 = extract_data(folder);

folder = 'ImagingData/05102024/fly000/session2';

data.fly05102024_000.session2 = extract_data(folder);
%%
lobe_ids = {"a' lobe", "a lobe"};

lobe_analysis(data, "movspd", lobe_ids)