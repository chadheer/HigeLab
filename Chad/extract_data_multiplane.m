%% extract data
%INPUTS
%folder = folder where fictrac and fluorescence data is found
%thresh = optional variable, set threshold for fiji output tracking led
%turning on and off indicating odor delivery

function [out] = extract_fictrac(folder, thresh);
%find current folder wd
main_folder = pwd;
%change wd to folder with data
cd(folder);

out_file = dir('extracted_data.mat');

%if an out file already exists, load it and skip all steps


%find and load parameters fild
param_file = dir('parameters*.mat');
params = load(param_file.name);

%% load in behavioral data and odor_delivery information
%find fictrac data output

%find fictrac data output
fictrac_dat = dir('*fictrac*.dat');
fictrac_out = load(fictrac_dat.name);
%set radius of ball
radius = 4.5;
fps = 100;

%grab odor_delivery output file from thstim if it exists
stim_file = dir('*odor_delivery*.mat');

if isempty(stim_file);

    %if it does not exist grab the fiji output csv
    stim_file = dir('*Results*.csv');
end


frame = fictrac_out(:,1); %frame counter

%if it's the thstim mat file, load the starts, stops and ids of odor delivery
if stim_file.name(end-3:end) == '.mat';
    odor_delivery = load(stim_file.name);
    stim_starts = odor_delivery.odor.on;
    stim_end = odor_delivery.odor.off;
    frame_starts = find(ismember(frame,stim_starts));
    frame_ends = find(ismember(frame,stim_end));
    odor_id = odor_delivery.odor.id;

    %if not load the csv from imagej of the light turning on, and find
    %where the light turns on and off indicating odor on vs off. 
