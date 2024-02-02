%% ACV_vs octanol analysis

%% 12062023/Fly004
% ACV_straight

fictrac_dat = '12062023/Fly004/ACV_straight/fictrac-20231206_161441.dat';
fictrac_txt = '12062023/Fly004/ACV_straight/v.txt';
fictrac_stim_csv = '12062023/Fly004/ACV_straight/Results.csv';
thresh = 210;

data.fly_12062023.ACV_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv,thresh);

%ACV_right

fictrac_dat = '12062023/Fly004/ACV_right/fictrac-20231206_165208.dat';
fictrac_txt = '12062023/Fly004/ACV_right/fictrac-vidLogFrames-20231206_165208.txt';
fictrac_stim_csv = '12062023/Fly004/ACV_right/Results.csv';
thresh = 210;

data.fly_12062023.ACV_right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv,thresh);

%OCT_right

fictrac_dat = '12062023/Fly004/OCT_right/fictrac-20231206_163941.dat';
fictrac_txt = '12062023/Fly004/OCT_right/fictrac-vidLogFrames-20231206_163941.txt';
fictrac_stim_csv = '12062023/Fly004/OCT_right/Results.csv';
thresh = 210;

data.fly_12062023.OCT_right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%OCT_straight
fictrac_dat = '12062023/Fly004/OCT_straight/fictrac-20231206_162655.dat';
fictrac_txt = '12062023/Fly004/OCT_straight/fictrac-vidLogFrames-20231206_162655.txt';
fictrac_stim_csv = '12062023/Fly004/OCT_straight/Results.csv';
thresh = 210;

data.fly_12062023.OCT_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%% 12152023/Fly002

%ACV_straight
fictrac_dat = '12152023/Fly002/ACV_straight/fictrac-20231215_110935.dat';
fictrac_txt = '12152023/Fly002/ACV_straight/fictrac-vidLogFrames-20231215_110935.txt';
fictrac_stim_csv = '12152023/Fly002/ACV_straight/Results.csv';
thresh = 240;

data.fly_12152023_002.ACV_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%ACV_right
fictrac_dat = '12152023/Fly002/ACV_right/fictrac-20231215_112308.dat';
fictrac_txt = '12152023/Fly002/ACV_right/fictrac-vidLogFrames-20231215_112308.txt';
fictrac_stim_csv = '12152023/Fly002/ACV_right/Results.csv';
thresh = 237;

data.fly_12152023_002.ACV_right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%OCT_right

fictrac_dat = '12152023/Fly002/OCT_right/fictrac-20231215_113725.dat';
fictrac_txt = '12152023/Fly002/OCT_right/fictrac-vidLogFrames-20231215_113725.txt';
fictrac_stim_csv = '12152023/Fly002/OCT_right/Results.csv';
thresh = 240;

data.fly_12152023_002.OCT_right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%OCT_straight
fictrac_dat = '12152023/Fly002/OCT_straight/fictrac-20231215_115106.dat';
fictrac_txt = '12152023/Fly002/OCT_straight/fictrac-vidLogFrames-20231215_115106.txt';
fictrac_stim_csv = '12152023/Fly002/OCT_straight/Results.csv';
thresh = 240;

data.fly_12152023_002.OCT_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);



%% 01182024/Fly001

%ACV_straight
fictrac_dat = '01182024/Fly001/ACV_straight/fictrac-20240118_121749.dat';
fictrac_txt = '01182024/Fly001/ACV_straight/fictrac-vidLogFrames-20240118_121749.txt';
fictrac_stim_csv = '01182024/Fly001/ACV_straight/Results.csv';
thresh = 50;

data.fly_01182024_001.ACV_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%ACV_right
fictrac_dat = '01182024/Fly001/ACV_right/fictrac-20240118_123559.dat';
fictrac_txt = '01182024/Fly001/ACV_right/fictrac-vidLogFrames-20240118_123559.txt';
fictrac_stim_csv = '01182024/Fly001/ACV_right/Results.csv';
thresh = 180;

data.fly_01182024_001.ACV_right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%OCT_right

fictrac_dat = '01182024/Fly001/OCT_right/fictrac-20240118_132557.dat';
fictrac_txt = '01182024/Fly001/OCT_right/fictrac-vidLogFrames-20240118_132557.txt';
fictrac_stim_csv = '01182024/Fly001/OCT_right/Results.csv';
thresh = 60;

data.fly_01182024_001.OCT_right = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%OCT_straight
fictrac_dat = '01182024/Fly001/OCT_straight/fictrac-20240118_130255.dat';
fictrac_txt = '01182024/Fly001/OCT_straight/fictrac-vidLogFrames-20240118_130255.txt';
fictrac_stim_csv = '01182024/Fly001/OCT_straight/Results.csv';
thresh = 7;

data.fly_01182024_001.OCT_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%% 01242024/Fly003

%ACV_straight
fictrac_dat = '01242024/Fly003/ACV_straight/fictrac-20240124_153528.dat';
fictrac_txt = '01242024/Fly003/ACV_straight/fictrac-vidLogFrames-20240124_153528.txt';
fictrac_stim_csv = '01242024/Fly003/ACV_straight/Results.csv';
thresh = 80;

data.fly01242024_003.ACV_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%ACV_left
fictrac_dat = '01242024/Fly003/ACV_left/fictrac-20240124_155201.dat';
fictrac_txt = '01242024/Fly003/ACV_left/fictrac-vidLogFrames-20240124_155201.txt';
fictrac_stim_csv = '01242024/Fly003/ACV_left/Results.csv';
thresh = 80;

data.fly01242024_003.ACV_left = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%OCT_left

fictrac_dat = '01242024/Fly003/OCT_left/fictrac-20240124_161820.dat';
fictrac_txt = '01242024/Fly003/OCT_left/fictrac-vidLogFrames-20240124_161820.txt';
fictrac_stim_csv = '01242024/Fly003/OCT_left/Results.csv';
thresh = 80;

data.fly01242024_003.OCT_left = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);

%OCT_straight
fictrac_dat = '01242024/Fly003/OCT_straight/fictrac-20240124_160606.dat';
fictrac_txt = '01242024/Fly003/OCT_straight/fictrac-vidLogFrames-20240124_160606.txt';
fictrac_stim_csv = '01242024/Fly003/OCT_straight/Results.csv';
thresh = 100;

data.fly01242024_003.OCT_straight = extract_fictrac(fictrac_dat, fictrac_txt, fictrac_stim_csv, thresh);



%%
straight_vs_turn(data, 'movspd')

straight_vs_turn(data, 'inthead')
