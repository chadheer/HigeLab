%% Pairing with control flies
clear all 
close all
%% 07122024 001
% odor_pairing/07122024/Fly001/

folder = 'odor_pairing/07122024/fly001/ACV_left';

ret.fly07122024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/07122024/fly001/pre_pairing';

ret.fly07122024_001.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/07122024/fly001/post_pairing';

ret.fly07122024_001.post_pairing_left = extract_fictrac(folder);

ret.fly07122024_001.post_pairing_left.paired_odor = "OCT";
ret.fly07122024_001.pre_pairing_left.paired_odor = "OCT";

%% 07122024 002
% odor_pairing/07122024/Fly002/

folder = 'odor_pairing/07122024/fly002/ACV_left';

ret.fly07122024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/07122024/fly002/pre_pairing';

ret.fly07122024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/07122024/fly002/post_pairing';

ret.fly07122024_002.post_pairing_left = extract_fictrac(folder);

ret.fly07122024_002.pre_pairing_left.paired_odor = "MCH";
ret.fly07122024_002.post_pairing_left.paired_odor = "MCH";


%% 07122024 003
% odor_pairing/07122024/Fly003/

folder = 'odor_pairing/07122024/fly003/ACV_left';

ret.fly07122024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/07122024/fly003/pre_pairing';

ret.fly07122024_003.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/07122024/fly003/post_pairing';

ret.fly07122024_003.post_pairing_left = extract_fictrac(folder);

ret.fly07122024_003.pre_pairing_left.paired_odor = "MCH";
ret.fly07122024_003.post_pairing_left.paired_odor = "MCH";


%% 07122024 004
% odor_pairing/07122024/Fly004/

folder = 'odor_pairing/07122024/fly004/ACV_right';

ret.fly07122024_004.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/07122024/fly004/pre_pairing';

ret.fly07122024_004.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/07122024/fly004/post_pairing';

ret.fly07122024_004.post_pairing_right = extract_fictrac(folder);

ret.fly07122024_004.pre_pairing_right.paired_odor = "MCH";
ret.fly07122024_004.post_pairing_right.paired_odor = "MCH";

%% 07122024 005
% odor_pairing/07122024/Fly005/

folder = 'odor_pairing/07122024/fly005/ACV_right';

ret.fly07122024_005.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/07122024/fly005/pre_pairing';

ret.fly07122024_005.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/07122024/fly005/post_pairing';

ret.fly07122024_005.post_pairing_right = extract_fictrac(folder);

ret.fly07122024_005.pre_pairing_right.paired_odor = "OCT";
ret.fly07122024_005.post_pairing_right.paired_odor = "OCT";

%% 07122024 007
% odor_pairing/07122024/Fly007/

folder = 'odor_pairing/07122024/fly007/ACV_right';

ret.fly07122024_007.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/07122024/fly007/pre_pairing';

ret.fly07122024_007.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/07122024/fly007/post_pairing';

ret.fly07122024_007.post_pairing_right = extract_fictrac(folder);

ret.fly07122024_007.pre_pairing_right.paired_odor = "MCH";
ret.fly07122024_007.post_pairing_right.paired_odor = "MCH";

%% 07162024 002
% odor_pairing/07162024/Fly002/

folder = 'odor_pairing/07162024/fly002/ACV_left';

ret.fly07162024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/07162024/fly002/pre_pairing';

ret.fly07162024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/07162024/fly002/post_pairing';

ret.fly07162024_002.post_pairing_left = extract_fictrac(folder);

ret.fly07162024_002.pre_pairing_left.paired_odor = "OCT";
ret.fly07162024_002.post_pairing_left.paired_odor = "OCT";

%% 07162024 003
% odor_pairing/07162024/fly003/

folder = 'odor_pairing/07162024/fly003/ACV_left';

ret.fly07162024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/07162024/fly003/pre_pairing';

ret.fly07162024_003.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/07162024/fly003/post_pairing';

ret.fly07162024_003.post_pairing_left = extract_fictrac(folder);

ret.fly07162024_003.pre_pairing_left.paired_odor = "MCH";
ret.fly07162024_003.post_pairing_left.paired_odor = "MCH";

%% 07162024 004
% odor_pairing/07162024/fly004/

folder = 'odor_pairing/07162024/fly004/ACV_left';

control.fly07162024_004.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/07162024/fly004/pre_pairing';

control.fly07162024_004.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/07162024/fly004/post_pairing';

control.fly07162024_004.post_pairing_left = extract_fictrac(folder);

control.fly07162024_004.pre_pairing_left.paired_odor = "MCH";
control.fly07162024_004.post_pairing_left.paired_odor = "MCH";

%%
save('July_analysis', "ret");

%%

straight_vs_turn(ret, ['inthead'])

straight_vs_turn(ret, ['movspd'])




