
function [data] = extract_fluorescence(data,folder);

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
trial_length = floor(length(F)/n_trials);

for trial = 1: n_trials
    trial_F = F([(trial-1) * trial_length + 1: trial * trial_length], :);
    
    baseline = nanmean(trial_F);
    baseline_sd = std(trial_F);
    Zscore = (trial_F - baseline) ./ baseline_sd;
    dff = (trial_F - baseline) ./ baseline;
    for roi = 1: size(F,2)
        smooth_Zscore(:,roi) = smooth(Zscore(:,roi), 31, 'sgolay', 5);
    end

    data.(session_id{trial}).F(s_trial(trial),:,:) = trial_F; 
    data.(session_id{trial}).Zscore(s_trial(trial),:,:) = Zscore; 
    data.(session_id{trial}).smooth_Zscore(s_trial(trial),:,:) = smooth_Zscore; 
end

cd(main_folder);

end
