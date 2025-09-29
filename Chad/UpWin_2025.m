% %% 02132025 exclude because it was multiplane
% % ImagingData/02132025/fly001
% % input params, 5 fps, 226 frames, 15 roi size
%  
% folder = 'UPWIN/02132025/fly001/ACV_left';
% 
% data.fly02132025_001.ACV_left = extract_fictrac(folder);
% % 
% folder = 'UPWIN/02132025/fly001/pre';
% 
% data.fly02132025_001.pre_left = extract_fictrac(folder);
% % 
% folder = 'UPWIN/02132025/fly001/post';
% 
% data.fly02132025_001.post_left = extract_fictrac(folder);
% 
% data.fly02132025_001.post_left.paired_odor = "oct";
% data.fly02132025_001.pre_left.paired_odor = "oct";
% 
% folder = 'UPWIN/02132025/fly001';
% data.fly02132025_001 = extract_fluorescence(data.fly02132025_001, folder)

%% 02202025
% ImagingData/02202025/fly001 
% sig turning
 
folder = 'UPWIN/02202025/fly001/ACV_left';

data.fly02202025_001.ACV_left = extract_fictrac(folder);
% 
folder = 'UPWIN/02202025/fly001/pre';

data.fly02202025_001.pre_left = extract_fictrac(folder);
% 
folder = 'UPWIN/02202025/fly001/post';

data.fly02202025_001.post_left = extract_fictrac(folder);

data.fly02202025_001.post_left.paired_odor = "mch";
data.fly02202025_001.pre_left.paired_odor = "mch";

bad_trials = [];
folder = 'UPWIN/02202025/fly001';
data.fly02202025_001 = extract_fluorescence(data.fly02202025_001, folder,bad_trials)

%% 03112025
% ImagingData/03112025/fly001
% input params, 5 fps, 226 frames, 15 roi size
 
folder = 'UPWIN/03112025/fly001/ACV_left';

data.fly03112025_001.ACV_left = extract_fictrac(folder);
% 
folder = 'UPWIN/03112025/fly001/pre';

data.fly03112025_001.pre_left = extract_fictrac(folder);
% 
folder = 'UPWIN/03112025/fly001/post';

data.fly03112025_001.post_left = extract_fictrac(folder);

data.fly03112025_001.post_left.paired_odor = "oct";
data.fly03112025_001.pre_left.paired_odor = "oct";


bad_trials = [8,11,12,18];
folder = 'UPWIN/03112025/fly001';
data.fly03112025_001 = extract_fluorescence(data.fly03112025_001, folder,bad_trials)

%% 03112025
% ImagingData/03112025/fly003
% input params, 5 fps, 226 frames, 15 roi size
 
folder = 'UPWIN/03112025/fly003/ACV_left';

data.fly03112025_003.ACV_left = extract_fictrac(folder);
% 
folder = 'UPWIN/03112025/fly003/pre';

data.fly03112025_003.pre_left = extract_fictrac(folder);
% 
folder = 'UPWIN/03112025/fly003/post';

data.fly03112025_003.post_left = extract_fictrac(folder);

data.fly03112025_003.post_left.paired_odor = "oct";
data.fly03112025_003.pre_left.paired_odor = "oct";

bad_trials = [5,6,9];
folder = 'UPWIN/03112025/fly003';
data.fly03112025_003 = extract_fluorescence(data.fly03112025_003, folder,bad_trials)

%% 03132025
% ImagingData/03132025/fly001
% input params, 5 fps, 226 frames, 15 roi size
 
folder = 'UPWIN/03132025/fly001/ACV_left';

data.fly03132025_001.ACV_left = extract_fictrac(folder);
% 
folder = 'UPWIN/03132025/fly001/pre';

data.fly03132025_001.pre_left = extract_fictrac(folder);
% 
folder = 'UPWIN/03132025/fly001/post';

data.fly03132025_001.post_left = extract_fictrac(folder);

data.fly03132025_001.post_left.paired_odor = "oct";
data.fly03132025_001.pre_left.paired_odor = "oct";

folder = 'UPWIN/03132025/fly001';
bad_trials = [6,7,22,23];
data.fly03132025_001 = extract_fluorescence(data.fly03132025_001, folder, bad_trials)

% % % 03132025
% % ImagingData/03132025/fly002
% % input params, 5 fps, 226 frames, 15 roi size
%  
% folder = 'UPWIN/03132025/fly002/ACV_left';
% 
% data.fly03132025_002.ACV_left = extract_fictrac(folder);
% % 
% folder = 'UPWIN/03132025/fly002/pre';
% 
% data.fly03132025_002.pre_left = extract_fictrac(folder);
% % 
% folder = 'UPWIN/03132025/fly002/post';
% 
% data.fly03132025_002.post_left = extract_fictrac(folder);
% 
% data.fly03132025_002.post_left.paired_odor = "oct";
% data.fly03132025_002.pre_left.paired_odor = "oct";
% 
% folder = 'UPWIN/03132025/fly002';
% data.fly03132025_002 = extract_fluorescence(data.fly03132025_002, folder)

% %% 03212025
% % ImagingData/03212025/fly000
% % input params, 5 fps, 226 frames, 15 roi size
%  
% folder = 'UPWIN/03212025/fly000/ACV_left';
% 
% data.fly03252025_000.ACV_left = extract_fictrac(folder);
% % 
% folder = 'UPWIN/03212025/fly000/pre';
% 
% data.fly03252025_000.pre_left = extract_fictrac(folder);
% % 
% folder = 'UPWIN/03212025/fly000/post';
% 
% data.fly03252025_000.post_left = extract_fictrac(folder);
% 
% data.fly03252025_000.post_left.paired_odor = "oct";
% data.fly03252025_000.pre_left.paired_odor = "oct";
% 
% folder = 'UPWIN/03212025/fly000';
% bad_trials = [];
% data.fly03252025_000 = extract_fluorescence(data.fly03252025_000, folder, bad_trials)

%% 04012025
% ImagingData/04012025/fly002
 
folder = 'UPWIN/04012025/fly002/ACV_left';

data.fly04012025_002.ACV_left = extract_fictrac(folder);
% 
folder = 'UPWIN/04012025/fly002/pre';

data.fly04012025_002.pre_left = extract_fictrac(folder);
% 
folder = 'UPWIN/04012025/fly002/post';

data.fly04012025_002.post_left = extract_fictrac(folder);

data.fly04012025_002.post_left.paired_odor = "oct";
data.fly04012025_002.pre_left.paired_odor = "oct";

folder = 'UPWIN/04012025/fly002';
bad_trials = [];
data.fly04012025_002 = extract_fluorescence(data.fly04012025_002, folder, bad_trials)
%%
save('upwin2025')

F_and_beh(data,'inthead');

%%
straight_vs_turn(data, "movspd")
straight_vs_turn(data, "inthead")

