%% fly 03252024 002
folder = 'odor_pairing/03252024/Fly002/ACV_left';

data.fly03252024_002.ACV_left = extract_fictrac(folder);

%acv_right
folder = 'odor_pairing/03252024/Fly002/ACV_right';

data.fly03252024_002.ACV_right = extract_fictrac(folder);

%% fly 03252024 003
folder = 'odor_pairing/03252024/Fly003/ACV_left';

data.fly03252024_003.ACV_left = extract_fictrac(folder);

%acv_right
folder = 'odor_pairing/03252024/Fly003/ACV_right';

data.fly03252024_003.ACV_right = extract_fictrac(folder);

%% fly 03252024 004
folder = 'odor_pairing/03252024/Fly004/ACV_left';

data.fly03252024_004.ACV_left = extract_fictrac(folder);

%acv_right
folder = 'odor_pairing/03252024/Fly004/ACV_right';

data.fly03252024_004.ACV_right = extract_fictrac(folder);

%% 03272024 002

folder = 'odor_pairing/03272024/Fly002/ACV_left';

data.fly03272024_002.ACV_left = extract_fictrac(folder);

%acv_right
folder = 'odor_pairing/03272024/Fly002/ACV_right';

data.fly03252024_002.ACV_right = extract_fictrac(folder);

%% 03272024 003

folder = 'odor_pairing/03272024/Fly003/ACV_left';

data.fly03272024_002.ACV_left = extract_fictrac(folder);

%acv_right
folder = 'odor_pairing/03272024/Fly003/ACV_right';

data.fly03272024_002.ACV_right = extract_fictrac(folder);

%% 03282024 002

folder = 'odor_pairing/03282024/Fly002/ACV_left';

data.fly03282024_002.ACV_left = extract_fictrac(folder);

%acv_right
folder = 'odor_pairing/03282024/Fly002/ACV_right';

data.fly03282024_002.ACV_right = extract_fictrac(folder);

%% 03282024 002

folder = 'odor_pairing/03282024/Fly005/ACV_left';

data.fly03282024_005.ACV_left = extract_fictrac(folder);

%acv_right
folder = 'odor_pairing/03282024/Fly005/ACV_right';

data.fly03282024_005.ACV_right = extract_fictrac(folder);
%%
straight_vs_turn(data, ['inthead'])

straight_vs_turn(data, ['movdir'])
straight_vs_turn(data, ['movspd'])
