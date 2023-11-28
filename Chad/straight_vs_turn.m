function [] = straight_vs_turn(in, measure)

%determine fly names
flies = fieldnames(in);

%loop through each fly
for fly = 1: length(flies)
    tasks = fieldnames(in.(flies{fly}));


    if any(tasks == "left") & measure ~= "movspd";  %change the sign so that the odor delivery direction is always negative
        in.(flies{fly}).left.(measure) = -in.(flies{fly}).left.(measure);
    end
    
    if measure == "movdir" | measure == "inthead"; % find the difference between each points moving direction to determine the turning of the animal
       
        for task = 1:length(tasks)
            x = diff(in.(flies{fly}).(tasks{task}).(measure));
            x = [0; x];
            x(x>5000) = x(x>5000) - 36000;
            x(x<-5000) = x(x<-5000) + 36000;

            in.(flies{fly}).(tasks{task}).(measure) = movmean(x, 10);
        end

    end

    %align data from each trial for the given measure
    data = in.(flies{fly}).straight.(measure);
    trial_length = in.(flies{fly}).straight.trial_length;
    trial_frames = in.(flies{fly}).straight.trial_frames;
    % figure; hold on
    smooth_data = movmean(data,10);
    for stim = 1:length(trial_frames);
        session_data(fly,stim,1:length(trial_frames{stim})) = smooth_data(trial_frames{stim});
        % plot(smooth_data(trial_frames{stim}), 'Color', [.7 .7 .7])
    end
    
    %find the mean and SEM for data for each fly
    data_mean(fly,1:length(squeeze(session_data(fly,:,:)))) = nanmean(squeeze(session_data(fly,:,:)));
    data_sem(fly,1:length(squeeze(session_data(fly,:,:)))) = nanstd(squeeze(session_data(fly,:,:)))./sqrt(size(squeeze(session_data(fly,:,:)),1));
    
    %align data for side odor deliver for each trial
    data_turn = in.(flies{fly}).(tasks{2}).(measure);
    turn_trial_length = in.(flies{fly}).(tasks{2}).trial_length;
    turn_trial_frames = in.(flies{fly}).(tasks{2}).trial_frames;
    figure; hold on
    smooth_turn_data = movmean(data_turn,10);
    for stim = 1:length(turn_trial_frames);
        session_turn_data(fly,stim,1:length(turn_trial_frames{stim})) = smooth_turn_data(turn_trial_frames{stim});
        % plot(smooth_turn_data(turn_trial_frames{stim}), 'Color', [.7 .7 .7])
    end
    
    %find mean and sem for each fly
    turn_data_mean(fly,1:length(squeeze(session_turn_data(fly,:,:)))) = nanmean(squeeze(session_turn_data(fly,:,:)));
    turn_data_sem(fly,1:length(squeeze(session_turn_data(fly,:,:)))) = nanstd(squeeze(session_turn_data(fly,:,:)))./sqrt(size(squeeze(session_turn_data(fly,:,:)),1));
    
    %plot data for each fly
    plot(data_mean(fly,:)+data_sem(fly,:),'r')
    plot(data_mean(fly,:)-data_sem(fly,:), 'r')
    plot(data_mean(fly,:), 'b')
    plot(turn_data_mean(fly,:)+turn_data_sem(fly,:),'k')
    plot(turn_data_mean(fly,:)-turn_data_sem(fly,:), 'k')
    plot(turn_data_mean(fly,:), 'g')
    line([trial_length, trial_length], [min(smooth_data),max(smooth_data)]);
    line([trial_length*2, trial_length*2], [min(smooth_data),max(smooth_data)]);
    
    %find average data for pre, during and post stimulus
    straight_mean(1,fly,:) = nanmean(squeeze(session_data(fly,:,1:trial_length)),2);
    straight_mean(2,fly,:) = nanmean(squeeze(session_data(fly,:,trial_length+1:trial_length *2)),2);
    straight_mean(3,fly,:) = nanmean(squeeze(session_data(fly,:,trial_length * 2+1:trial_length*3)),2);

    turn_mean(1,fly,:) = nanmean(squeeze(session_turn_data(fly,:,1:trial_length)),2);
    turn_mean(2,fly,:) = nanmean(squeeze(session_turn_data(fly,:,trial_length+1:trial_length *2)),2);
    turn_mean(3,fly,:) = nanmean(squeeze(session_turn_data(fly,:,trial_length * 2+1:trial_length*2.5)),2);
end

%boxplot
task_mean = squeeze(nanmean(straight_mean,3));
task_mean = [task_mean; squeeze(nanmean(turn_mean,3))];

% boxplot(task_mean([1,2,5,3],:)')
[p,t,stats] = anova1(task_mean([1,2,5,3],:)')
[c,m,h,gnames] = multcompare(stats);

%plot trial by trial population means
trial_mean  = squeeze(nanmean(session_data,1));

trials = size(trial_mean,1);
red = [0.9290 0.6940 0.1250];
pink = [0.4940 0.1840 0.5560];
colors_p = [linspace(red(1),pink(1),trials)', linspace(red(2),pink(2),trials)', linspace(red(3),pink(3),trials)'];

figure; hold on
for trial = 1:size(trial_mean,1)
    plot(trial_mean(trial,:), 'Color', colors_p(trial,:));
end

%find population mean and sem for straight and side trials
pop_mean = nanmean(data_mean);
pop_sem = nanstd(data_mean)./sqrt(size(data_mean,1));
turn_pop_mean = nanmean(turn_data_mean);
turn_pop_sem = nanstd(turn_data_mean)./sqrt(size(turn_data_mean,1));

%plot population data
figure; hold on
plot(data_mean', 'Color', [.7 .7 .7]);
plot(pop_mean, 'k')
plot(turn_data_mean', 'Color', [0 .7 .7]);
plot(turn_pop_mean, 'b')
line([trial_length, trial_length], [min(smooth_data),max(smooth_data)]);
line([trial_length*2, trial_length*2], [min(smooth_data),max(smooth_data)]);

