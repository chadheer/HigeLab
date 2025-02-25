temp_data = readtable(['Results.csv']);
temp_data(:,1)=[];
F = table2array(temp_data);

trial_length = 1353;
n_planes = 1;
fr = 31;
odor_start = 600;
n_trials = length(F)/ trial_length;
for roi = 1: size(F,2);
    
    for trial = 1: n_trials;
        trial_frames = (trial-1) * trial_length + 1: trial * trial_length;
    
        trial_F(trial,:) = F(trial_frames,roi);
    
        baseline = nanmean(trial_F(trial,:));
        baseline_sd = std(trial_F(trial,:));
        Zscore(trial,:) = (trial_F(trial,:) - baseline) ./ baseline_sd;
        dff(trial,:) = (trial_F(trial,:) - baseline) ./ baseline;
        
        smooth_Zscore(trial,:) = smooth(Zscore(trial,:), 31, 'sgolay', 5);
    end
    x = ((1:trial_length) -odor_start) / n_planes;
    ACV_trials = (1:6);
    OCT_pre = (7:2:12);
    MCH_pre = (8:2:12);
    OCT_post = (13:2:24);
    MCH_post = (14:2:24);
    sem = nanstd(squeeze(smooth_Zscore(ACV_trials, :)))./sqrt(size(smooth_Zscore(ACV_trials,:),1));
    mean_Zscore(roi,:) = nanmean(smooth_Zscore(ACV_trials,:),1);
    figure;
    hold on
    plot(x, mean_Zscore(roi,:), 'b', "DisplayName", "ACV")
    patch([x fliplr(x)], [(mean_Zscore(roi,:)+sem)  fliplr(mean_Zscore(roi,:) -sem)], 'b')
    alpha(0.3)


    plot(x,nanmean(smooth_Zscore(OCT_pre,:),1), "DisplayName", "OCT pre");
    plot(x,nanmean(smooth_Zscore(MCH_pre,:),1), "DisplayName", "MCH pre");
    plot(x,nanmean(smooth_Zscore(OCT_post,:),1), "DisplayName", "OCT post");
    plot(x,nanmean(smooth_Zscore(MCH_post,:),1), "DisplayName", "MCH post");
    legend
    
%     figure; hold on
%     
%     for trial = 1: length(ACV_trials)
%         plot(Zscore(ACV_trials(trial),:));
%     end

end
figure;
pop_mean = nanmean(mean_Zscore,1)
pop_sem = nanstd(mean_Zscore)./sqrt(size(mean_Zscore,1));

figure;
hold on
plot(x, pop_mean, 'b', "DisplayName", "ACV")
patch([x fliplr(x)], [(pop_mean+pop_sem)  fliplr(pop_mean -pop_sem)], 'b')
alpha(0.3)


