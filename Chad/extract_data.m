%% extract data
%INPUTS
%folder = folder where fictrac and fluorescence data is found
%thresh = optional variable, set threshold for fiji output tracking led
%turning on and off indicating odor delivery

function [out] = extract_fictrac(folder, thresh);

%find current folder wd
main_folder = pwd;
%change wd to folder with data
cd(folder);

%find and load parameters fild
param_file = dir('parameters*.mat');
params = load(param_file.name);

%find and load fluorescence data
F_name= dir('*ROIs.mat');
F = load(F_name.name);
F_fps = 30;
%find fictrac data output
fictrac_dat = dir('*fictrac*.dat');
fictrac_out = load(fictrac_dat.name);
%set radius of ball
radius = 4.5;
fps = 100;

%grab odor_delivery output file from thstim if it exists
stim_file = dir('*odor_delivery*.mat');


if isempty(stim_file);

    %if it does not exist grab the fiji output csv
    stim_file = dir('*Results*.csv');
end


frame = fictrac_out(:,1); %frame counter

%if it's the thstim mat file, load the starts, stops and ids of odor delivery
if stim_file.name(end-3:end) == '.mat';
    odor_delivery = load(stim_file.name);
    stim_starts = odor_delivery.odor.on;
    stim_end = odor_delivery.odor.off;
    frame_starts = find(ismember(frame,stim_starts));
    frame_ends = find(ismember(frame,stim_end));
    odor_id = odor_delivery.odor.id;

    %if not load the csv from imagej of the light turning on, and find
    %where the light turns on and off indicating odor on vs off. 
else
    vidLog = dir('*vidLogFrames*.txt');
    log_frames = load(vidLog.name);
    stim_f = fopen(stim_file.name, 'r');
    dataArray = textscan(stim_f, '%f%f%f%[^\n\r]', 'Delimiter', ',', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,2-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    fclose(stim_f);
    stim_trace = dataArray{3};
    
    %plot the csv trace and set a threshold
    figure; 
    hold on
    plot(stim_trace)

    if isempty(thresh)
        thresh = input('input threshold:  ');
    end
    

    stim_smooth = smooth(stim_trace, 15, 'sgolay', 7);
    
    %use that threshold to find the times where the led turns on and off
    %indicating odor on vs off
    BW2 = bwlabel(stim_smooth > thresh);
    stim_starts = [];
    stim_ends = [];
    i = 1;
    for stim =1: max(BW2);
        if sum(BW2 == stim) < 200 | sum(BW2 == stim) > 2000;
        else

            stim_starts(i) = find(BW2 == stim,1);
            stim_ends(i)= find(BW2 == stim, 1, 'last');
            i = i + 1;
        end
    end

    frame_starts = log_frames(stim_starts);
    frame_ends = log_frames(stim_ends);
    
end

%Descriptive FicTrac variable names assigned below
drotvcx = fictrac_out(:,2); %delta rotation vector (cam coords) X
drotvcy = fictrac_out(:,3); %delta rotation vector (cc) Y
drotvcz = fictrac_out(:,4); %delta rotation vector (cc) Z
droterr = fictrac_out(:,5); %delta rotation error score
drotvlx = fictrac_out(:,6); %delta rotation vector (lab coords) X
drotvly = fictrac_out(:,7); %delta rotation vector (lc) Y
drotvlz = fictrac_out(:,8); %delta rotation vector (lc) Z
abrotvcx = fictrac_out(:,9); %absolute rotation vector (cc) X
abrotvcy = fictrac_out(:,10); %absolute rotation vector (cc) Y
abrotvcz = fictrac_out(:,11); %absolute rotation vector (cc) Z
abrotvlx = fictrac_out(:,12); %absolute rotation vector (lc) X
abrotvly = fictrac_out(:,3); %absolute rotation vector (lc) Y
abrotvlz = fictrac_out(:,14); %absolute rotation vector (lc) Z
intxpos = fictrac_out(:,15); %integrated x position (lc)
intypos = fictrac_out(:,16); %integrated y position (lc)
inthead = fictrac_out(:,17); %integrated fly heading (lc)
movdir = fictrac_out(:,18); %instantaneous moving direction (lc)
movspd = fictrac_out(:,19); %instantaneous moving speed
intformot = fictrac_out(:,20); %integrated forward motion (lc) X
intsidmot = fictrac_out(:,21); %integrated side motion (lc) Y
time = fictrac_out(:,22); %timestamp
seq = fictrac_out(:,23); %sequence counter

%x and fps for plots
x = (1:length(frame));
fps = 100;
fp30s = fps*30;

%convert x and y units to lab units (mm)
intxposR = intxpos*radius;
intyposR = intypos*radius;
x_diff = diff(intxposR);
y_diff = diff(intyposR);

%Correct jumps in x and y position due to tracking resets
errors = abs(x_diff) > 3 | abs(y_diff) > 3;
BW = bwlabel(errors);
for err = 1: sum(errors)
    x_err = intxposR(BW == err);
    y_err = intyposR(BW == err);
    
    intxposR(find(BW == err,1)+1:end) = intxposR(find(BW == err,1)+1:end) - x_diff(find(BW == err,1));
    intyposR(find(BW == err,1)+1:end) = intyposR(find(BW == err,1)+1:end) - y_diff(find(BW == err,1));
end

%collect x and y for output
out.intxposR = intxposR;
out.intyposR = intyposR;


stim_frames = [];


% for each trial, find the start, end, length, frames along with frames
% before and after trial, and the frame number for each point
for stim = 1:length(stim_starts)

    trial_start{stim} = frame(find(frame > frame_starts(stim),1));
    trial_end{stim} = frame(find(frame < frame_ends(stim),1,'last'));
    trial_length = trial_end{stim}-trial_start{stim};
    trial_frames{stim} = trial_start{stim} - (params.Data_1.parameter.preO * fps):trial_end{stim} + ((params.Data_1.parameter.dur - (params.Data_1.parameter.preO + params.Data_1.parameter.odorD)) * fps);
    stim_frames = [stim_frames, trial_start{stim}:trial_end{stim}];
    trial_x{stim} = trial_frames{stim} - trial_start{stim};
end




%collect variables for output and convert to the correct units
out.trial_x = trial_x;
out.trial_start = trial_start;
out.trail_end = trial_end;
out.trial_length = trial_length;
out.trial_frames = trial_frames;
out.stim_frames = stim_frames;
out.movspd = movspd * radius * fps;
out.drotvlx = drotvlx * fps *180/3.14159;
out.drotvly = drotvly * fps *180/3.14159;
out.drotvlz = drotvlz * fps *180/3.14159;
out.movdir = movdir * fps * 180/3.14159;
out.inthead = inthead * fps *180/3.14159;
out.F = F.data.F;
out.Data_1 = params.Data_1;

x = diff(out.inthead);
x = [0; x];
x(x>5000) = x(x>5000) - 36000; % elimante the large changes in turning that are caused when going over 360 degrees
x(x<-5000) = x(x<-5000) + 36000; % elimante the large changes in turning that occur when going under 0 degrees

out.inthead = movmean(x, 10); % find the mean of ten frames to smooth data slightly


x = diff(out.movdir);
x = [0; x];
x(x>5000) = x(x>5000) - 36000;
x(x<-5000) = x(x<-5000) + 36000;

x = x - nanmean(x);

out.movdir = movmean(x, 10)

if exist("odor_id", 'var')
    out.odor_id = odor_id;
else
    for i=1: length(stim_starts)
        out.odor_id(i) = "odor1";
    end
end

% change the wd back to the main folder
cd(main_folder);

end
