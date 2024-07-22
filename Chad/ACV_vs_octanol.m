%% ACV_vs octanol analysis
clear all
close all
%% 12062023/Fly004
% ACV_straight
folder = '12062023/Fly004/ACV_straight'

thresh = 210;

data.fly_12062023.ACV_straight = extract_fictrac(folder,thresh);

%ACV_right
folder = '12062023/Fly004/ACV_right'

thresh = 210;

data.fly_12062023.ACV_right = extract_fictrac(folder,thresh);

%OCT_right

folder = '12062023/Fly004/OCT_right'

thresh = 210;

data.fly_12062023.OCT_right = extract_fictrac(folder, thresh);

%OCT_straight
folder = '12062023/Fly004/OCT_straight'

thresh = 210;

data.fly_12062023.OCT_straight = extract_fictrac(folder, thresh);

%% 12152023/Fly002

%ACV_straight
folder = '12152023/Fly002/ACV_straight'

thresh = 240;

data.fly_12152023_002.ACV_straight = extract_fictrac(folder, thresh);

%ACV_right
folder = '12152023/Fly002/ACV_right'

thresh = 237;

data.fly_12152023_002.ACV_right = extract_fictrac(folder, thresh);

%OCT_right

folder = '12152023/Fly002/OCT_right'

thresh = 240;

data.fly_12152023_002.OCT_right = extract_fictrac(folder, thresh);

%OCT_straight
folder = '12152023/Fly002/OCT_straight'

thresh = 240;

data.fly_12152023_002.OCT_straight = extract_fictrac(folder, thresh);


%% 01182024/Fly001

%ACV_straight
folder = '01182024/Fly001/ACV_straight'

thresh = 50;

data.fly_01182024_001.ACV_straight = extract_fictrac(folder, thresh);

%ACV_right
folder = '01182024/Fly001/ACV_right'

thresh = 180;

data.fly_01182024_001.ACV_right = extract_fictrac(folder, thresh);

%OCT_right
folder = '01182024/Fly001/OCT_right'

thresh = 60;

data.fly_01182024_001.OCT_right = extract_fictrac(folder, thresh);

%OCT_straight
folder = '01182024/Fly001/OCT_straight'

thresh = 7;

data.fly_01182024_001.OCT_straight = extract_fictrac(folder, thresh);

%% 01242024/Fly003

%ACV_straight
folder = '01242024/Fly003/ACV_straight'

thresh = 80;

data.fly01242024_003.ACV_straight = extract_fictrac(folder, thresh);

%ACV_left
folder = '01242024/Fly003/ACV_left'

thresh = 80;

data.fly01242024_003.ACV_left = extract_fictrac(folder, thresh);

%OCT_left

folder = '01242024/Fly003/OCT_left'

thresh = 80;

data.fly01242024_003.OCT_left = extract_fictrac(folder, thresh);

%OCT_straight
folder = '01242024/Fly003/ACV_straight'

thresh = 100;

data.fly01242024_003.OCT_straight = extract_fictrac(folder, thresh);

%% 01252024 Fly005
%ACV_straight
folder = '01252024/Fly005/ACV_straight';

thresh = 160;

data.fly01252024_000.ACV_straight = extract_fictrac(folder, thresh);

%ACV_left
folder = '01252024/Fly005/ACV_left';

thresh = 160;

data.fly01252024_000.ACV_left = extract_fictrac(folder, thresh);

%OCT_left

folder = '01252024/Fly005/OCT_left';

thresh = 160;

data.fly01252024_000.OCT_left = extract_fictrac(folder, thresh);

%OCT_straight
folder = '01252024/Fly005/OCT_straight';

thresh = 160;

data.fly01252024_000.OCT_straight = extract_fictrac(folder, thresh);


%% 01252024 Fly008
%ACV_straight
folder = '01252024/Fly008/ACV_straight';

thresh = 150;

data.fly01252024_008.ACV_straight = extract_fictrac(folder, thresh);

%ACV_left
folder = '01252024/Fly008/ACV_left';

thresh = 150;

data.fly01252024_008.ACV_left = extract_fictrac(folder, thresh);

%OCT_left

folder = '01252024/Fly008/OCT_left';

thresh = 150;

data.fly01252024_008.OCT_left = extract_fictrac(folder, thresh);

%OCT_straight
folder = '01252024/Fly008/OCT_straight';

thresh = 150;

data.fly01252024_008.OCT_straight = extract_fictrac(folder, thresh);

%%
save('ACV_vs_octanol_data', 'data')

%%
straight_vs_turn(data, 'movspd')

straight_vs_turn(data, 'inthead')

