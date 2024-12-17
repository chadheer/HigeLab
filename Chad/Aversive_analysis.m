%% 
close all
clear all

%% 09092024_002 turning response to ACV
% angela/09092024/fly002

folder = 'angela/09092024/fly002/ACV_left';

ret.fly09092024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/09092024/fly002/pre_pairing';

ret.fly09092024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/09092024/fly002/post_pairing';

ret.fly09092024_002.post_pairing_left = extract_fictrac(folder);

ret.fly09092024_002.post_pairing_left.paired_odor = "OCT";
ret.fly09092024_002.pre_pairing_left.paired_odor = "OCT";

%% 09162024_001 %ACV response not great Fly died later in experiment
% angela/09162024/fly001

% folder = 'angela/09162024/fly001/ACV_left';
% 
% ret.fly09162024_001.ACV_left = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'angela/09162024/fly001/pre_pairing';
% 
% ret.fly09162024_001.pre_pairing_left= extract_fictrac(folder);
% 
% %post_pairing
% folder = 'angela/09162024/fly001/post_pairing';
% 
% ret.fly09162024_001.post_pairing_left = extract_fictrac(folder);
% 
% ret.fly09162024_001.post_pairing_left.paired_odor = "MCH";
% ret.fly09162024_001.pre_pairing_left.paired_odor = "MCH";

%% 09162024_002 ACV response not great
% angela/09162024/fly002
% 
% folder = 'angela/09162024/fly002/ACV_left';
% 
% ret.fly09162024_002.ACV_left = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'angela/09162024/fly002/pre_pairing';
% 
% ret.fly09162024_002.pre_pairing_left= extract_fictrac(folder);
% 
% %post_pairing
% folder = 'angela/09162024/fly002/post_pairing';
% 
% ret.fly09162024_002.post_pairing_left = extract_fictrac(folder);
% 
% ret.fly09162024_002.post_pairing_left.paired_odor = "MCH";
% ret.fly09162024_002.pre_pairing_left.paired_odor = "MCH";

%% 09182024_001  good acv response
% angela/09182024/fly001

folder = 'angela/09182024/fly001/ACV_right';

ret.fly09182024_001.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/09182024/fly001/pre_pairing';

ret.fly09182024_001.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/09182024/fly001/post_pairing';

ret.fly09182024_001.post_pairing_right = extract_fictrac(folder);

ret.fly09182024_001.post_pairing_right.paired_odor = "OCT";
ret.fly09182024_001.pre_pairing_right.paired_odor = "OCT";

%% 09302024_002 % slight ACV response
% angela/09302024/fly002

folder = 'angela/09302024/fly002/ACV_right';

ret.fly09302024_002.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/09302024/fly002/pre_pairing';

ret.fly09302024_002.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/09302024/fly002/post_pairing';

ret.fly09302024_002.post_pairing_right = extract_fictrac(folder);

ret.fly09302024_002.post_pairing_right.paired_odor = "MCH";
ret.fly09302024_002.pre_pairing_right.paired_odor = "MCH";

%% 09302024_003 % slight ACV response too much flying
% % angela/09302024/fly003
% 
% folder = 'angela/09302024/fly003/ACV_right';
% 
% ret.fly09302024_003.ACV_right = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'angela/09302024/fly003/pre_pairing';
% 
% ret.fly09302024_003.pre_pairing_right= extract_fictrac(folder);
% 
% %post_pairing
% folder = 'angela/09302024/fly003/post_pairing';
% 
% ret.fly09302024_003.post_pairing_right = extract_fictrac(folder);
% 
% ret.fly09302024_003.post_pairing_right.paired_odor = "OCT";
% ret.fly09302024_003.pre_pairing_right.paired_odor = "OCT";

%% 09302024_006 % slight ACV response
% angela/09302024/fly006

folder = 'angela/09302024/fly006/ACV_left';

ret.fly09302024_006.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/09302024/fly006/pre_pairing';

ret.fly09302024_006.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/09302024/fly006/post_pairing';

ret.fly09302024_006.post_pairing_left = extract_fictrac(folder);

ret.fly09302024_006.post_pairing_left.paired_odor = "OCT";
ret.fly09302024_006.pre_pairing_left.paired_odor = "OCT";

