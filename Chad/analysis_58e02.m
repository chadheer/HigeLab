function[] = lobe_analysis(in, measure, lobe_id);

flies = fieldnames(in);
odor_delay = 0.3; % odor delay in seconds
beh_fr = 100;           % set frame rate for fictrac

%create x/axis in seconds
%custom color sequence for plots

blue = [114 147 203]./255;
red = [211 94 96]./255;
green = [132 186 91]./255;
brown = [171 104 87]./255;
purple = [144 103 167]./255;
cl_colors = {blue, red, ...
             green, brown, purple};


idx = 1;
i_beh = [];
i_F = [];

%loop through each fly
for fly = 1: length(flies)
    %find tasks for given fly
    tasks = fieldnames(in.(flies{fly}));
        
    %loop through each task
    for task = 1: length(tasks)
        fr = in.(flies{fly}).(tasks{task}).fr;

        if  measure == "inthead"; % find the difference between each points heading direction to determine the turning of the animal
            x = diff(in.(flies{fly}).(tasks{task}).(measure));
            x = [0; x];
            x(x>5000) = x(x>5000) - 36000; % elimante the large changes in turning that are caused when going over 360 degrees
            x(x<-5000) = x(x<-5000) + 36000; % elimante the large changes in turning that occur when going under 0 degrees

            in.(flies{fly}).(tasks{task}).(measure) = movmean(x, 10); % find the mean of ten frames to smooth data slightly
        end


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

        %make sure session data is empty
        clear beh_data;
        smooth_behavior = movmean(behavior, 200);

            trial_trace = [];
            trial_trace_zscore = [];
        %cycle through trials 
        for trial = 1:length(trial_frames);
            beh_trial_frames = in.(flies{fly}).(tasks{task}).trial_frames{trial};
            beh_data(trial,1:length(beh_trial_frames)) = smooth_behavior(beh_trial_frames);
        
            

            for roi = 1: size(data.F,2)
                if isfield(data, 'F_red')
                        trial_trace(trial, roi, :) = (data.F_red_norm((trial-1) * recording_length  + 1:trial * recording_length,roi));
                else
                    trial_trace(trial, roi, :) = (data.F((trial-1) * recording_length  + 1:trial * recording_length,roi));
                end
                trial_trace(trial,roi,:) = movmean(trial_trace(trial, roi, :),30);

                trial_trace_zscore(trial,roi,:) = (trial_trace(trial,roi,:) - nanmean(trial_trace(trial,roi,:)))/std(trial_trace(trial,roi,:));
          
            end
              
   
        end
%         beh_data(beh_data == 0) = NaN;

        for trial = 1: length(trial_frames);
            F = squeeze(trial_trace_zscore(trial,:,:));
            smooth_beh = beh_data(trial,:)';
            if measure == "movspd";
                smooth_beh(smooth_beh <= 2.6) = 0;
            end

            moving = bwlabel(smooth_beh);
            moving(1) = 0;
            transitions = diff([0;moving == 0; 0]);
            runstarts = find(transitions == -1);
            runends = find(transitions == 1);
            for bin = 1 : max(moving);
                if length(moving(moving == bin)) < beh_fr *2;
                    moving(moving == bin) = 0;
                elseif runstarts(bin) -runends(bin) < 1 * beh_fr
                    moving(moving == bin) = 0;
                end
            end
    
            moving = bwlabel(moving);
            
            for moving_period = 1: max(moving)
                i_time(moving_period) = find(moving == moving_period,1) / beh_fr;
                if i_time(moving_period) - 2 >= 0 & round((i_time(moving_period) + 3)*fr) <= length(F);
                    temp_F = F(:,round((i_time(moving_period)-2)* fr):round((i_time(moving_period) + 3)*fr));
                    i_F(idx,1:size(F,1),1:size(temp_F,2)) = temp_F;
                    i_beh(idx,:) = beh_data(trial,round((i_time(moving_period)-2)* beh_fr):round((i_time(moving_period) + 3)*beh_fr));
                    idx = idx + 1;
                end
            end

           
        end

        if ~isempty(i_beh);
%             figure;hold on
            x_beh = ((1:length(i_beh))/ beh_fr) -2 ;
            x_F = ((1:length(i_F))/ fr) - 2;
%             plot(x_beh,nanmean(i_beh));
%             for roi = 1: size(i_F,2)
%                     yyaxis right
%                     plot(x_F,squeeze(nanmean(i_F(:,roi,:))))
%             end

            legend(lobe_id)

            for pause = 1: size(i_beh)
                beh_int = interp1(x_beh, i_beh(pause,:), x_F);
