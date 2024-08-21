%% Upwin imaging
close all
clear all

%% ImagingData/06262024/fly001
% input params, 5 fps, 226 frames, 15 roi size
folder = 'UPWIN/06262024/fly001/ACV_left';

data.fly06262024_001.ACV_left = extract_data_multiplane(folder);
data.fly06262024_001.ACV_left.fr = 30/6;
% 
folder = 'UPWIN/06262024/fly001/pre';

data.fly06262024_001.pre = extract_data_multiplane(folder);
data.fly06262024_001.pre.fr = 30/6;
% 
folder = 'UPWIN/06262024/fly001/post';

data.fly06262024_001.post = extract_data_multiplane(folder);
data.fly06262024_001.post.fr = 30/6;


%% ImagingData/06262024/fly002
% input params, 5 fps, 226 frames, 15 roi size
folder = 'UPWIN/06262024/fly002/ACV_left';

data.fly06262024_002.ACV_left = extract_data_multiplane(folder);
data.fly06262024_002.ACV_left.fr = 30/6;
% 
folder = 'UPWIN/06262024/fly002/pre';

data.fly06262024_002.pre = extract_data_multiplane(folder);
data.fly06262024_002.pre.fr = 30/6;
% 
folder = 'UPWIN/06262024/fly002/post';

data.fly06262024_002.post = extract_data_multiplane(folder);
data.fly06262024_002.post.fr = 30/6;


%% ImagingData/06292024/fly002
% input params, 5 fps, 226 frames, 15 roi size
folder = 'UPWIN/06292024/fly002/ACV_left';

data.fly06292024_002.ACV_left = extract_data_multiplane(folder);
data.fly06292024_002.ACV_left.fr = 30/6;
% 
folder = 'UPWIN/06292024/fly002/pre';

data.fly06292024_002.pre = extract_data_multiplane(folder);
data.fly06292024_002.pre.fr = 30/6;
% 
folder = 'UPWIN/06292024/fly002/post';

data.fly06292024_002.post = extract_data_multiplane(folder);
data.fly06292024_002.post.fr = 30/6;

%% 07302024
% ImagingData/07302024/fly000
% input params, 5 fps, 226 frames, 15 roi size
 
folder = 'UPWIN/07302024/fly000/ACV_left';

data.fly07302024_000.ACV_left = extract_data_multiplane(folder);
data.fly07302024_000.ACV_left.fr = 30/6;
% 
folder = 'UPWIN/07302024/fly000/pre';

data.fly07302024_000.pre = extract_data_multiplane(folder);
data.fly07302024_000.pre.fr = 30/6;
% 
folder = 'UPWIN/07302024/fly000/post';

data.fly07302024_000.post = extract_data_multiplane(folder);
data.fly07302024_000.post.fr = 30/6;

%%
lobe_ids = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};

lobe_analysis(data, "movspd", lobe_ids)