%% 10022024_000 %small response to ACV flew too much
% % angela/10022024/fly001
% 
% folder = 'angela/10022024/fly001/ACV_right';
% 
% ret.fly10022024_000.ACV_right = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'angela/10022024/fly001/pre_pairing';
% 
% ret.fly10022024_000.pre_pairing_right= extract_fictrac(folder);
% 
% %post_pairing
% folder = 'angela/10022024/fly001/post_pairing';
% 
% ret.fly10022024_000.post_pairing_right = extract_fictrac(folder);
% 
% ret.fly10022024_000.post_pairing_right.paired_odor = "MCH";
% ret.fly10022024_000.pre_pairing_right.paired_odor = "MCH";
%% 10072024_002 % good resposne flying in post pairing
% angela/10072024/fly002
% 
% folder = 'angela/10072024/fly002/ACV_left';
% 
% ret.fly10072024_002.ACV_left = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'angela/10072024/fly002/pre_pairing';
% 
% ret.fly10072024_002.pre_pairing_left= extract_fictrac(folder);
% 
% %post_pairing
% folder = 'angela/10072024/fly002/post_pairing';
% 
% ret.fly10072024_002.post_pairing_left = extract_fictrac(folder);
% 
% ret.fly10072024_002.post_pairing_left.paired_odor = "OCT";
% ret.fly10072024_002.pre_pairing_left.paired_odor = "OCT";
%% 10072024_003
% angela/10072024/fly003

folder = 'angela/10072024/fly003/ACV_left';

ret.fly10072024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/10072024/fly003/pre_pairing';

ret.fly10072024_003.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/10072024/fly003/post_pairing';

ret.fly10072024_003.post_pairing_left = extract_fictrac(folder);

ret.fly10072024_003.post_pairing_left.paired_odor = "MCH";
ret.fly10072024_003.pre_pairing_left.paired_odor = "MCH";

%% 10072024_004
% angela/10072024/fly004

folder = 'angela/10072024/fly004/ACV_left';

control.fly10142024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/10072024/fly004/pre_pairing';

control.fly10142024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/10072024/fly004/post_pairing';

control.fly10142024_002.post_pairing_left = extract_fictrac(folder);

control.fly10142024_002.post_pairing_left.paired_odor = "OCT";
control.fly10142024_002.pre_pairing_left.paired_odor = "OCT";

%% 10072024_005
% angela/10072024/fly005

folder = 'angela/10072024/fly005/ACV_left';

control.fly10282024_000.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/10072024/fly005/pre_pairing';

control.fly10282024_000.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/10072024/fly005/post_pairing';

control.fly10282024_000.post_pairing_left = extract_fictrac(folder);

control.fly10282024_000.post_pairing_left.paired_odor = "MCH";
control.fly10282024_000.pre_pairing_left.paired_odor = "MCH";

%% 10072024_006
% angela/10072024/fly006

folder = 'angela/10072024/fly006/ACV_left';

control.fly10072024_006.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/10072024/fly006/pre_pairing';

control.fly10072024_006.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/10072024/fly006/post_pairing';

control.fly10072024_006.post_pairing_left = extract_fictrac(folder);

control.fly10072024_006.post_pairing_left.paired_odor = "OCT";
control.fly10072024_006.pre_pairing_left.paired_odor = "OCT";

%% 10142024_002 bad acv response
% % angela/10142024/fly002
% 
% folder = 'angela/10142024/fly002/ACV_left';
% 
% control.fly10142024_002.ACV_left = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'angela/10142024/fly002/pre_pairing';
% 
% control.fly10142024_002.pre_pairing_left= extract_fictrac(folder);
% 
% %post_pairing
% folder = 'angela/10142024/fly002/post_pairing';
% 
% control.fly10142024_002.post_pairing_left = extract_fictrac(folder);
% 
% control.fly10142024_002.post_pairing_left.paired_odor = "MCH";
% control.fly10142024_002.pre_pairing_left.paired_odor = "MCH";

