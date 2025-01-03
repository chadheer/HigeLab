temp_data = readtable(['plane3.csv']);
temp_data(:,1)=[];
F = table2array(temp_data);

trial_length = 226;
n_trials = length(F)/ trial_length;
for roi = 1: size(F,2);
    
    for trial = 1: n_trials;
        trial_frames = (trial-1) * trial_length + 1: trial * trial_length;
    
        trial_F(trial,:) = F(trial_frames,roi);
    
        baseline = nanmean(trial_F(trial,:));
        baseline_sd = std(trial_F(trial,:));
        Zscore(trial,:) = (trial_F(trial,:) - baseline) ./ baseline_sd;
        dff(trial,:) = (trial_F(trial,:) - baseline) ./ baseline;
        
        smooth_Zscore(trial,:) = smooth(Zscore(trial,:), 10, 'sgolay', 3);
    end
    x = ((1:226) -100) / 6;
    ACV_trials = (1:3);
    OCT_pre = (4:2:8);
    MCH_pre = (5:2:9);
    OCT_post = (10:2:20);
    MCH_post = (11:2:21);
    sem = nanstd(squeeze(smooth_Zscore(ACV_trials, :)))./sqrt(size(smooth_Zscore(ACV_trials,:),1));
    mean_Zscore = nanmean(smooth_Zscore(ACV_trials,:),1)
    figure;
    hold on
    plot(x, nanmean(smooth_Zscore(ACV_trials,:),1), 'b', "DisplayName", "ACV")
    patch([x fliplr(x)], [(mean_Zscore+sem)  fliplr(mean_Zscore -sem)], 'b')
    alpha(0.3)


%     plot(nanmean(Zscore(OCT_pre,:),1), "DisplayName", "OCT pre");
%     plot(nanmean(Zscore(MCH_pre,:),1), "DisplayName", "MCH pre");
%     plot(nanmean(Zscore(OCT_post,:),1), "DisplayName", "OCT post");
%     plot(nanmean(Zscore(MCH_post,:),1), "DisplayName", "MCH post");
    legend
    
    figure; hold on
    
    for trial = 1: length(ACV_trials)
        plot(Zscore(ACV_trials(trial),:));
    end
end