%% Anna experiments
close all
clear all

cd('F:/anna')

%% GFlamp/OK107/092425/fly1

folder = 'GFlamp/OK107/092425/fly1/ACV_right';
GFlamp.fly092425_1.ACV_right = extract_fictrac(folder);

folder = 'GFlamp/OK107/092425/fly1/walking';
GFlamp.fly092425_1.walking_right = extract_fictrac(folder);


folder = 'GFlamp/OK107/092425/fly1';
bad_trials = [];
GFlamp.fly092425_1 = extract_fluorescence(GFlamp.fly092425_1, folder, bad_trials)

%% GFlamp/OK107/092525/fly1

folder = 'GFlamp/OK107/092525/fly1/ACVright';
GFlamp.fly092525_1.ACV_right = extract_fictrac(folder);

folder = 'GFlamp/OK107/092525/fly1/walking';
GFlamp.fly092525_1.walking_right = extract_fictrac(folder);


folder = 'GFlamp/OK107/092525/fly1';
bad_trials = [12,13,14,15];
GFlamp.fly092525_1 = extract_fluorescence(GFlamp.fly092525_1, folder, bad_trials)
%% GFlamp/OK107/093025/fly1

folder = 'GFlamp/OK107/093025/fly1/ACVright';
GFlamp.fly093025_1.ACV_right = extract_fictrac(folder);

folder = 'GFlamp/OK107/093025/fly1/walking';
GFlamp.fly093025_1.walking_right = extract_fictrac(folder);


folder = 'GFlamp/OK107/093025/fly1';
bad_trials = [];
GFlamp.fly093025_1 = extract_fluorescence(GFlamp.fly093025_1, folder, bad_trials)

%% GFlamp/OK107/100225/fly1

folder = 'GFlamp/OK107/100225/fly1/ACVright';
GFlamp.fly100225_1.ACV_right = extract_fictrac(folder);

folder = 'GFlamp/OK107/100225/fly1/walking';
GFlamp.fly100225_1.walking_right = extract_fictrac(folder);


folder = 'GFlamp/OK107/100225/fly1';
bad_trials = [];
GFlamp.fly100225_1 = extract_fluorescence(GFlamp.fly100225_1, folder, bad_trials)

%% GFlamp/OK107/100925/fly1

folder = 'GFlamp/OK107/100925/fly1/ACVright';
GFlamp.fly100925_1.ACV_right = extract_fictrac(folder);

folder = 'GFlamp/OK107/100925/fly1/walking';
GFlamp.fly100925_1.walking_right = extract_fictrac(folder);


folder = 'GFlamp/OK107/100925/fly1';
bad_trials = [];
GFlamp.fly100925_1 = extract_fluorescence(GFlamp.fly100925_1, folder, bad_trials)

%% GFlamp/OK107/101025/fly1

folder = 'GFlamp/OK107/101025/fly1/ACVright';
GFlamp.fly101025_1.ACV_right = extract_fictrac(folder);

folder = 'GFlamp/OK107/101025/fly1/walking';
GFlamp.fly101025_1.walking_right = extract_fictrac(folder);


folder = 'GFlamp/OK107/101025/fly1';
bad_trials = [11];
GFlamp.fly101025_1 = extract_fluorescence(GFlamp.fly101025_1, folder, bad_trials)

%% GFlamp/OK107/101025/fly2

folder = 'GFlamp/OK107/101025/fly2/ACVright';
GFlamp.fly101025_2.ACV_right = extract_fictrac(folder);

folder = 'GFlamp/OK107/101025/fly2/walking';
GFlamp.fly101025_2.walking_right = extract_fictrac(folder);


folder = 'GFlamp/OK107/101025/fly2';
bad_trials = [14, 15];
GFlamp.fly101025_2 = extract_fluorescence(GFlamp.fly101025_2, folder, bad_trials)


%% 
save("gflampdata");


F_and_beh(GFlamp,'movspd');
F_and_beh(GFlamp,'inthead');