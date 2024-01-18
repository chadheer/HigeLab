%% Instructions
% % 
% % User must import comma delimited data file generated by FicTrac
% % Instructions for Import Data
% %     Home > Import Data
% %     Prompt1 :
% %     Select .dat file created by FicTrac;
% %     Prompt2 :
% %     Select .txt log frames file created by FicTrac;
% %     Prompt3 : 
% %     Select .csv file from ImageJ 
% %     Change "Output Type" to "Column vectors"
% %     Then select "Import Data"
% % 
% % Assumes video is acquired at 60 fps
% % Last updated by Drew, 14 Feb 2022

%% FicTracExtract.m
file = uigetfile('*.dat');
fictrac_out = load(file);
radius = 4.5;

vidLog = uigetfile('*.txt');
log_frames = load(vidLog);

stim_file = uigetfile('*.csv');
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

%Designate stimulus frames
% if nanmean(stim_trace(1:2000) + 5 * std(stim_trace(1:2000))) < nanmean(stim_trace(end-2000:end))
%     stim_detrend = detrend(stim_trace);
% else
%     stim_detrend = stim_trace;
% end
figure; 
hold on
plot(stim_trace)
thresh = input('input threshold:  ');

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
    
    trial_xpos = intxposR(trial_start{stim}:trial_end{stim}) - intxposR(trial_start{stim});
    trial_ypos = intyposR(trial_start{stim}:trial_end{stim}) - intyposR(trial_start{stim});
    pre_xpos = intxposR(trial_start{stim} - (trial_length):trial_start{stim}) - intxposR(trial_start{stim});
    pre_ypos = intyposR(trial_start{stim} - (trial_length):trial_start{stim}) - intyposR(trial_start{stim});
    post_xpos = intxposR(trial_end{stim}:trial_end{stim} + (trial_length)) - intxposR(trial_start{stim});
    post_ypos = intyposR(trial_end{stim}:trial_end{stim} + (trial_length)) - intyposR(trial_start{stim});

    
    figure;hold on
    plot(trial_xpos, trial_ypos)
    plot(trial_xpos(1),trial_ypos(1),'g.','markersize',20);
    plot(pre_xpos, pre_ypos);
    plot(post_xpos, post_ypos);
    stim_frames = [stim_frames, trial_start{stim}:trial_end{stim}];
end

    
%plot moving speed
smooth_spd = fps * radius*movmean(movspd, 10);
figure;hold on
max_length = max(cell2mat(cellfun(@size,trial_frames,'uni',false)));
session_spd = NaN(length(stim_starts), max_length);

for stim = 1:length(stim_starts);
    session_spd(stim,1:length(trial_frames{stim})) = smooth_spd(trial_frames{stim});
    plot(smooth_spd(trial_frames{stim}), 'Color', [.7 .7 .7])
end
plot(nanmean(session_spd))
sem = nanstd(session_spd)./sqrt(size(session_spd,1));
plot(nanmean(session_spd)+sem,'r')
plot(nanmean(session_spd)-sem, 'r')
line([trial_length, trial_length], [min(smooth_spd),max(smooth_spd)]);
line([2*trial_length, 2*trial_length], [min(smooth_spd),max(smooth_spd)]);


figure; hold on
smooth_xangle = movmean(drotvlx,10);
for stim = 1:length(stim_starts);
    session_xangle(stim,1:length(trial_frames{stim})) = smooth_xangle(trial_frames{stim});
    plot(smooth_xangle(trial_frames{stim}), 'Color', [.7 .7 .7])
end
plot(nanmean(session_xangle))
line([trial_length, trial_length], [min(smooth_xangle),max(smooth_xangle)]);
line([trial_length*2, trial_length*2], [min(smooth_xangle),max(smooth_xangle)]);

figure; hold on
smooth_yangle = movmean(drotvly,10);
for stim = 1:length(stim_starts);
    session_yangle(stim,1:length(trial_frames{stim})) = smooth_yangle(trial_frames{stim});
    plot(smooth_yangle(trial_frames{stim}), 'Color', [.7 .7 .7])
end
plot(nanmean(session_yangle))
line([trial_length, trial_length], [min(smooth_yangle),max(smooth_yangle)]);
line([trial_length*2, trial_length*2], [min(smooth_yangle),max(smooth_yangle)]);

figure; hold on
smooth_zangle = movmean(drotvlz,10);
for stim = 1:length(stim_starts);
    session_zangle(stim,1:length(trial_frames{stim})) = smooth_zangle(trial_frames{stim});
    plot(smooth_zangle(trial_frames{stim}), 'Color', [.7 .7 .7])
end
plot(nanmean(session_zangle))
line([trial_length, trial_length], [min(smooth_zangle),max(smooth_zangle)]);
line([trial_length*2, trial_length*2], [min(smooth_zangle),max(smooth_zangle)]);

smooth_movdir = smooth(inthead * 180/3.14159, 21, 'sgolay', 7);
movdir_diff = diff(smooth_movdir);
figure; hold on
smooth_movdir_diff = movmean(movdir_diff,10);
for stim = 1:length(stim_starts);
    session_movdir_diff(stim,1:length(trial_frames{stim})) = smooth_movdir_diff(trial_frames{stim});
    plot(smooth_movdir_diff(trial_frames{stim}), 'Color', [.7 .7 .7])
end
plot(nanmean(session_movdir_diff))
line([trial_length, trial_length], [min(smooth_movdir_diff),max(smooth_movdir_diff)]);
line([trial_length*2, trial_length*2], [min(smooth_movdir_diff),max(smooth_movdir_diff)]);
% figure; hold on
% plot(smooth_spd)
% plot(stim_frames, smooth_spd(stim_frames))
% %Calculate and plot distance traveled
% totaldist = radius*(sum(movspd));
% dist = radius*movspd;
% cdist = cumsum(dist);
% strDist = sprintf('Total distance traveled: %d mm',totaldist);
% 
% figure;
% hold on
% plot(x,cdist,'k')
% plot(x(stim_frames), cdist(stim_frames), "o")
% xticks(0:fp30s:x(end))
% xticklabels({'0','30','60','90','120','150','180','210','240','270','300'})
% title('Cumulative distance traveled')
% ylabel('Distance (mm)')
% xlabel('Time (s)')
% annotation('textbox',[[.4 0 .22 .22]],'String',strDist,'FitBoxToText','on')
% 
% plotname = 'DistanceTraveled.fig';
% savefig(plotname);
% close(gcf)
% 
% %Plot fictive path of fly
% 
% plot(intxposR(1),intyposR(1),'g.','markersize',20);
% hold on
% plot(intxposR(end),intyposR(end),'r.','markersize',20);
% plot(intxposR,intyposR);
% plot(intxposR(stim_frames), intyposR(stim_frames))
% xlabel('mm')
% ylabel('mm')
% hold off
% 
% plotname = 'FictivePath.fig';
% savefig(plotname);
% close(gcf)