%% 10142024_003 no good acv response
% % angela/10142024/fly003
% 
% folder = 'angela/10142024/fly003/ACV_left';
% 
% control.fly10142024_003.ACV_left = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'angela/10142024/fly003/pre_pairing';
% 
% control.fly10142024_003.pre_pairing_left= extract_fictrac(folder);
% 
% %post_pairing
% folder = 'angela/10142024/fly003/post_pairing';
% 
% control.fly10142024_003.post_pairing_left = extract_fictrac(folder);
% 
% control.fly10142024_003.post_pairing_left.paired_odor = "OCT";
% control.fly10142024_003.pre_pairing_left.paired_odor = "OCT";


%% 10162024_002
% angela/10162024/fly002

folder = 'angela/10162024/fly002/ACV_left';

ret.fly10162024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/10162024/fly002/pre_pairing';

ret.fly10162024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/10162024/fly002/post_pairing';

ret.fly10162024_002.post_pairing_left = extract_fictrac(folder);

ret.fly10162024_002.post_pairing_left.paired_odor = "MCH";
ret.fly10162024_002.pre_pairing_left.paired_odor = "MCH";

%% 10162024_003
% angela/10162024/fly003

folder = 'angela/10162024/fly003/ACV_left';

ret.fly10162024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/10162024/fly003/pre_pairing';

ret.fly10162024_003.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/10162024/fly003/post_pairing';

ret.fly10162024_003.post_pairing_left = extract_fictrac(folder);

ret.fly10162024_003.post_pairing_left.paired_odor = "MCH";
ret.fly10162024_003.pre_pairing_left.paired_odor = "MCH";

%% 10212024/fly001 flew
% % angela/10212024/fly001
% 
% folder = 'angela/10212024/fly001/ACV_right';
% 
% control.fly10212024_001.ACV_right = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'angela/10212024/fly001/pre_pairing';
% 
% control.fly10212024_001.pre_pairing_right= extract_fictrac(folder);
% 
% %post_pairing
% folder = 'angela/10212024/fly001/post_pairing';
% 
% control.fly10212024_001.post_pairing_right = extract_fictrac(folder);
% 
% control.fly10212024_001.post_pairing_right.paired_odor = "MCH";
% control.fly10212024_001.pre_pairing_right.paired_odor = "MCH";

%% 10212024/fly002 flew
% % angela/10212024/fly002
% 
% folder = 'angela/10212024/fly002/ACV_right';
% 
% ret.fly10212024_002.ACV_right = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'angela/10212024/fly002/pre_pairing';
% 
% ret.fly10212024_002.pre_pairing_right= extract_fictrac(folder);
% 
% %post_pairing
% folder = 'angela/10212024/fly002/post_pairing';
% 
% ret.fly10212024_002.post_pairing_right = extract_fictrac(folder);
% 
% ret.fly10212024_002.post_pairing_right.paired_odor = "OCT";
% ret.fly10212024_002.pre_pairing_right.paired_odor = "OCT";

%% 10212024/fly003
% angela/10212024/fly003

folder = 'angela/10212024/fly003/ACV_right';

control.fly10212024_003.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/10212024/fly003/pre_pairing';

control.fly10212024_003.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/10212024/fly003/post_pairing';

control.fly10212024_003.post_pairing_right = extract_fictrac(folder);

control.fly10212024_003.post_pairing_right.paired_odor = "OCT";
control.fly10212024_003.pre_pairing_right.paired_odor = "OCT";

%% 10212024/fly004
% angela/10212024/fly004

folder = 'angela/10212024/fly004/ACV_right';

ret.fly10212024_004.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/10212024/fly004/pre_pairing';

ret.fly10212024_004.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/10212024/fly004/post_pairing';

ret.fly10212024_004.post_pairing_right = extract_fictrac(folder);

ret.fly10212024_004.post_pairing_right.paired_odor = "MCH";
ret.fly10212024_004.pre_pairing_right.paired_odor = "MCH";

%% 10212024/fly007 % flew during post pairing
% % angela/10212024/fly007
% 
% folder = 'angela/10212024/fly007/ACV_right';
% 
% ret.fly10212024_007.ACV_right = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'angela/10212024/fly007/pre_pairing';
% 
% ret.fly10212024_007.pre_pairing_right= extract_fictrac(folder);
% 
% %post_pairing
% folder = 'angela/10212024/fly007/post_pairing';
% 
% ret.fly10212024_007.post_pairing_right = extract_fictrac(folder);
% 
% ret.fly10212024_007.post_pairing_right.paired_odor = "OCT";
% ret.fly10212024_007.pre_pairing_right.paired_odor = "OCT";


