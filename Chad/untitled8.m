%% 05082024
clear all 
close all
%% 05082024 000
% odor_pairing/04292024/fly000/

folder = 'odor_pairing/05082024/fly000/ACV_left';

data.fly05082024_000.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/05082024/fly000/pre_pairing';

data.fly05082024_000.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/05082024/fly000/post_pairing';

data.fly05082024_000.post_pairing_left= extract_fictrac(folder);

data.fly05082024_000.post_pairing_left.paired_odor = "OCT";
data.fly05082024_000.pre_pairing_left.paired_odor = "OCT";

%% 05082024 001
% odor_pairing/04292024/fly001/

folder = 'odor_pairing/05082024/fly001/ACV_left';

data.fly05082024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/05082024/fly001/pre_pairing';

data.fly05082024_001.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/05082024/fly001/post_pairing';

data.fly05082024_001.post_pairing_left= extract_fictrac(folder);

data.fly05082024_001.post_pairing_left.paired_odor = "MCH";
data.fly05082024_001.pre_pairing_left.paired_odor = "MCH";


%% 05082024 002
% odor_pairing/04292024/fly002/

folder = 'odor_pairing/05082024/fly002/ACV_left';

data.fly05082024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/05082024/fly002/pre_pairing';

data.fly05082024_002.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/05082024/fly002/post_pairing';

data.fly05082024_002.post_pairing_left= extract_fictrac(folder);

data.fly05082024_002.post_pairing_left.paired_odor = "OCT";
data.fly05082024_002.pre_pairing_left.paired_odor = "OCT";

%% 05082024 003
% odor_pairing/04292024/fly003/

folder = 'odor_pairing/05082024/fly003/ACV_left';

data.fly05082024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/05082024/fly003/pre_pairing';

data.fly05082024_003.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/05082024/fly003/post_pairing';

data.fly05082024_003.post_pairing_left= extract_fictrac(folder);

data.fly05082024_003.post_pairing_left.paired_odor = "MCH";
data.fly05082024_003.pre_pairing_left.paired_odor = "MCH";

%%
save('05082024_pairing', "data");

%%
straight_vs_turn(data, 'movspd')

straight_vs_turn(data, 'inthead')