%% pairing with control odor
close all
clear all


%% 03142024

%fly 03242024_000
folder = 'odor_pairing/03142024/Fly000/ACV_left';

data.fly03142024_000.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03142024/Fly000/pre_pairing';

data.fly03142024_000.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03142024/Fly000/post_pairing';

data.fly03142024_000.post_pairing_left = extract_fictrac(folder);

data.fly03142024_000.post_pairing_left.paired_odor = "MCH";
data.fly03142024_000.pre_pairing_left.paired_odor = "MCH";

%% fly 03142024_001
folder = 'odor_pairing/03142024/Fly001/ACV_left';

data.fly03142024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03142024/Fly001/pre_pairing';

data.fly03142024_001.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03142024/Fly001/post_pairing';

data.fly03142024_001.post_pairing_left = extract_fictrac(folder);

data.fly03142024_001.post_pairing_left.paired_odor = "MCH";
data.fly03142024_001.pre_pairing_left.paired_odor = "MCH";


%% fly 03142024_002
folder = 'odor_pairing/03142024/Fly002/ACV_left';

data.fly03142024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03142024/Fly002/pre_pairing';

data.fly03142024_002.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03142024/Fly002/post_pairing';

data.fly03142024_002.post_pairing_left = extract_fictrac(folder);

data.fly03142024_002.post_pairing_left.paired_odor = "OCT";
data.fly03142024_002.pre_pairing_left.paired_odor = "OCT";

%% fly 03142024_003
folder = 'odor_pairing/03142024/Fly003/ACV_left';

data.fly03142024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03142024/Fly003/pre_pairing';

data.fly03142024_003.pre_pairing_left = extract_fictrac(folder);
data.fly03142024_003.pre_pairing_left.paired_odor = "OCT";

%post_pairing
folder = 'odor_pairing/03142024/Fly003/post_pairing';

data.fly03142024_003.post_pairing_left = extract_fictrac(folder);

data.fly03142024_003.post_pairing_left.paired_odor = "OCT";

%% 03182024

%fly 03182024
folder = 'odor_pairing/03182024/Fly000/ACV_left';

data.fly03182024_000.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03182024/Fly000/pre_pairing';

data.fly03182024_000.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03182024/Fly000/post_pairing';

data.fly03182024_000.post_pairing_left = extract_fictrac(folder);

data.fly03182024_000.post_pairing_left.paired_odor = "OCT";
data.fly03182024_000.pre_pairing_left.paired_odor = "OCT";

%% fly 03182024 002
folder = 'odor_pairing/03182024/Fly002/ACV_left';

data.fly03182024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03182024/Fly002/pre_training';

data.fly03182024_002.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03182024/Fly002/post_pairing';

data.fly03182024_002.post_pairing_left = extract_fictrac(folder);

data.fly03182024_002.post_pairing_left.paired_odor = "MCH";
data.fly03182024_002.pre_pairing_left.paired_odor = "MCH";

%% fly 03182024 003
folder = 'odor_pairing/03182024/Fly003/ACV_pre';

data.fly03182024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03182024/Fly003/pre_pairing';

data.fly03182024_003.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03182024/Fly003/post_pairing';

data.fly03182024_003.post_pairing_left = extract_fictrac(folder);

data.fly03182024_003.post_pairing_left.paired_odor = "OCT";
data.fly03182024_003.pre_pairing_left.paired_odor = "OCT";

%% fly 03182024 004
folder = 'odor_pairing/03182024/Fly004/ACV_left';

data.fly03182024_004.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03182024/Fly004/pre_pairing';

data.fly03182024_004.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03182024/Fly004/post_pairing';

data.fly03182024_004.post_pairing_left = extract_fictrac(folder);

data.fly03182024_004.post_pairing_left.paired_odor = "MCH";
data.fly03182024_004.pre_pairing_left.paired_odor = "MCH";

%% 03212024
% odor_pairing/03212024/Fly002/

folder = 'odor_pairing/03212024/Fly002/pre_ACV';

data.fly03212024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03212024/Fly002/pre_pairing';

data.fly03212024_002.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03212024/Fly002/post_pairing';

data.fly03212024_002.post_pairing_left = extract_fictrac(folder);

data.fly03212024_002.post_pairing_left.paired_odor = "OCT";
data.fly03212024_002.pre_pairing_left.paired_odor = "OCT";

%% odor_pairing/03212024/Fly004/

folder = 'odor_pairing/03212024/Fly004/ACV_pre';

data.fly03212024_004.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03212024/Fly004/pre_pairing';

data.fly03212024_004.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03212024/Fly004/post_pairing';

data.fly03212024_004.post_pairing_left = extract_fictrac(folder);

data.fly03212024_004.post_pairing_left.paired_odor = "OCT";
data.fly03212024_004.pre_pairing_left.paired_odor = "OCT";

%% fly 03212024_006
folder = 'odor_pairing/03212024/Fly006/ACV_pre';

data.fly03212024_006.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03212024/Fly006/pre_pairing';

data.fly03212024_006.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03212024/Fly006/post_pairing';

data.fly03212024_006.post_pairing_left = extract_fictrac(folder);

data.fly03212024_006.post_pairing_left.paired_odor = "OCT";
data.fly03212024_006.pre_pairing_left.paired_odor = "OCT";

%% fly 03212024_006
folder = 'odor_pairing/03212024/Fly007/pre_ACV';

data.fly03212024_007.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03212024/Fly007/pre_pairing';

data.fly03212024_007.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03212024/Fly007/post_pairing';

data.fly03212024_007.post_pairing_left = extract_fictrac(folder);

data.fly03212024_007.post_pairing_left.paired_odor = "OCT";
data.fly03212024_007.pre_pairing_left.paired_odor = "OCT";


%% 03222024
% fly 03222024_002
folder = 'odor_pairing/03222024/Fly002/ACV_right';

data.fly03222024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03222024/Fly002/pre_training';

data.fly03222024_002.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03222024/Fly002/post_pairing';

data.fly03222024_002.post_pairing_left= extract_fictrac(folder);

data.fly03222024_002.post_pairing_left.paired_odor = "OCT";
data.fly03222024_002.pre_pairing_left.paired_odor = "OCT";

%% fly 03222024_004
folder = 'odor_pairing/03222024/Fly004/ACV_right';

data.fly03222024_004.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'odor_pairing/03222024/Fly004/pre_pairing';

data.fly03222024_004.pre_pairing_left = extract_fictrac(folder);

%post_pairing
folder = 'odor_pairing/03222024/Fly004/post_pairing';

data.fly03222024_004.post_pairing_left= extract_fictrac(folder);

data.fly03222024_004.post_pairing_left.paired_odor = "OCT";
data.fly03222024_004.pre_pairing_left.paired_odor = "OCT";


%% run analysis on data and plot results
straight_vs_turn(data, ['inthead'])

straight_vs_turn(data, ['movdir'])
straight_vs_turn(data, ['movspd'])
