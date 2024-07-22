%% 04162024
clear all 
close all
%% 04162024 000
% odor_pairing/04162024/Fly001/

folder = 'odor_pairing/04162024/Fly000/ACV_right';

data.fly04162024_000.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04162024/Fly000/pre_pairing';

data.fly04162024_000.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04162024/Fly000/post_pairing';

data.fly04162024_000.post_pairing_right = extract_fictrac(folder);

data.fly04162024_000.post_pairing_right.paired_odor = "OCT";
data.fly04162024_000.pre_pairing_right.paired_odor = "OCT";

%% 04162024 001
% odor_pairing/04162024/Fly001/

folder = 'odor_pairing/04162024/Fly001/ACV_right';

data.fly04162024_001.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04162024/Fly001/pre_pairing';

data.fly04162024_001.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04162024/Fly001/post_pairing';

data.fly04162024_001.post_pairing_right = extract_fictrac(folder);

data.fly04162024_001.post_pairing_right.paired_odor = "MCH";
data.fly04162024_001.pre_pairing_right.paired_odor = "MCH";

%% 04162024 004 some flying
% % odor_pairing/04162024/Fly004/
% 
% folder = 'odor_pairing/04162024/Fly004/ACV_left';
% 
% data.fly04162024_004.ACV_left = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'odor_pairing/04162024/Fly004/pre_pairing';
% 
% data.fly04162024_004.pre_pairing_left = extract_fictrac(folder);
% 
% %post_pairing
% folder = 'odor_pairing/04162024/Fly004/post_pairing';
% 
% data.fly04162024_004.post_pairing_left = extract_fictrac(folder);
% 
% data.fly04162024_004.post_pairing_left.paired_odor = "MCH";
% data.fly04162024_004.pre_pairing_left.paired_odor = "MCH";

%% 04182024 003
% odor_pairing/04182024/Fly003/

folder = 'odor_pairing/04182024/Fly003/ACV_left';

data.fly04182024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04182024/Fly003/pre_pairing';

data.fly04182024_003.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04182024/Fly003/post_pairing';

data.fly04182024_003.post_pairing_left = extract_fictrac(folder);

data.fly04182024_003.post_pairing_left.paired_odor = "MCH";
data.fly04182024_003.pre_pairing_left.paired_odor = "MCH";

%% 04182024 005
% odor_pairing/04182024/Fly005/

folder = 'odor_pairing/04182024/Fly005/ACV_left';

data.fly04182024_005.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04182024/Fly005/pre_pairing';

data.fly04182024_005.pre_pairing_left = extract_fictrac(folder);
 
%post_pairing
folder = 'odor_pairing/04182024/Fly005/post_pairing';

data.fly04182024_005.post_pairing_left = extract_fictrac(folder);

data.fly04182024_005.post_pairing_left.paired_odor = "MCH";
data.fly04182024_005.pre_pairing_left.paired_odor = "MCH";



%% 04292024 001
% odor_pairing/04292024/Fly001/

folder = 'odor_pairing/04292024/Fly001/ACV_right';

data.fly04292024_001.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04292024/Fly001/pre_pairing';

data.fly04292024_001.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04292024/Fly001/post_pairing';

data.fly04292024_001.post_pairing_right = extract_fictrac(folder);

data.fly04292024_001.post_pairing_right.paired_odor = "MCH";
data.fly04292024_001.pre_pairing_right.paired_odor = "MCH";

%% 04292024 003
% odor_pairing/04292024/Fly003/

folder = 'odor_pairing/04292024/Fly003/ACV_right';

data.fly04292024_003.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04292024/Fly003/pre_pairing';

data.fly04292024_003.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04292024/Fly003/post_pairing';

data.fly04292024_003.post_pairing_right = extract_fictrac(folder);

data.fly04292024_003.post_pairing_right.paired_odor = "OCT";
data.fly04292024_003.pre_pairing_right.paired_odor = "OCT";

%% 04292024 004
% odor_pairing/04292024/Fly004/

folder = 'odor_pairing/04292024/Fly004/ACV_right';

data.fly04292024_004.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04292024/Fly004/pre_pairing';

data.fly04292024_004.pre_pairing_right = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04292024/Fly004/post_pairing';

data.fly04292024_004.post_pairing_right = extract_fictrac(folder);

data.fly04292024_004.post_pairing_right.paired_odor = "MCH";
data.fly04292024_004.pre_pairing_right.paired_odor = "MCH";

%% 04292024 005
% odor_pairing/04292024/Fly005/

folder = 'odor_pairing/04292024/Fly005/ACV_left';

data.fly04292024_005.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04292024/Fly005/pre_pairing';

data.fly04292024_005.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04292024/Fly005/post_pairing';

data.fly04292024_005.post_pairing_left = extract_fictrac(folder);

data.fly04292024_005.post_pairing_left.paired_odor = "OCT";
data.fly04292024_005.pre_pairing_left.paired_odor = "OCT";

%% 04292024 006
% odor_pairing/04292024/Fly005/

