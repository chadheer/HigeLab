%% 03282024 005

folder = 'odor_pairing/03282024/Fly005/ACV_left';

data.fly03282024_005.ACV_straight= extract_fictrac(folder);

%acv_right
folder = 'odor_pairing/03282024/Fly005/pre_pairing';

data.fly03282024_005.pre_pairing = extract_fictrac(folder);

%acv_right
folder = 'odor_pairing/03282024/Fly005/post_pairing';

data.fly03282024_005.post_pairing = extract_fictrac(folder);


data.fly03282024_005.post_pairing.paired_odor = "OCT";
data.fly03282024_005.pre_pairing.paired_odor = "OCT";
%% 03282024 006

folder = 'odor_pairing/03282024/Fly006/ACV_straight';

data.fly03282024_006.ACV_straight = extract_fictrac(folder);

%acv_right
folder = 'odor_pairing/03282024/Fly006/pre_pairing';

data.fly03282024_006.pre_pairing = extract_fictrac(folder);

%acv_right
folder = 'odor_pairing/03282024/Fly006/post_pairing';

data.fly03282024_006.post_pairing = extract_fictrac(folder);


data.fly03282024_006.post_pairing.paired_odor = "OCT";
data.fly03282024_006.pre_pairing.paired_odor = "OCT";
%%
straight_vs_turn(data, ['inthead'])

straight_vs_turn(data, ['movdir'])
straight_vs_turn(data, ['movspd'])
