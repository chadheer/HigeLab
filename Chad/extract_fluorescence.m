
function [data] = extract_fluorescence(data,folder,bad_trials);

%find current folder wd
main_folder = pwd;
%change wd to folder with data
cd(folder);

%find fictrac data output
F_data = dir('*.csv');

% extract fluorescence data
temp_data = readtable(['Results.csv']);
temp_data(:,1)=[];
F = table2array(temp_data);

% smooth F
for roi = 1:size(F,2)
    smooth_F(:,roi) = smooth(F(:,roi), 31, 'sgolay', 7);
end
F = smooth_F;

% perform fft and find SNR by taking calcium transient frequencies/ non
% calcium transient frequencies 
N = length(F);
fs = 30;

xdft = fft(F);
xdft = xdft(1:N/2+1,:);
psdx = (1/(fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:fs/N:fs/2;

% figure;
normalized_psdx = psdx./nanmean(psdx(freq >= 1 & freq <= 3,:));
plot(freq,pow2db(normalized_psdx))
grid on
title("Periodogram Using FFT")
xlabel("Frequency (Hz)")
ylabel("Power/Frequency (dB/Hz)")
SNR = max(normalized_psdx(freq>0.05, :));

good_roi_F = [];
bad_F = [];
% if the SNR for a given roi isn't above threshold, remove it
for roi=1:size(F,2)
%     figure;
%     hold on
%     plot(F(:,roi))
%     title(num2str(SNR(roi)))
    if any(normalized_psdx(freq>0.05,roi) >= 50)
        good_roi_F(:,end+1) = F(:,roi);
    else
        bad_F(:,end+1) = F(:,roi);
    end
end


x = (1:length(F))/30;
% figure; hold on
% subplot(2,1,2)
% plot(x,nanmean(bad_F,2),"DisplayName", 'Low SNR axon ROIs')
% xlabel('Time(s)')
% ylabel('Mean F')
% legend
% subplot(2,1,1)
% plot(x,nanmean(good_roi_F,2),"DisplayName", 'High SNR axon ROIs')
% xlabel('Time(s)')
% ylabel('Mean F')
% legend
% title("Fourier Tranfrom filtered ROIs")

F = good_roi_F; 

% %Zscore data
% baseline = nanmean(F);
% baseline_sd = std(F);
% Zscore = (F- baseline) ./ baseline_sd;
% 
% plane_coef = corrcoef(F);
% 
% figure;
% imagesc(plane_coef)
% coef_thresh = 0.6; 
% corr_rois = {};
% score = {};
% 
% %identify correlated ROIs
% for roi = 1: length(plane_coef)
%     if any(find([corr_rois{:}] == roi))
%         
%     elseif any(ismember(find(plane_coef(roi,:)>coef_thresh),[corr_rois{:}]))
%         above_thresh = find(plane_coef(roi,:)>coef_thresh);
%         logic_index = ismember(above_thresh,[corr_rois{:}]);
%         combine_with = above_thresh(logic_index);
%         cell2combine = cellfun(@(c) any(ismember(c, combine_with)), corr_rois, 'uniform', false);
%         corr_rois{1,find([cell2combine{:}] == 1,1)} = [corr_rois{1,find([cell2combine{:}] == 1,1)},roi];
%     else
%         corr_rois{end+1} = find(plane_coef(roi,:)>coef_thresh);
%         
%     end
% end
% 
% %Find the first PC of correlated ROIs
% for roi = 1: size(corr_rois,2)
%     combined_roi = Zscore(:,corr_rois{roi});
%     [coeff{roi}, score.F{roi}, latent{roi}, tsquared{roi}, explained{roi}, mu{roi}] = pca(combined_roi);
% %     figure;
% %     plot(score.F{roi}(:,1))
% %     hold on
% %     yyaxis right
% %     plot(F(:,corr_rois{1,roi}(1)))
% %     title(num2str(roi))
%     score_cell.F(:,roi) = score.F{roi}(:,1);
% end

% F = score_cell.F;

% grab trial odor and session ids
trial_odor = [];
s_trial = [];
sessions = fieldnames(data);
for s = 1:length(sessions)
    trial = 1 + length(trial_odor);
    trial_odor = [trial_odor; data.(sessions{s}).odor_id];
    session_id(trial:length(trial_odor)) = sessions(s);
    s_trial = [s_trial, (1:length(data.(sessions{s}).odor_id))];
end

%find n trials and trial length
n_trials = length(trial_odor);
trial_length = ceil(length(F)/n_trials);

%split F into trials and find the Zscore and dff for each trial
for trial = 1: n_trials
    if any(bad_trials(:) == trial)
        trial_F = NaN(trial_length, size(F,2));
    elseif trial == n_trials
        temp = F([(trial-1) * trial_length + 1: end], :);
        trial_F(1:length(temp),:) = temp;
    else
        trial_F= F([(trial-1) * trial_length + 1: trial * trial_length], :);
    end
    
    baseline = nanmean(trial_F);
    baseline_sd = std(trial_F);
    Zscore = (trial_F - baseline) ./ baseline_sd;
    dff = (trial_F - baseline) ./ baseline;
%     for roi = 1: size(F,2)
%         smooth_Zscore(:,roi) = smooth(Zscore(:,roi), 31, 'sgolay', 5);
%     end

    data.(session_id{trial}).F(s_trial(trial),:,:) = trial_F; 
    data.(session_id{trial}).Zscore(s_trial(trial),:,:) = Zscore; 
    data.(session_id{trial}).dff(s_trial(trial),:,:) = dff; 

%     data.(session_id{trial}).smooth_Zscore(s_trial(trial),:,:) = smooth_Zscore; 
end

cd(main_folder);

end