%% 10212024/fly008 %flew during post pairing
% angela/10212024/fly008

% folder = 'angela/10212024/fly008/ACV_right';
% 
% ret.fly10212024_008.ACV_right = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'angela/10212024/fly008/pre_pairing';
% 
% ret.fly10212024_008.pre_pairing_right= extract_fictrac(folder);
% 
% %post_pairing
% folder = 'angela/10212024/fly008/post_pairing';
% 
% ret.fly10212024_008.post_pairing_right = extract_fictrac(folder);
% 
% ret.fly10212024_008.post_pairing_right.paired_odor = "MCH";
% ret.fly10212024_008.pre_pairing_right.paired_odor = "MCH";

%% 10232024/fly000
% angela/10232024/fly000

folder = 'angela/10232024/fly000/ACV_right';

control.fly10232024_000.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/10232024/fly000/pre_pairing';

control.fly10232024_000.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/10232024/fly000/post_pairing';

control.fly10232024_000.post_pairing_right = extract_fictrac(folder);

control.fly10232024_000.post_pairing_right.paired_odor = "MCH";
control.fly10232024_000.pre_pairing_right.paired_odor = "MCH";

%% 10232024/fly001 % flew during pre pairing
% angela/10232024/fly001
% 
% folder = 'angela/10232024/fly001/ACV_right';
% 
% ret.fly10232024_001.ACV_right = extract_fictrac(folder);
% 
% %pre_pairing
% folder = 'angela/10232024/fly001/pre_pairing';
% 
% ret.fly10232024_001.pre_pairing_right= extract_fictrac(folder);
% 
% %post_pairing
% folder = 'angela/10232024/fly001/post_pairing';
% 
% ret.fly10232024_001.post_pairing_right = extract_fictrac(folder);
% 
% ret.fly10232024_001.post_pairing_right.paired_odor = "OCT";
% ret.fly10232024_001.pre_pairing_right.paired_odor = "OCT";

%% 10282024_000
% angela/10282024/fly000

folder = 'angela/10282024/fly000/ACV_left';

ret.fly10282024_000.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/10282024/fly000/pre_pairing';

ret.fly10282024_000.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/10282024/fly000/post_pairing';

ret.fly10282024_000.post_pairing_left = extract_fictrac(folder);

ret.fly10282024_000.post_pairing_left.paired_odor = "OCT";
ret.fly10282024_000.pre_pairing_left.paired_odor = "OCT";

%% 10282024_001
% angela/10282024/fly001

folder = 'angela/10282024/fly001/ACV_left';

control.fly10282024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/10282024/fly001/pre_pairing';

control.fly10282024_001.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/10282024/fly001/post_pairing';

control.fly10282024_001.post_pairing_left = extract_fictrac(folder);

control.fly10282024_001.post_pairing_left.paired_odor = "OCT";
control.fly10282024_001.pre_pairing_left.paired_odor = "OCT";

%% 11042024
% angela/11042024/fly000

folder = 'angela/11042024/fly000/ACV_left';

control.fly11042024_000.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11042024/fly000/pre_pairing';

control.fly11042024_000.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11042024/fly000/post_pairing';

control.fly11042024_000.post_pairing_left= extract_fictrac(folder);

control.fly11042024_000.post_pairing_left.paired_odor = "MCH";
control.fly11042024_000.pre_pairing_left.paired_odor = "MCH";

%% 11112024
% angela/11112024/fly001

folder = 'angela/11112024/fly001/ACV_right';

ret.fly11112024_001.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11112024/fly001/pre_pairing';

ret.fly11112024_001.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/11112024/fly001/post_pairing';

ret.fly11112024_001.post_pairing_right = extract_fictrac(folder);

ret.fly11112024_001.post_pairing_right.paired_odor = "OCT";
ret.fly11112024_001.pre_pairing_right.paired_odor = "OCT";
%% 11112024
% angela/11112024/fly002

folder = 'angela/11112024/fly002/ACV_right';

ret.fly11112024_002.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11112024/fly002/pre_pairing';

ret.fly11112024_002.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/11112024/fly002/post_pairing';

ret.fly11112024_002.post_pairing_right = extract_fictrac(folder);

