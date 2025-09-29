%% fed v starved
clear all
close all

% for most of these i did not bother with behavior so it is bad and not
% worth looking at.
%% ImagingData/08142025/fly002
 
folder = 'UPWIN/08142025/fly002/ACV_right';

fed_25.fly08142025_002.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08142025/fly002/pre';

fed_25.fly08142025_002.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08142025/fly002/post';

fed_25.fly08142025_002.post_right = extract_fictrac(folder);

fed_25.fly08142025_002.post_right.paired_odor = "oct";
fed_25.fly08142025_002.pre_right.paired_odor = "oct";

folder = 'UPWIN/08142025/fly002';
bad_trials = [];

fed_25.fly08142025_002 = extract_fluorescence(fed_25.fly08142025_002, folder, bad_trials)

%% ImagingData/08182025/fly000
 
folder = 'UPWIN/08182025/fly000/ACV_right';

fed_25.fly08182025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08182025/fly000/pre';

fed_25.fly08182025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08182025/fly000/post';

fed_25.fly08182025_000.post_right = extract_fictrac(folder);

fed_25.fly08182025_000.post_right.paired_odor = "oct";
fed_25.fly08182025_000.pre_right.paired_odor = "oct";

folder = 'UPWIN/08182025/fly000';
bad_trials = [];

fed_25.fly08182025_000 = extract_fluorescence(fed_25.fly08182025_000, folder, bad_trials)

%% ImagingData/08182025/fly000
 
folder = 'UPWIN/08182025/fly000/ACV_right';

fed_25.fly08182025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08182025/fly000/pre';

fed_25.fly08182025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08182025/fly000/post';

fed_25.fly08182025_000.post_right = extract_fictrac(folder);

fed_25.fly08182025_000.post_right.paired_odor = "oct";
fed_25.fly08182025_000.pre_right.paired_odor = "oct";

folder = 'UPWIN/08182025/fly000';
bad_trials = [];

fed_25.fly08182025_000 = extract_fluorescence(fed_25.fly08182025_000, folder, bad_trials)

%% ImagingData/08192025/fly000
 
folder = 'UPWIN/08192025/fly000/ACV_right';

starved_25.fly08192025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08192025/fly000/pre';

starved_25.fly08192025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08192025/fly000/post';

starved_25.fly08192025_000.post_right = extract_fictrac(folder);

starved_25.fly08192025_000.post_right.paired_odor = "oct";
starved_25.fly08192025_000.pre_right.paired_odor = "oct";

folder = 'UPWIN/08192025/fly000';
bad_trials = [];

starved_25.fly08192025_000 = extract_fluorescence(starved_25.fly08192025_000, folder, bad_trials)

%% ImagingData/08192025/fly001
 
folder = 'UPWIN/08192025/fly001/ACV_right';

starved_25.fly08192025_001.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08192025/fly001/pre';

starved_25.fly08192025_001.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08192025/fly001/post';

starved_25.fly08192025_001.post_right = extract_fictrac(folder);

starved_25.fly08192025_001.post_right.paired_odor = "oct";
starved_25.fly08192025_001.pre_right.paired_odor = "oct";

folder = 'UPWIN/08192025/fly001';
bad_trials = [];

starved_25.fly08192025_001 = extract_fluorescence(starved_25.fly08192025_001, folder, bad_trials)

%% ImagingData/08252025/fly000
 
folder = 'UPWIN/08252025/fly000/ACV_right';

fed_25.fly08252025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08252025/fly000/pre';

fed_25.fly08252025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08252025/fly000/post';

fed_25.fly08252025_000.post_right = extract_fictrac(folder);

fed_25.fly08252025_000.post_right.paired_odor = "oct";
fed_25.fly08252025_000.pre_right.paired_odor = "oct";

folder = 'UPWIN/08252025/fly000';
bad_trials = [];

fed_25.fly08252025_000 = extract_fluorescence(fed_25.fly08252025_000, folder, bad_trials)
%% ImagingData/08252025/fly001
 
folder = 'UPWIN/08252025/fly001/ACV_right';

fed_25.fly08252025_001.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08252025/fly001/pre';

fed_25.fly08252025_001.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08252025/fly001/post';

fed_25.fly08252025_001.post_right = extract_fictrac(folder);

