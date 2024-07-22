%sidepairing tests
close all 
clear all

%% odor_pairing/02292024/fly001

%ACV_test
folder = 'odor_pairing/02292024/fly001/ACV_pre';
thresh = 40;

data.fly02292024_001.ACV_left = extract_fictrac(folder, thresh);

%pre_pairing
folder = 'odor_pairing/02292024/fly001/pre_pairing';
thresh = 40;

data.fly02292024_001.pre_pairing_left = extract_fictrac(folder, thresh);

%post_pairing
folder = 'odor_pairing/02292024/fly001/post_pairing';
thresh = 40;

data.fly02292024_001.post_pairing_left = extract_fictrac(folder, thresh);

%% odor_pairing/02292024/fly003

%ACV_test
folder = 'odor_pairing/02292024/fly003/ACV_pre';
thresh = 40;

data.fly02292024_003.ACV_left = extract_fictrac(folder, thresh);

%pre_pairing
folder = 'odor_pairing/02292024/fly003/pre_pairing';
thresh = 40;

data.fly02292024_003.pre_pairing_left = extract_fictrac(folder, thresh);

%post_pairing
folder = 'odor_pairing/02292024/fly003/post_pairing';
thresh = 40;

data.fly02292024_003.post_pairing_left = extract_fictrac(folder, thresh);


%%
save('58E02_side_pairing', "data");

%%
straight_vs_turn(data, 'movspd')

straight_vs_turn(data, 'inthead')
