%% Upwin imaging
close all
clear all

%% 05202024
% ImagingData/07222024/fly000
% 
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