ret.fly11112024_002.post_pairing_right.paired_odor = "MCH";
ret.fly11112024_002.pre_pairing_right.paired_odor = "MCH";

%% 11112024
% thomas/pairing/11112024/fly001

folder = 'thomas/pairing/11112024/fly001/ACV_left';

control.fly11112024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'thomas/pairing/11112024/fly001/pre';

control.fly11112024_003.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'thomas/pairing/11112024/fly001/post';

control.fly11112024_003.post_pairing_left = extract_fictrac(folder);

control.fly11112024_003.post_pairing_left.paired_odor = "OCT";
control.fly11112024_003.pre_pairing_left.paired_odor = "OCT";

%% 11112024
% thomas/pairing/11112024/fly002

folder = 'thomas/pairing/11112024/fly002/ACV_left';

ret.fly11112024_004.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'thomas/pairing/11112024/fly002/pre';

ret.fly11112024_004.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'thomas/pairing/11112024/fly002/post';

ret.fly11112024_004.post_pairing_left = extract_fictrac(folder);

ret.fly11112024_004.post_pairing_left.paired_odor = "OCT";
ret.fly11112024_004.pre_pairing_left.paired_odor = "OCT";

%% 11112024
% thomas/pairing/11112024/fly003

folder = 'thomas/pairing/11112024/fly003/ACV_left';

ret.fly11112024_005.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'thomas/pairing/11112024/fly003/pre';

ret.fly11112024_005.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'thomas/pairing/11112024/fly003/post';

ret.fly11112024_005.post_pairing_left = extract_fictrac(folder);

ret.fly11112024_005.post_pairing_left.paired_odor = "MCH";
ret.fly11112024_005.pre_pairing_left.paired_odor = "MCH";


%% 11132024
% angela/11132024/fly000

folder = 'angela/11132024/fly000/ACV_right';

control.fly11132024_000.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11132024/fly000/pre_pairing';

control.fly11132024_000.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/11132024/fly000/post_pairing';

control.fly11132024_000.post_pairing_right= extract_fictrac(folder);

control.fly11132024_000.post_pairing_right.paired_odor = "MCH";
control.fly11132024_000.pre_pairing_right.paired_odor = "MCH";

%% 11132024
% angela/11132024/fly001

folder = 'angela/11132024/fly001/ACV_right';

ret.fly11132024_001.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11132024/fly001/pre_pairing';

ret.fly11132024_001.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/11132024/fly001/post_pairing';

ret.fly11132024_001.post_pairing_right= extract_fictrac(folder);

ret.fly11132024_001.post_pairing_right.paired_odor = "MCH";
ret.fly11132024_001.pre_pairing_right.paired_odor = "MCH";


%% 11182024
% angela/11182024/fly000

folder = 'angela/11182024/fly000/ACV_left';

ret.fly11182024_000.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11182024/fly000/pre_pairing';

ret.fly11182024_000.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11182024/fly000/post_pairing';

ret.fly11182024_000.post_pairing_left= extract_fictrac(folder);

ret.fly11182024_000.post_pairing_left.paired_odor = "OCT";
ret.fly11182024_000.pre_pairing_left.paired_odor = "OCT";

%% 11182024
% angela/11182024/fly001

folder = 'angela/11182024/fly001/ACV_left';

control.fly11182024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11182024/fly001/pre_pairing';

control.fly11182024_001.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11182024/fly001/post_pairing';

control.fly11182024_001.post_pairing_left= extract_fictrac(folder);

control.fly11182024_001.post_pairing_left.paired_odor = "OCT";
control.fly11182024_001.pre_pairing_left.paired_odor = "OCT";

%% 11182024
% angela/11182024/fly002

folder = 'angela/11182024/fly002/ACV_left';

ret.fly11182024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11182024/fly002/pre_pairing';

ret.fly11182024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11182024/fly002/post_pairing';

ret.fly11182024_002.post_pairing_left= extract_fictrac(folder);

ret.fly11182024_002.post_pairing_left.paired_odor = "OCT";
ret.fly11182024_002.pre_pairing_left.paired_odor = "OCT";

%% 11182024
% angela/11182024/fly003

folder = 'angela/11182024/fly003/ACV_left';

ret.fly11182024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11182024/fly003/pre_pairing';

