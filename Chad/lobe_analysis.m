function[] = lobe_analysis(in, measure, lobe_id);

flies = fieldnames(in);
odor_delay = 0.3 % odor delay in seconds
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

%loop through each fly
for fly = 1: length(flies)
    %find tasks for given fly
    tasks = fieldnames(in.(flies{fly}));
        
    %loop through each task
    for task = 1: length(tasks)
        fr = in.(flies{fly}).(tasks{task}).fr;

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
        
                trial_trace(trial, roi, :) = (data.F((trial-1) * recording_length  + 1:trial * recording_length,roi));
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
            norm_trace = odor_trace{o};

            mean_response = squeeze(nanmean(trial_trace,1));
            
            mean_norm_trace = squeeze(nanmean(norm_trace,1));
            sem_norm_trace = squeeze(nanstd(norm_trace,[],1))./sqrt(size(norm_trace,1));
            

            mean_beh = squeeze(nanmean(beh_odor{o},1));
            sem_beh = nanstd(beh_odor{o},1)./sqrt(size(beh_odor{o},1));
            
           
                        %plot mean fluorescence traces        
            for roi = 1: size(mean_norm_trace,1);
                figure(roi); hold on
                x_time = ((1:length(mean_norm_trace)) / fr) - (odor_on + odor_delay);

                % rectangle('Position',[0 0.8 6 0.6], 'FaceColor',[0.97 0.97 0.97], 'Edgecolor', 'none')
                h = plot(x_time, mean_norm_trace(roi,:)', "LineWidth", 2, 'Color', cl_colors{o+task - 1}, 'DisplayName',odors{o})
                plot(x_time, mean_norm_trace(roi,:)' + sem_norm_trace(roi,:)', 'Color', cl_colors{o+task - 1}, 'DisplayName',odors{o})
                        alpha(0.3)

                plot(x_time, mean_norm_trace(roi,:)' - sem_norm_trace(roi,:)','Color', cl_colors{o+task - 1},'DisplayName',odors{o})
                        alpha(0.3)


                legend(lobe_id{roi})    
                lims = ylim 
                xlim([-5,11])
                xlabel("mean fluorescence F/F0")
                ylabel("Time from odor onset (s)")
                legend("UpWiN")

                x0=10;
                y0=10;
                width= 300;
                height= 200;
                set(gcf,'position',[x0,y0,width,height])

                % yyaxis right
                % 
                % x_beh = ((1:length(mean_beh)) / beh_fr) - (odor_on + odor_delay);
                % j = plot(x_beh, mean_beh')
                % 
                % legend("F", "", "", "behavior")

            end
            
            % for trial = 1:size(beh_odor{o},1)
            %     figure; hold on
            %     plot(x_time, squeeze(trial_trace(trial,2,:)) , "LineWidth", 2, 'Color', cl_colors{1})
            % 
            %     plot(x_beh, beh_odor{o}(trial,:))
            % end
            % 
            % 
            % title(odors{o})

        end
        
    end



end

% for roi = 1: size(trial_trace.(odors{o}) ,2)
%     figure; hold on
%     for task = 1: size(tasks)
%         for o = 1: size(odors,1)
% 
%             figure; hold on
%             x_time = ((1:length(trial_trace.(odors{o}))) / fr) - (odor_on + odor_delay);
% 
%             rectangle('Position',[0 0.8 6 0.6], 'FaceColor',[0.97 0.97 0.97], 'Edgecolor', 'none')
%             h = plot(x_time, mean_norm_trace(roi,:)', "LineWidth", 2, 'Color', cl_colors{1})
%             plot(x_time, mean_norm_trace(roi,:)' + sem_norm_trace(roi,:)', 'Color', cl_colors{1})
%                     alpha(0.3)
% 
%             plot(x_time, mean_norm_trace(roi,:)' - sem_norm_trace(roi,:)','Color', cl_colors{1})
%                     alpha(0.3)
% 
% 
%             legend(lobe_id{roi})    
%             lims = ylim 
%             xlim([-5,11])
%             xlabel("mean fluorescence F/F0")
%             ylabel("Time from odor onset (s)")
%             legend("UpWiN")
% 
%             x0=10;
%             y0=10;
%             width= 300;
%             height= 200;
%             set(gcf,'position',[x0,y0,width,height])
% 
%             yyaxis right
% 
%             x_beh = ((1:length(mean_beh)) / beh_fr) - (odor_on + odor_delay);
%             j = plot(x_beh, mean_beh')
% 
%             legend("F", "", "", "behavior")
%         end
%     end
% end


end