else
    vidLog = dir('*vidLogFrames*.txt');
    log_frames = load(vidLog.name);
    stim_f = fopen(stim_file.name, 'r');
    dataArray = textscan(stim_f, '%f%f%f%[^\n\r]', 'Delimiter', ',', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,2-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    fclose(stim_f);
    stim_trace = dataArray{3};
    
    %plot the csv trace and set a threshold
    figure; 
    hold on
    plot(stim_trace)

    if isempty(thresh)
        thresh = input('input threshold:  ');
    end
    

    stim_smooth = smooth(stim_trace, 15, 'sgolay', 7);
    
    %use that threshold to find the times where the led turns on and off
    %indicating odor on vs off
    BW2 = bwlabel(stim_smooth > thresh);
    stim_starts = [];
    stim_ends = [];
    i = 1;
    for stim =1: max(BW2);
        if sum(BW2 == stim) < 200 | sum(BW2 == stim) > 2000;
        else

            stim_starts(i) = find(BW2 == stim,1);
            stim_ends(i)= find(BW2 == stim, 1, 'last');
            i = i + 1;
        end
    end

    frame_starts = log_frames(stim_starts);
    frame_ends = log_frames(stim_ends);
    
end


%% input ROI data and extract fluorescence using Drew's method
if ~isempty(out_file)
    load(out_file.name);

    % change the wd back to the main folder
    cd(main_folder);
else
% Get user input
prompt = {'Enter image acquisition rate (in fps):','Enter frames per trial:','Enter radius of ROIs'};
dlgtitle = 'Gathering user input';
fieldsize = [1 45; 1 45; 1 45];
definput = {'5','226','15'};
answer = inputdlg(prompt,dlgtitle,fieldsize,definput);
fps = str2double(answer{1});
fpt = str2double(answer{2});
roiRadius = str2double(answer{3});

%grab position and image names for any planes where roi positions have been defined
F_name = dir('tiffs/suite2p/plane*positions.csv');
n_planes = length(F_name);

for plane =1: n_planes
    plane_id(plane,1) = F_name(plane).name(6);
    image_files{plane} = ['tiffs/suite2p/plane' plane_id(plane) '.tif'];
end

% Import ROI data
fprintf('Importing ROI data...');
for plane = 1:n_planes

    [roiCount,pixX,pixY,pixZ,roiID] = readvars(['tiffs/suite2p/' F_name(plane).name]);
 
    % Combine, trim, and sort variables (Since ImageJ measurements list them
    % in the order of most recently edited, not in order of slice)

    roiDataCombined = horzcat(roiID,pixZ,pixX,pixY,roiCount);
    roiDataCombined = roiDataCombined(2:end,:);
    roiDataCombinedSorted = sortrows(roiDataCombined,[1 2]);

    % Trim heading from each of the above imported variables then load into
    % structure
    DataROI(plane).roiCount = roiDataCombinedSorted(:,5);
    DataROI(plane).pixX = roiDataCombinedSorted(:,3);
    DataROI(plane).pixY = roiDataCombinedSorted(:,4);
    DataROI(plane).pixZ = roiDataCombinedSorted(:,2);
    DataROI(plane).roiIDint = roiDataCombinedSorted(:,1); %ROI ID internal to the file

end

% Give unique names to roiIDs across files
% For example, File 1: 1-3, File 2: 4-8, etc.
% Instead of, File 1: 1-3, File 2: 1-5, etc.
axon_ID = 0;
for n = 1:n_planes
    if n == 1
        DataROI(n).roiID = DataROI(n).roiIDint;
    elseif contains(F_name(n).name, 'axon')
        DataROI(n).roiID = DataROI(n).roiIDint; %ROI ID including other files   
        axon_ID = axon_ID + max(DataROI(n).roiIDint);
    else 
        startFrom = max(DataROI(n-1).roiIDint);
        DataROI(n).roiID = DataROI(n).roiIDint + startFrom; %ROI ID including other files
    end
end

fprintf('complete.\n');

% load in tiff and extract roi data

% Load images
parOn = 1; % Set to 0 if preferred to load data without pool
for plane = 1:n_planes
    clear video
    fileNumberDisplay = strcat('File_',num2str(plane),'\n');
    fprintf(fileNumberDisplay);
    fprintf('Loading imaging data...');


%     tiffInfo = imfinfo(image_files{plane});
%     numFrames = numel(tiffInfo);

    video = tiffreadVolume(image_files{plane});
    numFrames = size(video,3);

%     video=zeros(numFrames,tiffInfo(1).Height,tiffInfo(1).Width, 'single');
% 
%     if parOn
%         parfor i=1:numFrames
%             video(i,:,:)=imread(image_files{plane},i);
%         end
%     else
%         for i=1:numFrames
%             video(i,:,:)=imread(image_files{plane},i);
%         end
%     end
   
    fprintf('complete.\n');

    % Recover SI scale (Lost and replaced with arbitrary values during pre-processing)
    % These values taken from raw image metadata:
    %   linear calibration where y = a + bx
    %   y = SI pixel value
    %   a = -32768.0
    %   b = 1.0
    %   x = raw pixel intensity (0-65536)

    if mean(mean(mean(video))) > 15000
        a = -32768.0;
        b = 1.0;
        for i = 1:size(video,3)
            for j = 1:size(video,1)
                for k = 1:size(video,2)
                    video(j,k,i) = a + b*(video(j,k,i));
                end
            end
        end
        disp('Pixel intensity values calibrated to ScanImage scale.')
    else
        disp('Pixel intensity values unchanged.')
    end
    
    % Assign trials to frame ranges
    nTrials = numFrames/fpt;
    trialGuide(:,1) = 1:nTrials;
    trialGuide(:,2) = 1:fpt:numFrames;
    trialGuide(:,3) = fpt:fpt:numFrames;

    % Store fluorescence intensity data
    fprintf('Storing fluorescence intensity data...');
    if contains(F_name(plane).name, 'axon')
        radius = 4; 
    else 
        radius = roiRadius;
    end

    % Get pixels to include within ROI

    for i = 1:size(DataROI(plane).roiCount,1)
        pixCenter = floor([DataROI(plane).pixX(i),DataROI(plane).pixY(i)])
        %get points of a circle with given radius around given center point
        th = 0:pi/50:2*pi;
        x_ROI = (radius * cos(th) + pixCenter(1));
        y_ROI = (radius * sin(th) + pixCenter(2));
        
        
        % get all possible integer points that may lie within circle
        countX = 0;
        for j = (pixCenter(1)-radius):(pixCenter(1)+radius)
            countX = countX+1;
            countY = 0;
            for k = (pixCenter(2)-radius):(pixCenter(2)+radius)
                countY = countY+1;
                pixIncludedX(countX,countY) = j;
                pixIncludedY(countX,countY) = k;
            end
        end
        pixIncludedX2 = reshape(pixIncludedX,1,[]);
        pixIncludedY2 = reshape(pixIncludedY,1,[]);
        
        % grab the idx of all points within circle
        in = inpolygon(pixIncludedX2,pixIncludedY2, x_ROI, y_ROI);
        pixIncludedXY = vertcat(pixIncludedX2(in),pixIncludedY2(in));



%         plot(x_ROI, y_ROI)
%         plot(pixIncludedX2, pixIncludedY2)
%         plot(pixIncludedX2(in), pixIncludedY2(in))

        % Get the F of each pixel of each ROI for each frame to which the ROI applies
        trial = DataROI(plane).pixZ(i);
        t_frames = trialGuide(trial,2):trialGuide(trial,3);
        temp_F = [];

        for j = 1: size(pixIncludedXY,2) % Number of pixels in the ROI
            temp_F(:,j) = video(pixIncludedXY(1,j),pixIncludedXY(2,j), t_frames);
        end
        %find the mean fluorescence for each frame for the ROI
        % Find Zscore and deltaF0/F0
        odor_time = params.Data_1.parameter.preO;
        odor_dur = params.Data_1.parameter.dur;
        pre_odor_frames = (t_frames + (fps * odor_time - odor_dur)):(t_frames + (fps * odor_time));
        roi = DataROI(plane).roiID(i);

        
        if contains(F_name(plane).name, 'axon')
            out.axon.F(roi,t_frames) = nanmean(temp_F,2);
            baseline = nanmean(out.axon.F(roi,pre_odor_frames));
            baseline_sd = std(out.axon.F(roi,pre_odor_frames));
            out.axon.Zscore(roi,t_frames) = (out.axon.F(roi,t_frames) - baseline) ./ baseline_sd;
            out.axon.dff(roi,t_frames) = (out.axon.F(roi,t_frames)-baseline) ./ baseline;
        else 
  
            out.F(roi,t_frames) = nanmean(temp_F,2);
            baseline = nanmean(out.F(roi,pre_odor_frames));
            baseline_sd = std(out.F(roi,pre_odor_frames));
            out.Zscore(roi,t_frames) = (out.F(roi,t_frames) - baseline) ./ baseline_sd;
            out.dff(roi,t_frames) = (out.F(roi,t_frames)-baseline) ./ baseline;
        end
        
    end
    fprintf('complete.\n');
end

out.F(out.F == 0) = NaN;
out.Zscore(out.F == 0) = NaN;
out.dff(out.F == 0) = NaN;

out.axon.F(out.F == 0) = NaN;
out.axon.Zscore(out.F == 0) = NaN;
out.axon.dff(out.F == 0) = NaN;

end
%% if ROIs are manually drawn for the average across all trials use this code
%find and load fluorescence data
% F_name= dir('*ROIs.mat');
% if size(F_name,1) == 2;
%     F = load(F_name(1,:).name);
%     F.red = load(F_name(2,:).name);
%     out.F_red_norm = F.data.F ./ F.red.data.F;
%     out.F_red = F.red.data.F;
%     % out.Fc = F.data.Fc;
% else 
%     F = load(F_name.name);
%     % out.Fc = F.data.Fc;
% 
% end

% for roi = 1: size(F.data.F,2)
% 
%     figure; hold on
%     subplot(2,1,1)
%     hold on
%     plot(F.data.F(:,roi))
%     plot(F.red.data.F(:,roi))
%     subplot(2,1,2)
%     plot(out.Fc(:,roi))
% end

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

%convert x and y units to lab units (mm)
intxposR = intxpos*radius;
intyposR = intypos*radius;
x_diff = diff(intxposR);
y_diff = diff(intyposR);

%Correct jumps in x and y position due to tracking resets
errors = abs(x_diff) > 3 | abs(y_diff) > 3;
BW = bwlabel(errors);
for err = 1: sum(errors)
    x_err = intxposR(BW == err);
    y_err = intyposR(BW == err);
    
    intxposR(find(BW == err,1)+1:end) = intxposR(find(BW == err,1)+1:end) - x_diff(find(BW == err,1));
    intyposR(find(BW == err,1)+1:end) = intyposR(find(BW == err,1)+1:end) - y_diff(find(BW == err,1));
end

%collect x and y for output
out.intxposR = intxposR;
out.intyposR = intyposR;


stim_frames = [];


% for each trial, find the start, end, length, frames along with frames
% before and after trial, and the frame number for each point
for stim = 1:length(stim_starts)

    odor_delay =0.3; 

    trial_start{stim} = frame(find(frame > frame_starts(stim),1));
    trial_end{stim} = frame(find(frame < frame_ends(stim),1,'last'));
    trial_length = trial_end{stim}-trial_start{stim};
    trial_frames{stim} = trial_start{stim} - (params.Data_1.parameter.preO * fps):trial_end{stim} + ((params.Data_1.parameter.dur - (params.Data_1.parameter.preO + params.Data_1.parameter.odorD)) * fps);
    stim_frames = [stim_frames, trial_start{stim}:trial_end{stim}];
    trial_x{stim} = trial_frames{stim} - trial_start{stim};
end




%collect variables for output and convert to the correct units

out.trial_x = trial_x;
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
out.Data_1 = params.Data_1;

if exist("odor_id", 'var')
    out.odor_id = odor_id;
else
    for i=1: length(stim_starts)
        out.odor_id(i) = "odor1";
    end
end
out.net_move = sqrt(out.drotvly.^2 + out.drotvlx.^2 + out.drotvlz.^2)


% change the wd back to the main folder
save("extracted_data", "out")
cd(main_folder);

end
