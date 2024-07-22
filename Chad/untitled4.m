clear all
close all

%% 0412024
% odor_pairing/04102024/Fly001/

folder = 'odor_pairing/04102024/Fly004/ACV_right';

control.fly04102024_004.ACV_straight = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04102024/Fly004/pre_pairing';

control.fly04102024_004.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04102024/Fly004/post_pairing';

control.fly04102024_004.post_pairing_right = extract_fictrac(folder);

control.fly04102024_004.post_pairing_right.paired_odor = "OCT";
control.fly04102024_004.pre_pairing_right.paired_odor = "OCT";

%% 04102024
% odor_pairing/04102024/Fly005/

folder = 'odor_pairing/04102024/Fly005/ACV_right';

data.fly04102024_005.ACV_straight = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04102024/Fly005/pre_pairing';

data.fly04102024_005.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04102024/Fly004/post_pairing';

data.fly04102024_005.post_pairing_right = extract_fictrac(folder);

data.fly04102024_005.post_pairing_right.paired_odor = "OCT";
data.fly04102024_005.pre_pairing_right.paired_odor = "OCT";

%%
straight_vs_turn(data, ['inthead'])

straight_vs_turn(data, ['movspd'])

%%
straight_vs_turn(control, ['inthead'])

straight_vs_turn(control, ['movspd'])