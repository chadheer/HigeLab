%% Upwin imaging
close all
clear all

%% 05202024
% ImagingData/07222024/fly000
% 
folder = 'UPWIN/06222024/fly000/ACV_left';

data.fly07222024_000.ACV_left = extract_data(folder);
data.fly07222024_000.ACV_left.fr = 30/4;

folder = 'UPWIN/06222024/fly000/pre';

data.fly07222024_000.pre_left = extract_data(folder);
data.fly07222024_000.pre_left.fr = 30/4;

%%
lobe_ids = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};

lobe_analysis(data, "movspd", lobe_ids)