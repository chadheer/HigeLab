%pairing tests
close all 
clear all

%% odor_pairing/02222024/fly001

%ACV_test
folder = 'odor_pairing/02222024/fly001/pre_acv';
thresh = 60;

data.fly02222024_001.ACV_test = extract_fictrac(folder, thresh);

%pre_pairing
folder = 'odor_pairing/02222024/fly001/pre_pairing';
thresh = 60;

data.fly02222024_001.pre_pairing = extract_fictrac(folder, thresh);

%post_pairing
folder = 'odor_pairing/02222024/fly001/post_pairing';
thresh = 60;

data.fly02222024_001.post_pairing = extract_fictrac(folder, thresh);

%% odor_pairing/02222024/fly005

%ACV_test
folder = 'odor_pairing/02222024/fly005/pre_acv';
thresh = 60;

data.fly02222024_005.ACV_test = extract_fictrac(folder, thresh);

%pre_pairing
folder = 'odor_pairing/02222024/fly005/pre_pairing';
thresh = 60;

data.fly02222024_005.pre_pairing = extract_fictrac(folder, thresh);

%post_pairing
folder = 'odor_pairing/02222024/fly005/post_pairing';
thresh = 60;

data.fly02222024_005.post_pairing = extract_fictrac(folder, thresh);

%% odor_pairing/02212024/fly001

%ACV_test
folder = 'odor_pairing/02212024/fly001/acv_straight';
thresh = 60;

data.fly02212024_001.ACV_test = extract_fictrac(folder, thresh);

%pre_pairing
folder = 'odor_pairing/02212024/fly001/prepairing';
thresh = 60;

data.fly02212024_001.pre_pairing = extract_fictrac(folder, thresh);

%post_pairing
folder = 'odor_pairing/02212024/fly001/postpairing';
thresh = 100;

data.fly02212024_001.post_pairing = extract_fictrac(folder, thresh);

%% odor_pairing/02202024/fly006

%ACV_test
folder = 'odor_pairing/02202024/fly006/ACV_pretraining';
thresh = 60;

data.fly02202024_006.ACV_test = extract_fictrac(folder, thresh);

%pre_pairing
folder = 'odor_pairing/02202024/fly006/pretraining';
thresh = 80;

data.fly02202024_006.pre_pairing = extract_fictrac(folder, thresh);

%post_pairing
folder = 'odor_pairing/02202024/fly006/postpairing';
thresh = 60;

data.fly02202024_006.post_pairing = extract_fictrac(folder, thresh);

%% odor_pairing/02282024/fly003

%ACV_test
folder = 'odor_pairing/02282024/Fly003/ACV_pre_2';
thresh = 100;

data.fly02282024_003.ACV_test = extract_fictrac(folder,thresh);

%pre_pairing
folder = 'odor_pairing/02282024/Fly003/pre_pairing';
thresh = 100;

data.fly02282024_003.pre_pairing = extract_fictrac(folder,thresh);

%post_pairing
folder = 'odor_pairing/02282024/Fly003/post_pairing';
thresh = 100;

data.fly02282024_003.post_pairing = extract_fictrac(folder,thresh);

%% odor_pairing/02282024/fly004

%ACV_test
folder = 'odor_pairing/02282024/Fly004/pre_ACV';
thresh = 100;

data.fly02282024_004.ACV_test = extract_fictrac(folder,thresh);

%pre_pairing
folder = 'odor_pairing/02282024/Fly004/pre_pairing';
thresh = 100;

data.fly02282024_004.pre_pairing = extract_fictrac(folder,thresh);

%post_pairing
folder = 'odor_pairing/02282024/Fly004/post_pairing';
thresh = 100;

data.fly02282024_004.post_pairing = extract_fictrac(folder,thresh);

%% odor_pairing/02282024/fly005

%ACV_test
folder = 'odor_pairing/02282024/Fly005/ACV_pre';
thresh = 100;

data.fly02282024_005.ACV_test = extract_fictrac(folder, thresh);

%pre_pairing
folder = 'odor_pairing/02282024/Fly005/pre_pairing';
thresh = 100;

data.fly02282024_005.pre_pairing = extract_fictrac(folder, thresh);

%post_pairing
folder = 'odor_pairing/02282024/Fly005/post_pairing';
thresh = 120;

data.fly02282024_005.post_pairing = extract_fictrac(folder, thresh);

%%
save('58E02_pairing', "data");

%%
straight_vs_turn(data, 'movspd')

straight_vs_turn(data, 'inthead')
