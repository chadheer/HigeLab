%% FicTracExtract.m
function [out] = extract_fictrac(fictrac_dat, vidLog, stim_file, thresh);
fictrac_out = load(fictrac_dat);
radius = 4.5;

log_frames = load(vidLog);

stim_f = fopen(stim_file, 'r');
dataArray = textscan(stim_f, '%f%f%f%[^\n\r]', 'Delimiter', ',', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,2-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(stim_f);
stim_trace = dataArray{3};

%Descriptive FicTrac variable names assigned below
frame = fictrac_out(:,1); %frame counter
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

%Correct jumps in x and y position due to tracking resets
intxposR = intxpos*radius;
intyposR = intypos*radius;
x_diff = diff(intxposR);
y_diff = diff(intyposR);
errors = abs(x_diff) > 3 | abs(y_diff) > 3;
BW = bwlabel(errors);
for err = 1: sum(errors)
    x_err = intxposR(BW == err);
    y_err = intyposR(BW == err);
    
    intxposR(find(BW == err,1)+1:end) = intxposR(find(BW == err,1)+1:end) - x_diff(find(BW == err,1));
    intyposR(find(BW == err,1)+1:end) = intyposR(find(BW == err,1)+1:end) - y_diff(find(BW == err,1));
end

out.intxposR = intxposR;
out.intyposR = intyposR;

%Designate stimulus frames
% if nanmean(stim_trace(1:2000) + 5 * std(stim_trace(1:2000))) < nanmean(stim_trace(end-2000:end))
%     stim_detrend = detrend(stim_trace);
% else
%     stim_detrend = stim_trace;
% end
if ~exist("thresh","var")

    figure; 
    hold on
    plot(stim_trace)
    thresh = input('input threshold:  ');
end


% thresh = nanmean(stim_detrend(1:2000)) + 5 * std(stim_detrend(1:2000));
stim_smooth = smooth(stim_trace, 15, 'sgolay', 7);
BW2 = bwlabel(stim_smooth > thresh);
stim_starts = [];
stim_ends = [];
i = 1;
for stim =1: max(BW2);
    if sum(BW2 == stim) < 600 | sum(BW2 == stim) > 2000;
    else
        stim_starts(i) = find(BW2 == stim,1);
        stim_ends(i)= find(BW2 == stim, 1, 'last');
        i = i + 1;
    end
end


frame_starts = log_frames(stim_starts);
frame_ends = log_frames(stim_ends);

stim_frames = [];

for stim = 1:length(stim_starts)
    trial_start{stim} = frame(find(frame > frame_starts(stim),1));
    trial_end{stim} = frame(find(frame < frame_ends(stim),1,'last'));
    trial_length = trial_end{stim}-trial_start{stim};
    trial_frames{stim} = trial_start{stim}-trial_length:trial_end{stim}+trial_length;
    stim_frames = [stim_frames, trial_start{stim}:trial_end{stim}];
end

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

end