ret.fly11182024_003.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11182024/fly003/post_pairing';

ret.fly11182024_003.post_pairing_left= extract_fictrac(folder);

ret.fly11182024_003.post_pairing_left.paired_odor = "MCH";
ret.fly11182024_003.pre_pairing_left.paired_odor = "MCH";

%% 11202024
% angela/11202024/fly000

folder = 'angela/11202024/fly000/ACV_left';

ret.fly11202024_000.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11202024/fly000/pre_pairing';

ret.fly11202024_000.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11202024/fly000/post_pairing';

ret.fly11202024_000.post_pairing_left= extract_fictrac(folder);

ret.fly11202024_000.post_pairing_left.paired_odor = "MCH";
ret.fly11202024_000.pre_pairing_left.paired_odor = "MCH";

%% 11202024
% angela/11202024/fly001

folder = 'angela/11202024/fly001/ACV_left';

control.fly11202024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11202024/fly001/pre_pairing';

control.fly11202024_001.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11202024/fly001/post_pairing';

control.fly11202024_001.post_pairing_left= extract_fictrac(folder);

control.fly11202024_001.post_pairing_left.paired_odor = "MCH";
control.fly11202024_001.pre_pairing_left.paired_odor = "MCH";

%% 11202024
% angela/11202024/fly002

folder = 'angela/11202024/fly002/ACV_left';

control.fly11272024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11202024/fly002/pre_pairing';

control.fly11272024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11202024/fly002/post_pairing';

control.fly11272024_002.post_pairing_left= extract_fictrac(folder);

control.fly11272024_002.post_pairing_left.paired_odor = "OCT";
control.fly11272024_002.pre_pairing_left.paired_odor = "OCT";

%% 11202024
% angela/11202024/fly003

folder = 'angela/11202024/fly003/ACV_left';

control.fly11202024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11202024/fly003/pre_pairing';

control.fly11202024_003.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11202024/fly003/post_pairing';

control.fly11202024_003.post_pairing_left= extract_fictrac(folder);

control.fly11202024_003.post_pairing_left.paired_odor = "OCT";
control.fly11202024_003.pre_pairing_left.paired_odor = "OCT";

%% 11252024
% angela/11252024/fly001

folder = 'angela/11252024/fly001/ACV_left';

ret.fly11252024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11252024/fly001/pre_pairing';

ret.fly11252024_001.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11252024/fly001/post_pairing';

ret.fly11252024_001.post_pairing_left= extract_fictrac(folder);

ret.fly11252024_001.post_pairing_left.paired_odor = "OCT";
ret.fly11252024_001.pre_pairing_left.paired_odor = "OCT";

%% 11272024
% angela/11272024/fly000

folder = 'angela/11272024/fly000/ACV_right';

control.fly11272024_000.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11272024/fly000/pre_pairing';

control.fly11272024_000.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/11272024/fly000/post_pairing';

control.fly11272024_000.post_pairing_right= extract_fictrac(folder);

control.fly11272024_000.post_pairing_right.paired_odor = "OCT";
control.fly11272024_000.pre_pairing_right.paired_odor = "OCT";

%% 11272024
% angela/11272024/fly001

folder = 'angela/11272024/fly001/ACV_right';

ret.fly11272024_001.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11272024/fly001/pre_pairing';

ret.fly11272024_001.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/11272024/fly001/post_pairing';

ret.fly11272024_001.post_pairing_right= extract_fictrac(folder);

ret.fly11272024_001.post_pairing_right.paired_odor = "OCT";
ret.fly11272024_001.pre_pairing_right.paired_odor = "OCT";

%% 11272024
% angela/11272024/fly002

folder = 'angela/11272024/fly002/ACV_left';

control.fly11272024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11272024/fly002/pre_pairing';

control.fly11272024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11272024/fly002/post_pairing';

control.fly11272024_002.post_pairing_left= extract_fictrac(folder);

control.fly11272024_002.post_pairing_left.paired_odor = "OCT";
control.fly11272024_002.pre_pairing_left.paired_odor = "OCT";

%% 11272024
% angela/11272024/fly003

folder = 'angela/11272024/fly003/ACV_left';

ret.fly11272024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11272024/fly003/pre_pairing';

