%% new laser
clear all
close all

%% ImagingData/09192025/fly000
 
folder = 'UPWIN/09192025/fly000/ACV_right';

fed.fly09192025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09192025/fly000/pre';

fed.fly09192025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09192025/fly000/post';

fed.fly09192025_000.post_right = extract_fictrac(folder);

fed.fly09192025_000.post_right.paired_odor = "oct";
fed.fly09192025_000.pre_right.paired_odor = "oct";

folder = 'UPWIN/09192025/fly000';
bad_trials = [];

fed.fly09192025_000 = extract_fluorescence(fed.fly09192025_000, folder, bad_trials)


%% ImagingData/09192025/fly001
 
folder = 'UPWIN/09192025/fly001/ACV_right';

fed.fly09192025_001.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09192025/fly001/pre';

fed.fly09192025_001.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09192025/fly001/post';

fed.fly09192025_001.post_right = extract_fictrac(folder);

fed.fly09192025_001.post_right.paired_odor = "mch";
fed.fly09192025_001.pre_right.paired_odor = "mch";

folder = 'UPWIN/09192025/fly001';
bad_trials = [];

fed.fly09192025_001 = extract_fluorescence(fed.fly09192025_001, folder, bad_trials)
%% ImagingData/09222025/fly000
 
folder = 'UPWIN/09222025/fly000/ACV_right';

fed.fly09222025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09222025/fly000/pre';

fed.fly09222025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09222025/fly000/post';

fed.fly09222025_000.post_right = extract_fictrac(folder);

fed.fly09222025_000.post_right.paired_odor = "oct";
fed.fly09222025_000.pre_right.paired_odor = "oct";

folder = 'UPWIN/09222025/fly000';
bad_trials = [];

fed.fly09222025_000 = extract_fluorescence(fed.fly09222025_000, folder, bad_trials)

%% ImagingData/09232025/fly001
 
folder = 'UPWIN/09232025/fly001/ACV_right';

fed.fly09232025_001.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09232025/fly001/pre';

fed.fly09232025_001.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09232025/fly001/post';

fed.fly09232025_001.post_right = extract_fictrac(folder);

fed.fly09232025_001.post_right.paired_odor = "oct";
fed.fly09232025_001.pre_right.paired_odor = "oct";

folder = 'UPWIN/09232025/fly001';
bad_trials = [];
fed.fly09232025_001 = extract_fluorescence(fed.fly09232025_001, folder, bad_trials)

%% ImagingData/09292025/fly000
 
folder = 'UPWIN/09292025/fly000/ACV_right';

fed.fly09292025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09292025/fly000/pre';

fed.fly09292025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09292025/fly000/post';

fed.fly09292025_000.post_right = extract_fictrac(folder);

fed.fly09292025_000.post_right.paired_odor = "oct";
fed.fly09292025_000.pre_right.paired_odor = "oct";

folder = 'UPWIN/09292025/fly000';
bad_trials = [10];
fed.fly09292025_000 = extract_fluorescence(fed.fly09292025_000, folder, bad_trials)


%%
F_and_beh(fed,'inthead');
F_and_beh(fed,'movspd');
