%% Upwin imaging
close all
clear all

% %% 05062024
% % ImagingData/05062024/fly003
% % 
% % folder = 'ImagingData/05062024/fly000/session1';
% % 
% % data.fly05062024_000.session1 = extract_data(folder);
% 
% folder = 'ImagingData/05062024/fly000/session2';
% 
% data.fly05062024_000.session2 = extract_data(folder);
% 
% data.fly05062024_000.session2.fr = 30

%% 05202024
% ImagingData/05202024/fly000
% 
folder = 'ImagingData/05202024/fly000/session1';

data.fly05202024_000.session1 = extract_data(folder);
data.fly05202024_000.session1.fr = 30/6;

folder = 'ImagingData/05202024/fly000/session2';

data.fly05202024_000.session2 = extract_data(folder);
data.fly05202024_000.session2.fr = 30/6;
%% ImagingData/05202024/fly001
% 
folder = 'ImagingData/05202024/fly001/session1';

data.fly05202024_001.session1 = extract_data(folder);
data.fly05202024_001.session1.fr = 30/6;

% 
% folder = 'ImagingData/05202024/fly001/session2';
% 
% data.fly05202024_000.session2 = extract_data(folder);

%% ImagingData/05212024/fly000
% 
folder = 'ImagingData/05212024/fly000/session1';

data.fly05212024_000.session1 = extract_data(folder);
data.fly05212024_000.session1.fr = 30/6;

%%
lobe_ids = {"1", "2", "3", "4", "5", "6", "7", "8"};

lobe_analysis(data, "movspd", lobe_ids)