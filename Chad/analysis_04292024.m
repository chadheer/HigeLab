%% 04292024
clear all 
close all
%% 04292024 001
% odor_pairing/04292024/Fly001/

folder = 'odor_pairing/04292024/Fly001/ACV_right';

data.fly04292024_001.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04292024/Fly001/pre_pairing';

data.fly04292024_001.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04292024/Fly001/post_pairing';

data.fly04292024_001.post_pairing_right = extract_fictrac(folder);

data.fly04292024_001.post_pairing_right.paired_odor = "MCH";
data.fly04292024_001.pre_pairing_right.paired_odor = "MCH";

%% 04292024 003
% odor_pairing/04292024/Fly003/

folder = 'odor_pairing/04292024/Fly003/ACV_right';

data.fly04292024_003.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04292024/Fly003/pre_pairing';

data.fly04292024_003.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04292024/Fly003/post_pairing';

data.fly04292024_003.post_pairing_right = extract_fictrac(folder);

data.fly04292024_003.post_pairing_right.paired_odor = "OCT";
data.fly04292024_003.pre_pairing_right.paired_odor = "OCT";

%% 04292024 004
% odor_pairing/04292024/Fly004/

folder = 'odor_pairing/04292024/Fly004/ACV_right';

data.fly04292024_004.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04292024/Fly004/pre_pairing';

data.fly04292024_004.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04292024/Fly004/post_pairing';

data.fly04292024_004.post_pairing_right = extract_fictrac(folder);

data.fly04292024_004.post_pairing_right.paired_odor = "MCH";
data.fly04292024_004.pre_pairing_right.paired_odor = "MCH";

%% 04292024 005
% odor_pairing/04292024/Fly005/

folder = 'odor_pairing/04292024/Fly005/ACV_left';

data.fly04292024_005.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04292024/Fly005/pre_pairing';

data.fly04292024_005.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04292024/Fly005/post_pairing';

data.fly04292024_005.post_pairing_left = extract_fictrac(folder);

data.fly04292024_005.post_pairing_left.paired_odor = "OCT";
data.fly04292024_005.pre_pairing_left.paired_odor = "OCT";

%% 04292024 006
% odor_pairing/04292024/Fly005/

folder = 'odor_pairing/04292024/Fly006/ACV_left';

data.fly04292024_006.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04292024/Fly006/pre_pairing';

data.fly04292024_006.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04292024/Fly006/post_pairing';

data.fly04292024_006.post_pairing_left = extract_fictrac(folder);

data.fly04292024_006.post_pairing_left.paired_odor = "MCH";
data.fly04292024_006.pre_pairing_left.paired_odor = "MCH";

%% 04292024 007
% odor_pairing/04292024/Fly007/

folder = 'odor_pairing/04292024/Fly007/ACV_left';

data.fly04292024_007.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04292024/Fly007/pre_pairing';

data.fly04292024_007.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04292024/Fly007/post_pairing';

data.fly04292024_007.post_pairing_left = extract_fictrac(folder);

data.fly04292024_007.post_pairing_left.paired_odor = "OCT";
data.fly04292024_007.pre_pairing_left.paired_odor = "OCT";

%%
save('04292024_pairing', "data");

%%
straight_vs_turn(data, 'movspd')

straight_vs_turn(data, 'inthead')