folder = 'odor_pairing/04292024/Fly006/ACV_left';

data.fly04292024_006.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04292024/Fly006/pre_pairing';

data.fly04292024_006.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04292024/Fly006/post_pairing';

data.fly04292024_006.post_pairing_left = extract_fictrac(folder);

data.fly04292024_006.post_pairing_left.paired_odor = "MCH";
data.fly04292024_006.pre_pairing_left.paired_odor = "MCH";

%% 04292024 007
% odor_pairing/04292024/Fly007/

folder = 'odor_pairing/04292024/Fly007/ACV_left';

data.fly04292024_007.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04292024/Fly007/pre_pairing';

data.fly04292024_007.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04292024/Fly007/post_pairing';

data.fly04292024_007.post_pairing_left = extract_fictrac(folder);

data.fly04292024_007.post_pairing_left.paired_odor = "OCT";
data.fly04292024_007.pre_pairing_left.paired_odor = "OCT";


%% 04252024 001
% odor_pairing/04292024/Fly001/

folder = 'odor_pairing/04252024/Fly001/ACV_left';

data.fly04252024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04252024/Fly001/pre_pairing';

data.fly04252024_001.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04252024/Fly001/post_pairing';

data.fly04252024_001.post_pairing_left= extract_fictrac(folder);

data.fly04252024_001.post_pairing_left.paired_odor = "OCT";
data.fly04252024_001.pre_pairing_left.paired_odor = "OCT";

%% 04252024 002
% odor_pairing/04252024/Fly002/

folder = 'odor_pairing/04252024/Fly002/ACV_left';

data.fly04252024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04252024/Fly002/pre_pairing';

data.fly04252024_002.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04252024/Fly002/post_pairing';

data.fly04252024_002.post_pairing_left= extract_fictrac(folder);

data.fly04252024_002.post_pairing_left.paired_odor = "MCH";
data.fly04252024_002.pre_pairing_left.paired_odor = "MCH";

%% 04252024 003
% odor_pairing/04292024/Fly003/

folder = 'odor_pairing/04252024/Fly003/ACV_left';

data.fly04252024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04252024/Fly003/pre_pairing';

data.fly04252024_003.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04252024/Fly003/post_pairing';

data.fly04252024_003.post_pairing_left= extract_fictrac(folder);

data.fly04252024_003.post_pairing_left.paired_odor = "OCT";
data.fly04252024_003.pre_pairing_left.paired_odor = "OCT";

%% 04252024 005
% odor_pairing/04292024/Fly005/

folder = 'odor_pairing/04252024/Fly005/ACV_left';

data.fly04252024_005.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/04252024/Fly005/pre_pairing';

data.fly04252024_005.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/04252024/Fly005/post_pairing';

data.fly04252024_005.post_pairing_left= extract_fictrac(folder);

data.fly04252024_005.post_pairing_left.paired_odor = "MCH";
data.fly04252024_005.pre_pairing_left.paired_odor = "MCH";


%% 05082024 000
% odor_pairing/04292024/fly000/

folder = 'odor_pairing/05082024/fly000/ACV_left';

data.fly05082024_000.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/05082024/fly000/pre_pairing';

data.fly05082024_000.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/05082024/fly000/post_pairing';

data.fly05082024_000.post_pairing_left= extract_fictrac(folder);

data.fly05082024_000.post_pairing_left.paired_odor = "OCT";
data.fly05082024_000.pre_pairing_left.paired_odor = "OCT";

%% 05082024 001
% odor_pairing/04292024/fly001/

folder = 'odor_pairing/05082024/fly001/ACV_left';

data.fly05082024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/05082024/fly001/pre_pairing';

data.fly05082024_001.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/05082024/fly001/post_pairing';

data.fly05082024_001.post_pairing_left= extract_fictrac(folder);

data.fly05082024_001.post_pairing_left.paired_odor = "MCH";
data.fly05082024_001.pre_pairing_left.paired_odor = "MCH";


%% 05082024 002
% odor_pairing/04292024/fly002/

folder = 'odor_pairing/05082024/fly002/ACV_left';

data.fly05082024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/05082024/fly002/pre_pairing';

data.fly05082024_002.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/05082024/fly002/post_pairing';

data.fly05082024_002.post_pairing_left= extract_fictrac(folder);

data.fly05082024_002.post_pairing_left.paired_odor = "OCT";
data.fly05082024_002.pre_pairing_left.paired_odor = "OCT";

%% 05082024 003
% odor_pairing/04292024/fly003/

folder = 'odor_pairing/05082024/fly003/ACV_left';

data.fly05082024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/05082024/fly003/pre_pairing';

data.fly05082024_003.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/05082024/fly003/post_pairing';

data.fly05082024_003.post_pairing_left= extract_fictrac(folder);

data.fly05082024_003.post_pairing_left.paired_odor = "MCH";
data.fly05082024_003.pre_pairing_left.paired_odor = "MCH";

%%
save('april_may_analysis', "data");

%%

straight_vs_turn(data, ['inthead'])

straight_vs_turn(data, ['movspd'])
