%% PairingProtocols
clear all
close all

%% objective version of Daichi's method
% ImagingData/06042025/fly000
 
folder = 'UPWIN/06042025/fly000/ACV_right';

daichi.fly06042025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06042025/fly000/pre';

daichi.fly06042025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06042025/fly000/post';

daichi.fly06042025_000.post_right = extract_fictrac(folder);

daichi.fly06042025_000.post_right.paired_odor = "oct";
daichi.fly06042025_000.pre_right.paired_odor = "oct";

folder = 'UPWIN/06042025/fly000';
bad_trials = [12,25];
daichi.fly06042025_000 = extract_fluorescence(daichi.fly06042025_000, folder, bad_trials)


%% Daichi's method
% ImagingData/06052025/fly000
 
folder = 'UPWIN/06052025/fly001/ACV_right';

daichi.fly06052025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06052025/fly001/pre';

daichi.fly06052025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06052025/fly001/post';

daichi.fly06052025_000.post_right = extract_fictrac(folder);

daichi.fly06052025_000.post_right.paired_odor = "mch";
daichi.fly06052025_000.pre_right.paired_odor = "mch";

folder = 'UPWIN/06052025/fly000';
bad_trials = [12,25];
daichi.fly06052025_000 = extract_fluorescence(daichi.fly06052025_000, folder, bad_trials)

%% Daichi's method
% ImagingData/06052025/fly001
 
folder = 'UPWIN/06052025/fly001/ACV_right';

daichi.fly06052025_001.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06052025/fly001/pre';

daichi.fly06052025_001.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06052025/fly001/post';

daichi.fly06052025_001.post_right = extract_fictrac(folder);

daichi.fly06052025_001.post_right.paired_odor = "oct";
daichi.fly06052025_001.pre_right.paired_odor = "oct";

folder = 'UPWIN/06052025/fly000';
bad_trials = [12,25];
daichi.fly06052025_001 = extract_fluorescence(daichi.fly06052025_001, folder, bad_trials)
%% objective version of Daichi's method
% ImagingData/06092025/fly000
 
folder = 'UPWIN/06092025/fly000/ACV_right';

objective.fly06092025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06092025/fly000/pre';

objective.fly06092025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06092025/fly000/post';

objective.fly06092025_000.post_right = extract_fictrac(folder);

objective.fly06092025_000.post_right.paired_odor = "oct";
objective.fly06092025_000.pre_right.paired_odor = "oct";

folder = 'UPWIN/06092025/fly000';
bad_trials = [6,14,25];
objective.fly06092025_000 = extract_fluorescence(objective.fly06092025_000, folder, bad_trials)

%% objective version of Daichi's method
% ImagingData/06112025/fly001
 
folder = 'UPWIN/06112025/fly001/ACV_right';

objective.fly06112025_001.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06112025/fly001/pre';

objective.fly06112025_001.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06112025/fly001/post';

objective.fly06112025_001.post_right = extract_fictrac(folder);

objective.fly06112025_001.post_right.paired_odor = "oct";
objective.fly06112025_001.pre_right.paired_odor = "oct";

folder = 'UPWIN/06112025/fly001';
bad_trials = [6,17,18];
objective.fly06112025_001 = extract_fluorescence(objective.fly06112025_001, folder, bad_trials)

%% objective version of Daichi's method
% ImagingData/06112025/fly002
 
folder = 'UPWIN/06112025/fly002/ACV_right';

objective.fly06112025_002.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06112025/fly002/pre';

objective.fly06112025_002.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06112025/fly002/post';

objective.fly06112025_002.post_right = extract_fictrac(folder);

objective.fly06112025_002.post_right.paired_odor = "mch";
objective.fly06112025_002.pre_right.paired_odor = "mch";

folder = 'UPWIN/06112025/fly002';
bad_trials = [];
objective.fly06112025_002 = extract_fluorescence(objective.fly06112025_002, folder, bad_trials)


%% Short version of Daichi's method
% ImagingData/06122025/fly001
 
