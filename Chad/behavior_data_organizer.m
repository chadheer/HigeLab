%% Pairing with control flies
clear all 
close all
%% 08192024 001
% wd = D:\Thomas\FOBdata\pairing

folder = '08192024/fly001/ACV_left';

ret.fly08192024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = '08192024/fly001/pre';

ret.fly08192024_001.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = '08192024/fly001/post';

ret.fly08192024_001.post_pairing_left = extract_fictrac(folder);

ret.fly08192024_001.post_pairing_left.paired_odor = "OCT";
ret.fly08192024_001.pre_pairing_left.paired_odor = "OCT";

%% 08192024 002
% wd = D:\Thomas\FOBdata\pairing

folder = '08192024/fly002/ACV_left';

ret.fly08192024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = '08192024/fly002/pre';

ret.fly08192024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = '08192024/fly002/post';

ret.fly08192024_002.post_pairing_left = extract_fictrac(folder);

ret.fly08192024_002.post_pairing_left.paired_odor = "OCT";
ret.fly08192024_002.pre_pairing_left.paired_odor = "OCT";




%% 08192024 003
% wd = D:\Thomas\FOBdata\pairing

folder = '08192024/fly003/ACV_left';

ret.fly08192024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = '08192024/fly003/pre';

ret.fly08192024_003.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = '08192024/fly003/post';

ret.fly08192024_003.post_pairing_left = extract_fictrac(folder);

ret.fly08192024_003.post_pairing_left.paired_odor = "OCT";
ret.fly08192024_003.pre_pairing_left.paired_odor = "OCT";

%% 08202024 002
% wd = D:\Thomas\FOBdata\pairing

folder = '08202024/fly002/ACV_left';

ret.fly08202024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = '08202024/fly002/pre';

ret.fly08202024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = '08202024/fly002/post';

ret.fly08202024_002.post_pairing_left = extract_fictrac(folder);

ret.fly08202024_002.post_pairing_left.paired_odor = "OCT";
ret.fly08202024_002.pre_pairing_left.paired_odor = "OCT";

%% 08202024 003
% wd = D:\Thomas\FOBdata\pairing

folder = '08202024/fly003/ACV_left';

ret.fly08202024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = '08202024/fly003/pre';

ret.fly08202024_003.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = '08202024/fly003/post';

ret.fly08202024_003.post_pairing_left = extract_fictrac(folder);

ret.fly08202024_003.post_pairing_left.paired_odor = "OCT";
ret.fly08202024_003.pre_pairing_left.paired_odor = "OCT";

%% 08202024 004
% wd = D:\Thomas\FOBdata\pairing

folder = '08202024/fly004/ACV_left';

ret.fly08202024_004.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = '08202024/fly004/pre';

ret.fly08202024_004.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = '08202024/fly004/post';

ret.fly08202024_004.post_pairing_left = extract_fictrac(folder);

ret.fly08202024_004.post_pairing_left.paired_odor = "OCT";
ret.fly08202024_004.pre_pairing_left.paired_odor = "OCT";

%% 08222024 001
% wd = D:\Thomas\FOBdata\pairing

folder = '08222024/fly001/ACV_left';

ret.fly08222024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = '08222024/fly001/pre';

ret.fly08222024_001.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = '08222024/fly001/post';

ret.fly08222024_001.post_pairing_left = extract_fictrac(folder);

ret.fly08222024_001.post_pairing_left.paired_odor = "OCT";
ret.fly08222024_001.pre_pairing_left.paired_odor = "OCT";

%% 08232024 001
% wd = D:\Thomas\FOBdata\pairing

folder = '08232024/fly001/ACV_left';

ret.fly08232024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = '08232024/fly001/pre';

ret.fly08232024_001.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = '08232024/fly001/post';

ret.fly08232024_001.post_pairing_left = extract_fictrac(folder);

ret.fly08232024_001.post_pairing_left.paired_odor = "OCT";
ret.fly08232024_001.pre_pairing_left.paired_odor = "OCT";

%% 08232024 002
% wd = D:\Thomas\FOBdata\pairing

folder = '08232024/fly002/ACV_left';

ret.fly08232024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = '08232024/fly002/pre';

ret.fly08232024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = '08232024/fly002/post';

ret.fly08232024_002.post_pairing_left = extract_fictrac(folder);

ret.fly08232024_002.post_pairing_left.paired_odor = "OCT";
ret.fly08232024_002.pre_pairing_left.paired_odor = "OCT";

%%
save('behavior_data_organized', "ret");

%%

straight_vs_turn(ret, ['inthead'])

straight_vs_turn(ret, ['movspd'])



