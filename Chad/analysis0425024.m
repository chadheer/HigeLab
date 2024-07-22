%% 04292024
clear all 
close all
%% 04252024 001
% odor_pairing/04292024/Fly001/

folder = 'odor_pairing/04252024/Fly001/ACV_left';

data.fly04252024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04252024/Fly001/pre_pairing';

data.fly04252024_001.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04252024/Fly001/post_pairing';

data.fly04252024_001.post_pairing_left= extract_fictrac(folder);

data.fly04252024_001.post_pairing_left.paired_odor = "OCT";
data.fly04252024_001.pre_pairing_left.paired_odor = "OCT";

%% 04252024 002
% odor_pairing/04252024/Fly002/

folder = 'odor_pairing/04252024/Fly002/ACV_left';

data.fly04252024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04252024/Fly002/pre_pairing';

data.fly04252024_002.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04252024/Fly002/post_pairing';

data.fly04252024_002.post_pairing_left= extract_fictrac(folder);

data.fly04252024_002.post_pairing_left.paired_odor = "MCH";
data.fly04252024_002.pre_pairing_left.paired_odor = "MCH";

%% 04252024 003
% odor_pairing/04292024/Fly003/

folder = 'odor_pairing/04252024/Fly003/ACV_left';

data.fly04252024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04252024/Fly003/pre_pairing';

data.fly04252024_003.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04252024/Fly003/post_pairing';

data.fly04252024_003.post_pairing_left= extract_fictrac(folder);

data.fly04252024_003.post_pairing_left.paired_odor = "OCT";
data.fly04252024_003.pre_pairing_left.paired_odor = "OCT";

%% 04252024 003
% odor_pairing/04292024/Fly005/

folder = 'odor_pairing/04252024/Fly005/ACV_left';

data.fly04252024_005.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04252024/Fly005/pre_pairing';

data.fly04252024_005.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04252024/Fly005/post_pairing';

data.fly04252024_005.post_pairing_left= extract_fictrac(folder);

data.fly04252024_005.post_pairing_left.paired_odor = "MCH";
data.fly04252024_005.pre_pairing_left.paired_odor = "MCH";

%%
save('04252024_pairing', "data");

%%
straight_vs_turn(data, 'movspd')

straight_vs_turn(data, 'inthead')