folder = 'UPWIN/06122025/fly001/ACV_right';

short.fly06122025_001.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06122025/fly001/pre';

short.fly06122025_001.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06122025/fly001/post';

short.fly06122025_001.post_right = extract_fictrac(folder);

short.fly06122025_001.post_right.paired_odor = "mch";
short.fly06122025_001.pre_right.paired_odor = "mch";

folder = 'UPWIN/06122025/fly001';
bad_trials = [];
short.fly06122025_001 = extract_fluorescence(short.fly06122025_001, folder, bad_trials)

% %% Short version of Daichi's method
% % ImagingData/06122025/fly001
%  
% folder = 'UPWIN/06122025/fly001/ACV_right';
% 
% short.fly06122025_001.ACV_right = extract_fictrac(folder);
% % 
% folder = 'UPWIN/06122025/fly001/pre';
% 
% short.fly06122025_001.pre_right = extract_fictrac(folder);
% % 
% folder = 'UPWIN/06122025/fly001/post';
% 
% short.fly06122025_001.post_right = extract_fictrac(folder);
% 
% short.fly06122025_001.post_right.paired_odor = "mch";
% short.fly06122025_001.pre_right.paired_odor = "mch";
% 
% folder = 'UPWIN/06122025/fly001';
% bad_trials = [];
% short.fly06122025_001 = extract_fluorescence(short.fly06122025_001, folder, bad_trials)
%% Short version of Daichi's method
% ImagingData/06132025/fly002
 
folder = 'UPWIN/06162025/fly002/ACV_right';

short.fly06162025_002.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06162025/fly002/pre';

short.fly06162025_002.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06162025/fly002/post';

short.fly06162025_002.post_right = extract_fictrac(folder);

short.fly06162025_002.post_right.paired_odor = "oct";
short.fly06162025_002.pre_right.paired_odor = "oct";

folder = 'UPWIN/06162025/fly002';
bad_trials = [];
short.fly06162025_002 = extract_fluorescence(short.fly06162025_002, folder, bad_trials)



%% Short version of Daichi's method
% ImagingData/06162025/fly003
 
folder = 'UPWIN/06162025/fly003/ACV_right';

short.fly06162025_003.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06162025/fly003/pre';

short.fly06162025_003.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06162025/fly003/post';

short.fly06162025_003.post_right = extract_fictrac(folder);

short.fly06162025_003.post_right.paired_odor = "mch";
short.fly06162025_003.pre_right.paired_odor = "mch";

folder = 'UPWIN/06162025/fly003';
bad_trials = [];
short.fly06162025_003 = extract_fluorescence(short.fly06162025_003, folder, bad_trials)

%% Drew's pairing
% ImagingData/06182025/fly000
 
folder = 'UPWIN/06182025/fly000/ACV_right';

drew.fly06182025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06182025/fly000/pre';

drew.fly06182025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06182025/fly000/post';

drew.fly06182025_000.post_right = extract_fictrac(folder);

drew.fly06182025_000.post_right.paired_odor = "oct";
drew.fly06182025_000.pre_right.paired_odor = "oct";

folder = 'UPWIN/06182025/fly000';
bad_trials = [];
drew.fly06182025_000 = extract_fluorescence(drew.fly06182025_000, folder, bad_trials)

%% Drew's pairing
% ImagingData/06182025/fly002
 
folder = 'UPWIN/06182025/fly002/ACV_right';

drew.fly06182025_002.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06182025/fly002/pre';

drew.fly06182025_002.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06182025/fly002/post';

drew.fly06182025_002.post_right = extract_fictrac(folder);

drew.fly06182025_002.post_right.paired_odor = "oct";
drew.fly06182025_002.pre_right.paired_odor = "oct";

folder = 'UPWIN/06182025/fly002';
bad_trials = [4];
drew.fly06182025_002 = extract_fluorescence(drew.fly06182025_002, folder, bad_trials)

%% Drew's pairing
% ImagingData/06192025/fly000
 
folder = 'UPWIN/06192025/fly000/ACV_right';