ret.fly11272024_003.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11272024/fly003/post_pairing';

ret.fly11272024_003.post_pairing_left= extract_fictrac(folder);

ret.fly11272024_003.post_pairing_left.paired_odor = "OCT";
ret.fly11272024_003.pre_pairing_left.paired_odor = "OCT";

%% 11282024
% angela/11282024/fly001

folder = 'angela/11282024/fly001/ACV_left';

control.fly11282024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11282024/fly001/pre_pairing';

control.fly11282024_001.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11282024/fly001/post_pairing';

control.fly11282024_001.post_pairing_left= extract_fictrac(folder);

control.fly11282024_001.post_pairing_left.paired_odor = "MCH";
control.fly11282024_001.pre_pairing_left.paired_odor = "MCH";

%% 11282024
% angela/11282024/fly002

folder = 'angela/11282024/fly002/ACV_left';

ret.fly11282024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11282024/fly002/pre_pairing';

ret.fly11282024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11282024/fly002/post_pairing';

ret.fly11282024_002.post_pairing_left= extract_fictrac(folder);

ret.fly11282024_002.post_pairing_left.paired_odor = "MCH";
ret.fly11282024_002.pre_pairing_left.paired_odor = "MCH";

%% 11292024
% angela/11292024/fly001

folder = 'angela/11292024/fly001/ACV_left';

ret.fly11292024_001.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11292024/fly001/pre_pairing';

ret.fly11292024_001.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11292024/fly001/post_pairing';

ret.fly11292024_001.post_pairing_left= extract_fictrac(folder);

ret.fly11292024_001.post_pairing_left.paired_odor = "MCH";
ret.fly11292024_001.pre_pairing_left.paired_odor = "MCH";

%% 11292024
% angela/11292024/fly002

folder = 'angela/11292024/fly002/ACV_left';

ret.fly11292024_002.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11292024/fly002/pre_pairing';

ret.fly11292024_002.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11292024/fly002/post_pairing';

ret.fly11292024_002.post_pairing_left= extract_fictrac(folder);

ret.fly11292024_002.post_pairing_left.paired_odor = "MCH";
ret.fly11292024_002.pre_pairing_left.paired_odor = "MCH";

%% 11292024
% angela/11292024/fly003

folder = 'angela/11292024/fly003/ACV_left';

control.fly11292024_003.ACV_left = extract_fictrac(folder);

%pre_pairing
folder = 'angela/11292024/fly003/pre_pairing';

control.fly11292024_003.pre_pairing_left= extract_fictrac(folder);

%post_pairing
folder = 'angela/11292024/fly003/post_pairing';

control.fly11292024_003.post_pairing_left= extract_fictrac(folder);

control.fly11292024_003.post_pairing_left.paired_odor = "MCH";
control.fly11292024_003.pre_pairing_left.paired_odor = "MCH";

%% 12022024
% angela/12022024/fly000

folder = 'angela/12022024/fly000/ACV_right';

ret.fly12022024_000.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/12022024/fly000/pre_pairing';

ret.fly12022024_000.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/12022024/fly000/post_pairing';

ret.fly12022024_000.post_pairing_right= extract_fictrac(folder);

ret.fly12022024_000.post_pairing_right.paired_odor = "OCT";
ret.fly12022024_000.pre_pairing_right.paired_odor = "OCT";

%% 12022024
% angela/12032024/fly003

folder = 'angela/12032024/fly003/ACV_left';

control.fly12032024_003.ACV_right = extract_fictrac(folder);

%pre_pairing
folder = 'angela/12032024/fly003/pre_pairing';

control.fly12032024_003.pre_pairing_right= extract_fictrac(folder);

%post_pairing
folder = 'angela/12032024/fly003/post_pairing';

control.fly12032024_003.post_pairing_right= extract_fictrac(folder);

control.fly12032024_003.post_pairing_right.paired_odor = "OCT";
control.fly12032024_003.pre_pairing_right.paired_odor = "OCT";

save('Aversive_analysis', "ret", "control");
%%

save('Aversive_analysis', "ret", "control");


%%
straight_vs_turn(ret, ['movspd'])
straight_vs_turn(ret, ['inthead'])

%%
straight_vs_turn(control, ['movspd'])
straight_vs_turn(control, ['inthead'])