function[] = lobe_analysis(in, measure, lobe_id);

flies = fieldnames(in);
fr = 30;                % set frame rate for imaing
odor_delay = 0.3 % odor delay in seconds
beh_fr = 100;           % set frame rate for fictrac

%create x/axis in seconds
%custom color sequence for plots
color_seq = ["b", "r", "g", "m"];

%loop through each fly
for fly = 1: length(flies)
    %find tasks for given fly
    tasks = fieldnames(in.(flies{fly}));
        
    %loop through each task
    for task = 1: length(tasks)

        % find the odor_id for a given task, and asign the delay for the
        % odor delivery for that task
        odor_id = in.(flies{fly}).(tasks{task}).odor_id;

        %grab behavioral data 
        behavior = in.(flies{fly}).(tasks{task}).(measure);
        trial_frames = in.(flies{fly}).(tasks{task}).trial_frames;
        trial_x = in.(flies{fly}).(tasks{task}).trial_x;
        %grab fluorescence data
        data = in.(flies{fly}).(tasks{task});

        odor_on = data.Data_1.parameter.preO;
        odor_dur = data.Data_1.parameter.odorD;
        
        num_t = size(data.odor_id,1);
        recording_length = floor(size(data.F,1)/num_t);
        
        trial_trace = NaN(num_t, size(data.F,2), recording_length);
        %create x_axis to align trials to
        % length_x = 1:length(x_axis);

        % smooth data
        smooth_behavior = movmean(behavior, 30);

    
        %make sure session data is empty
        clear beh_data;
        

        %cycle through trials 
        for trial = 1:length(trial_frames);
            beh_trial_frames = in.(flies{fly}).(tasks{task}).trial_frames{trial};
            beh_data(trial,1:length(beh_trial_frames)) = smooth_behavior(beh_trial_frames);
        
            

            for roi = 1: size(data.F,2)
        
                trial_trace(trial, roi, :) = table2array(data.F((trial-1) * recording_length  + 1:trial * recording_length,roi));
                trial_trace(trial,roi,:) = smooth(trial_trace(trial, roi, :), 20, "sgolay", 7);
          
            end
            
        end
        beh_data(beh_data == 0) = NaN;

        odors = unique(odor_id);
        for o = 1: length(odors)
            figure; hold on

            % grab trials for this odor
            trials =  odor_id == string(odors{o})
            beh_odor{o} = beh_data(trials,:);
            odor_trace{o} = trial_trace(trials,:,:);
            
            
                % normalize fluorescence trace to the mean of each trial
                % and find the mean traces
            norm_trace = odor_trace{o} ./ squeeze(nanmean(odor_trace{o},3));
            
            mean_response = squeeze(nanmean(trial_trace,1));
            
            mean_norm_trace = squeeze(nanmean(norm_trace,1));
            
           
                        %plot mean fluorescence traces        
            x_time = ((1:length(mean_norm_trace)) / fr) - (odor_on + odor_delay);
            subplot(2,1,1)
            h = plot(x_time, mean_norm_trace')
            title([flies{fly} ' ' tasks{task}])
            legend(lobe_id)
            hold on
    
            lims = ylim 
            line([0 0], [lims(1) lims(2)], "color", 'k')
            line([odor_dur,  odor_dur], [lims(1) lims(2)], "color", 'k')

            % normalize behavior to the mean of each trial and find the
            % mean traces
            norm_beh = beh_odor{o} ./ squeeze(nanmean(beh_odor{o},2));
            mean_beh = squeeze(nanmean(beh_odor{o},1));
            
            %plot behavior
            
            x_time = ((1:length(mean_beh)) / beh_fr) - (odor_on + odor_delay);
            subplot(2,1,2)
            j = plot(x_time, mean_beh')
            legend(measure)

            lims = ylim 
            line([0 0], [lims(1) lims(2)], "color", 'k')
            line([odor_dur,  odor_dur], [lims(1) lims(2)], "color", 'k')

            title(odors{o})

        end
        
    end

end


end
