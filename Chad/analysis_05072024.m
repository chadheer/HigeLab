%% 05072024
clear all 
close all
%% 05072024 000
% odor_pairing/05072024/Fly00/

folder = 'odor_pairing/05072024/fly00/ACV_right';

data.fly05072024_000.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/05072024/fly00/pre_pairing';

data.fly05072024_000.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/05072024/fly00/post_pairing';

data.fly05072024_000.post_pairing_right = extract_fictrac(folder);

data.fly05072024_000.post_pairing_right.paired_odor = "OCT";
data.fly05072024_000.pre_pairing_right.paired_odor = "OCT";

%% 05072024 001
% odor_pairing/05072024/Fly001/

folder = 'odor_pairing/05072024/fly001/ACV_right';

data.fly05072024_001.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/05072024/fly001/pre_pairing';

data.fly05072024_001.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/05072024/fly001/post_pairing';

data.fly05072024_001.post_pairing_right = extract_fictrac(folder);

data.fly05072024_001.post_pairing_right.paired_odor = "MCH";
data.fly05072024_001.pre_pairing_right.paired_odor = "MCH";

%% 05072024 002
% odor_pairing/05072024/Fly002/

folder = 'odor_pairing/05072024/fly002/ACV_right';

data.fly05072024_002.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/05072024/fly002/pre_pairing';

data.fly05072024_002.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/05072024/fly002/post_pairing';

data.fly05072024_002.post_pairing_right = extract_fictrac(folder);

data.fly05072024_002.post_pairing_right.paired_odor = "MCH";
data.fly05072024_002.pre_pairing_right.paired_odor = "MCH";

%% 05072024 004
% odor_pairing/05072024/Fly004/

folder = 'odor_pairing/05072024/fly004/ACV_right';

data.fly05072024_004.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/05072024/fly004/pre_pairing';

data.fly05072024_004.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/05072024/fly004/post_pairing';

data.fly05072024_004.post_pairing_right = extract_fictrac(folder);

data.fly05072024_004.post_pairing_right.paired_odor = "MCH";
data.fly05072024_004.pre_pairing_right.paired_odor = "MCH";

%%
save('05072024_pairing', "data");

%%
straight_vs_turn(data, 'movspd')

straight_vs_turn(data, 'inthead')