fed_25.fly08252025_001.post_right.paired_odor = "mch";
fed_25.fly08252025_001.pre_right.paired_odor = "mch";

folder = 'UPWIN/08252025/fly001';
bad_trials = [];

fed_25.fly08252025_001 = extract_fluorescence(fed_25.fly08252025_001, folder, bad_trials)

%% ImagingData/08272025/fly000  dendrite
%  
% folder = 'UPWIN/08272025/fly000/ACV_right';
% 
% starved_25.fly08272025_000.ACV_right = extract_fictrac(folder);
% % 
% folder = 'UPWIN/08272025/fly000/pre';
% 
% starved_25.fly08272025_000.pre_right = extract_fictrac(folder);
% % 
% folder = 'UPWIN/08272025/fly000/post';
% 
% starved_25.fly08272025_000.post_right = extract_fictrac(folder);
% 
% starved_25.fly08272025_000.post_right.paired_odor = "oct";
% starved_25.fly08272025_000.pre_right.paired_odor = "oct";
% 
% folder = 'UPWIN/08272025/fly000';
% bad_trials = [];
% 
% starved_25.fly08272025_000 = extract_fluorescence(starved_25.fly08272025_000, folder, bad_trials)
%% ImagingData/08272025/fly001
 
folder = 'UPWIN/08272025/fly001/ACV_right';

starved_25.fly08272025_001.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08272025/fly001/pre';

starved_25.fly08272025_001.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/08272025/fly001/post';

starved_25.fly08272025_001.post_right = extract_fictrac(folder);

starved_25.fly08272025_001.post_right.paired_odor = "mch";
starved_25.fly08272025_001.pre_right.paired_odor = "mch";

folder = 'UPWIN/08272025/fly001';
bad_trials = [];

starved_25.fly08272025_001 = extract_fluorescence(starved_25.fly08272025_001, folder, bad_trials)

%% ImagingData/09012025/fly000
 
folder = 'UPWIN/09012025/fly000/ACV_right';

fed_25.fly09012025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09012025/fly000/pre';

fed_25.fly09012025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09012025/fly000/post';

fed_25.fly09012025_000.post_right = extract_fictrac(folder);

fed_25.fly09012025_000.post_right.paired_odor = "mch";
fed_25.fly09012025_000.pre_right.paired_odor = "mch";

folder = 'UPWIN/09012025/fly000';
bad_trials = [];

fed_25.fly09012025_000 = extract_fluorescence(fed_25.fly09012025_000, folder, bad_trials)
% %% ImagingData/09012025/fly001  dendrite that fades quickly
%  
% folder = 'UPWIN/09012025/fly001/ACV_right';
% 
% fed_25.fly09012025_001.ACV_right = extract_fictrac(folder);
% % 
% folder = 'UPWIN/09012025/fly001/pre';
% 
% fed_25.fly09012025_001.pre_right = extract_fictrac(folder);
% % 
% folder = 'UPWIN/09012025/fly001/post';
% 
% fed_25.fly09012025_001.post_right = extract_fictrac(folder);
% 
% fed_25.fly09012025_001.post_right.paired_odor = "mch";
% fed_25.fly09012025_001.pre_right.paired_odor = "mch";
% 
% folder = 'UPWIN/09012025/fly001';
% bad_trials = [];
% 
% fed_25.fly09012025_001 = extract_fluorescence(fed_25.fly09012025_001, folder, bad_trials)

%% ImagingData/09022025/fly000
 
folder = 'UPWIN/09022025/fly000/ACV_right';

starved_25.fly09022025_000.ACV_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09022025/fly000/pre';

starved_25.fly09022025_000.pre_right = extract_fictrac(folder);
% 
folder = 'UPWIN/09022025/fly000/post';

starved_25.fly09022025_000.post_right = extract_fictrac(folder);

starved_25.fly09022025_000.post_right.paired_odor = "mch";
starved_25.fly09022025_000.pre_right.paired_odor = "mch";

folder = 'UPWIN/09022025/fly000';
bad_trials = [];

starved_25.fly09022025_000 = extract_fluorescence(starved_25.fly09022025_000, folder, bad_trials)


%%
F_and_beh(fed_25,'inthead');
F_and_beh(starved_25,'inthead');
