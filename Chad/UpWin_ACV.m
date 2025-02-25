%% UpWIN ACV experiments analysis
% analysis of ACV behavioral and Upwin activity responses recorded in
% January of 2025

close all
clear all

%% UpWins/01302025/fly000
% input params, 30 fps, exclude trial 7
folder = 'UPWIN/01302025/fly000/ACV_left';

data.fly01302025_000.ACV_left = extract_data_manual_labeling(folder);
data.fly01302025_000.ACV_left.fr = 30;
% 

% %% UpWins/01302025/fly001
% 
% % input params, 5 fps, 226 frames, 15 roi size
% folder = 'UPWIN/01302025/fly001/ACV_left';
% 
% data.fly01302025_001.ACV_left = extract_data_multiplane(folder);
% data.fly01302025_001.ACV_left.fr = 30;
% % 

%% UpWins/01302025/fly002
% input params, 30 fps, no trials to exclude
folder = 'UPWIN/01302025/fly002/ACV_left';

data.fly01302025_002.ACV_left = extract_data_manual_labeling(folder);
data.fly01302025_002.ACV_left.fr = 30;
% 


%%

plot_f_and_beh(data, "movspd")


straight_vs_turn(data, "movspd")
straight_vs_turn(data, "inthead")




