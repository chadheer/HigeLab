%% Anna experiments
close all
clear all

cd('F:/anna')

%% GFlamp/OK107/092525/fly1

folder = 'GFlamp/OK107/093025/fly1/ACVright';
GFlamp.fly093025_1.ACV_right = extract_fictrac(folder);

folder = 'GFlamp/OK107/093025/fly1/walking';
GFlamp.fly093025_1.walking_right = extract_fictrac(folder);


folder = 'GFlamp/OK107/093025/fly1';
bad_trials = [];
GFlamp.fly093025_1 = extract_fluorescence(GFlamp.fly093025_1, folder, bad_trials)

%% 