%                 figure; hold on;
%                 plot(x_beh,i_beh(pause,:))
%                 plot(x_F, squeeze(i_F(pause,:,:))')

                for roi = 1: size(i_F,2)
                    mo_corr(pause,roi,:, :) = corrcoef(beh_int(2*fr:3.5*fr), squeeze(i_F(pause,roi,2*fr:3.5*fr))', 'Rows', "complete");
                end
    
            end
            mo_corr(:,:,1,2)
        end


        odors = unique(odor_id);
        for o = 1: length(odors)
            figure; hold on

            % grab trials for this odor
            trials =  odor_id == string(odors{o});
            beh_odor{o} = beh_data(trials,:);
            odor_trace{o} = trial_trace(trials,:,:);
            
            
                % normalize fluorescence trace to the mean of each trial
                % and find the mean traces
            norm_trace = odor_trace{o}; %./squeeze(nanmean(odor_trace{o},3));

            mean_response = squeeze(nanmean(trial_trace,1));
            
            mean_norm_trace = squeeze(nanmean(norm_trace,1));
            sem_norm_trace = squeeze(nanstd(norm_trace,[],1))./sqrt(size(norm_trace,1));
            
            norm_beh = beh_odor{o} ./ squeeze(nanmean(beh_odor{o},2));
            mean_beh = squeeze(nanmean(beh_odor{o},1));
            sem_beh_trace = squeeze(nanstd(norm_beh,[],1))./sqrt(size(norm_beh,1));

                        %plot mean fluorescence traces        
            x_time = ((1:length(mean_norm_trace)) / fr) - (odor_on + odor_delay);
                            figure; hold on
            
            x_beh = ((1:length(norm_beh))/ beh_fr) - (odor_on + odor_delay);

            figure; hold on
            for roi = 1: size(mean_norm_trace,1);

                
                rectangle('Position',[0 0.8 6 0.6], 'FaceColor',[0.97 0.97 0.97], 'Edgecolor', 'none');
                h = plot(x_time, mean_norm_trace(roi,:)', "Color", cl_colors{roi}, "LineWidth", 2);
                plot(x_time, mean_norm_trace(roi,:)' + sem_norm_trace(roi,:)', "Color", cl_colors{roi})
                        alpha(0.3)

                plot(x_time, mean_norm_trace(roi,:)' - sem_norm_trace(roi,:)', "Color", cl_colors{roi})
                        alpha(0.3)



                legend(lobe_id{roi})    
                lims = ylim ;
                xlim([-5,11]);
                xlabel("mean fluorescence F/F0")
                ylabel("Time from odor onset (s)")
                legend("UpWiN")

                x0=10;
                y0=10;
                width= 300;
                height= 200;
                set(gcf,'position',[x0,y0,width,height])

            end
            yyaxis right
            plot(x_beh, mean_beh)
            % normalize behavior to the mean of each trial and find the
            % mean traces
            norm_beh = beh_odor{o} ./ squeeze(nanmean(beh_odor{o},2));
            mean_beh = squeeze(nanmean(beh_odor{o},1));

            
            
            %plot behavior
            for trial = 1:size(norm_trace,1)

                x_f = ((1:length(norm_trace)) / fr);
                x_beh = ((1:length(beh_odor{o}))/ beh_fr);
    
                beh_int = interp1(x_beh, norm_beh(trial,:), x_f);
                n_rois = size(norm_trace,2);

                figure; hold on

                for roi = 1: size(norm_trace,2)
                    subplot(n_rois + 1, 1, roi)
                    hold on
                    plot(x_f, squeeze(norm_trace(trial,roi,:)), 'DisplayName', lobe_id{roi})
                    yyaxis right
                    plot(x_beh,beh_odor{o}(trial,:), 'DisplayName', 'speed (mm/s)');
                    legend
                    
                    corr_coef(roi,trial,:, :) = corrcoef(beh_int, squeeze(norm_trace(trial,roi,:))', 'Rows', "complete");
                end
                title([flies{fly} ' ' tasks{task} ' ' num2str(trial)])
                corr_coef(:,:,1,2)

                
            end

            % x_time = ((1:length(mean_beh)) / beh_fr) - (odor_on + odor_delay);
            % subplot(2,1,2)
            % j = plot(x_time, mean_beh')
            % legend(measure)
            % 
            % lims = ylim 
            % line([0 0], [lims(1) lims(2)], "color", 'k')
            % line([odor_dur,  odor_dur], [lims(1) lims(2)], "color", 'k')

            title(odors{o})


        end
                    corr_coef(:,:,1,2)
    end

end

end
