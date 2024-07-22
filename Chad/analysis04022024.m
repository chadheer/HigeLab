%% 04022024
clear all 
close all
%% 04022024
% odor_pairing/04022024/Fly001/

folder = 'odor_pairing/04022024/fly001/ACV_straight';

data.fly04022024_001.ACV_straight = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04022024/Fly001/pre_training';

data.fly04022024_001.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04022024/Fly001/post_pairing';

data.fly04022024_001.post_pairing_right = extract_fictrac(folder);

data.fly04022024_001.post_pairing_right.paired_odor = "OCT";
data.fly04022024_001.pre_pairing_right.paired_odor = "OCT";

%% 04022024
% odor_pairing/04022024/Fly003/

folder = 'odor_pairing/04022024/Fly003/ACV_straight';

data.fly04022024_003.ACV_straight = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04022024/Fly003/pre_pairing';

data.fly04022024_003.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04022024/Fly003/post_pairing';

data.fly04022024_003.post_pairing_right = extract_fictrac(folder);

data.fly04022024_003.post_pairing_right.paired_odor = "MCH";
data.fly04022024_003.pre_pairing_right.paired_odor = "MCH";


%% 04022024
% odor_pairing/04022024/Fly005

folder = 'odor_pairing/04022024/Fly005/ACV_straight';

data.fly04022024_005.ACV_straight = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04022024/Fly005/pre_pairing';

data.fly04022024_005.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04022024/Fly005/post_pairing';

data.fly04022024_005.post_pairing_left = extract_fictrac(folder);

data.fly04022024_005.post_pairing_left.paired_odor = "MCH";
data.fly04022024_005.pre_pairing_left.paired_odor = "MCH";

%%
straight_vs_turn(data, ['inthead'])

straight_vs_turn(data, ['movdir'])
straight_vs_turn(data, ['movspd'])