drew.fly06192025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06192025/fly000/pre';

drew.fly06192025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06192025/fly000/post';

drew.fly06192025_000.post_right = extract_fictrac(folder);

drew.fly06192025_000.post_right.paired_odor = "mch";
drew.fly06192025_000.pre_right.paired_odor = "mch";

folder = 'UPWIN/06192025/fly000';
bad_trials = [6,9,17];
drew.fly06192025_000 = extract_fluorescence(drew.fly06192025_000, folder, bad_trials)
%% Drew's pairing
% ImagingData/06192025/fly001
 
folder = 'UPWIN/06192025/fly001/ACV_right';

drew.fly06192025_001.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06192025/fly001/pre';

drew.fly06192025_001.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06192025/fly001/post';

drew.fly06192025_001.post_right = extract_fictrac(folder);

drew.fly06192025_001.post_right.paired_odor = "oct";
drew.fly06192025_001.pre_right.paired_odor = "oct";

folder = 'UPWIN/06192025/fly001';
bad_trials = [18,20];
drew.fly06192025_001 = extract_fluorescence(drew.fly06192025_001, folder, bad_trials)


%% Drew's pairing
% ImagingData/06242025/fly001
 
folder = 'UPWIN/06242025/fly001/ACV_right';

drew.fly06242025_001.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06242025/fly001/pre';

drew.fly06242025_001.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06242025/fly001/post';

drew.fly06242025_001.post_right = extract_fictrac(folder);

drew.fly06242025_001.post_right.paired_odor = "oct";
drew.fly06242025_001.pre_right.paired_odor = "oct";

folder = 'UPWIN/06242025/fly001';
bad_trials = [23];
drew.fly06242025_001 = extract_fluorescence(drew.fly06242025_001, folder, bad_trials)

%% Drew's pairing
% ImagingData/06262025/fly000
 
folder = 'UPWIN/06262025/fly000/ACV_right';

drew.fly06262025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06262025/fly000/pre';

drew.fly06262025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/06262025/fly000/post';

drew.fly06262025_000.post_right = extract_fictrac(folder);

drew.fly06262025_000.post_right.paired_odor = "mch";
drew.fly06262025_000.pre_right.paired_odor = "mch";

folder = 'UPWIN/06262025/fly000';
bad_trials = [13,14,22,23];
drew.fly06262025_000 = extract_fluorescence(drew.fly06262025_000, folder, bad_trials)



%%
% ImagingData/08202025/fly000
 
folder = 'UPWIN/08202025/fly000/ACV_right';

data.fly08202025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08202025/fly000/pre';

data.fly08202025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08202025/fly000/post';

data.fly08202025_000.post_right = extract_fictrac(folder);

data.fly08202025_000.post_right.paired_odor = "mch";
data.fly08202025_000.pre_right.paired_odor = "mch";

folder = 'UPWIN/08202025/fly000';
bad_trials = [];
data.fly08202025_000 = extract_fluorescence(data.fly08202025_000, folder, bad_trials)
%%
% ImagingData/08202025/fly001
 
folder = 'UPWIN/08202025/fly001/ACV_right';

data.fly08202025_001.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08202025/fly001/pre';

data.fly08202025_001.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08202025/fly001/post';

data.fly08202025_001.post_right = extract_fictrac(folder);

data.fly08202025_001.post_right.paired_odor = "oct";
data.fly08202025_001.pre_right.paired_odor = "oct";

folder = 'UPWIN/08202025/fly001';
bad_trials = [];
data.fly08202025_001 = extract_fluorescence(data.fly08202025_001, folder, bad_trials)
%%
F_and_beh(data,'inthead');
F_and_beh(data,'movspd');

F_and_beh(objective,'inthead');
F_and_beh(objective,'movspd');

F_and_beh(short,'inthead');
F_and_beh(short,'movspd');

F_and_beh(drew,'inthead');
F_and_beh(drew,'movspd');


%%
straight_vs_turn(short, "movspd")
straight_vs_turn(short, "inthead")
