%% 02202025
% ImagingData/02202025/fly001
% input params, 5 fps, 226 frames, 15 roi size
 
folder = 'UPWIN/02202025/fly001/ACV_left';

data.fly02202025_001.ACV_left = extract_fictrac(folder);
% 
folder = 'UPWIN/02202025/fly001/pre';

data.fly02202025_001.pre = extract_fictrac(folder);
% 
folder = 'UPWIN/02202025/fly001/post';

data.fly02202025_001.post = extract_fictrac(folder);

data.fly02202025_001.post.paired_odor = "mch";
data.fly02202025_001.pre.paired_odor = "mch";

folder = 'UPWIN/02202025/fly001';
data.fly02202025_001 = extract_fluorescence(data.fly02202025_001, folder)

%%
F_and_beh(data,'movspd');
