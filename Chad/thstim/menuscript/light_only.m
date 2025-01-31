%% Generating LED/Shutter stim input
% if parameter.ao_sr~=parameter.ai_sr
%     warndlg('Analog input-output sampling rate must be the same!')
%     return
% end
% 
% 
% if isfield(parameter,'SL_Delay_pre')
%     Shutter_LED_Delay(1)=parameter.SL_Delay_pre;
% else
%     Shutter_LED_Delay(1)=15;
% end
% if isfield(parameter,'SL_Delay_post')
%     Shutter_LED_Delay(2)=parameter.SL_Delay_post;
% else
%     Shutter_LED_Delay(2)=15;
% end
% Shutter_LED_Delay is
% [delay from shutter onset to LED onset, Delay from LED offset to shutter
% offset] in ms
%
% Currently (8/11/2017), it seems to be safe if we allow 15ms before and
% after LED onset/offset for shutter command. 12ms/12ms seems to be also
% acceptable, but we occasionally see LED light in the frame. We also see
% vibration after opening of the shutter. It lasts roughly 180-200ms.

nonstim=zeros(1,parameter.dur*parameter.ao_sr);

if (parameter.stimN==0)||(parameter.stimD==0) %%We don't need stim in these cases.
    ...
else
  stim=nonstim;
  shutter_com=nonstim;
  putfive=[];
  putfive_shutter=[];
  for i=1:parameter.stimN;
      putfive(parameter.ao_sr*parameter.stimD/1000*(i-1)+1:parameter.ao_sr*parameter.stimD/1000*i)=...
            ((parameter.preS+parameter.isi*(i-1))*parameter.ao_sr)+1:...
            ((parameter.preS+parameter.isi*(i-1))*parameter.ao_sr+parameter.ao_sr*parameter.stimD/1000-1)+1;
%       
%      putfive_shutter(parameter.ao_sr*(parameter.stimD+sum(Shutter_LED_Delay))/1000*(i-1)+1:...
%          parameter.ao_sr*(parameter.stimD+sum(Shutter_LED_Delay))/1000*i)=...
%             ((parameter.preS+parameter.isi*(i-1)-Shutter_LED_Delay(1)/1000)*parameter.ao_sr):...
%             ((parameter.preS+parameter.isi*(i-1))*parameter.ao_sr+parameter.ao_sr*(parameter.stimD+Shutter_LED_Delay(2))/1000-1);
  end
 stim(round(putfive))=min([5*parameter.stimI/1000,5]);
 %Assuming max current of LED controler is set to 1000mA, which is max
 %current of the current LED.
%  shutter_com(round(putfive_shutter))=5;
 
 stim=stim';%%Used with odor paired with stim
%  shutter_com=shutter_com';
end
 
 nonstim=nonstim';%%Used with odor NOT paired with stim

 %% connect to fictrac 
 PORT = 7070;
u = udpport("byte", "IPV4", "LocalHost","127.0.0.1","LocalPort", PORT, "EnablePortSharing",true);


%% Generating odor stim
% if get(randomodorh,'value') &&  size(odortable,1)>2 %Randomize odor
%     
%     rep=[];
%     for i=1:parameter.numt;
%         rep=[rep,randperm(size(odortable,1))];
%         if i>1 && rep(end-size(odortable,1))==rep(end-size(odortable,1)+1)%To prevent present same odor successively
%             rep(end-size(odortable,1)+1:end-size(odortable,1)+2)=[rep(end-size(odortable,1)+2),rep(end-size(odortable,1)+1)];
%         end
%     end
% else    %Not randomize odor
%     rep=repmat(1:size(odortable,1),1,parameter.numt);
% end
% odorstim=odortable(rep',:);
%%'i'th row corresponds to 'i'th sweep


%% Recording loop
for i=1:parameter.numt;  
    %% Setup odor stim
%     thisValve=odorstim{i,1};
    thisOdor='ACV';
    thisStim = 1;
%     thisFirstD=odorstim{i,4};
%     thisSecondD=odorstim{i,5};
%     thisTotalD=odorstim{i,6};
    set(nextodorh,'string',thisOdor)
    set(nextodorh,'ForegroundColor','r')
    
    %% Hardware setup
    s=daq.createSession('ni');
    warning off
    ThisChName = {s.Channels.Name}';% Must be called before adding ao channels
    addDigitalChannel(s,NIdaq.dev, 'port0/line0', 'OutputOnly'); %add odor valve port
%     SS=MakeDefaultAISession(NIdaq.dev,aichannels);
    SS=daq.createSession('ni');

%     ThisChName={SS.Channels.Name}';% Must be called before adding ao channels
    SS.addAnalogOutputChannel(NIdaq.dev,Sout,'voltage');
    % Sout is set in thstim.m.
    % Current setting is:
    %   ao0: LED command
    SS.Rate=parameter.ai_sr;
    if thisStim
        queueOutputData(SS,[stim]);
    else
        queueOutputData(SS,[nonstim]);
    end
    fid=fopen('DataLog.bin','w+');%temporary file to log data
    SS.NotifyWhenDataAvailableExceeds=parameter.dur*parameter.ai_sr;
    SS.addlistener('DataAvailable',...
        @(~,event) fwrite(fid,[event.TimeStamps,event.Data],'single'));

    %% Change the status indicator
    set(statush, 'String','Running',...
        'back','r','Fontsize',0.225)
    set(roundh,'string',{' ',sprintf('Sweep : %d/%d',i,parameter.numt)})
    %% Wait until the right timing 
%     if i>2 && FillTime>=parameter.preO
%         pause(FillTime-parameter.preO-toc(injectic))
%     elseif i>2 && FillTime<parameter.preO
%         initialiseFlows_SS(AC,thisFirstD,thisSecondD);
%         pause(parameter.iti-toc)
%     elseif i==1 && FillTime>=parameter.preO
%         initialiseFlows_SS(AC,thisFirstD,thisSecondD);
%             outputSingleScan(s,[0,1]); %turn on LED 
%         pause(FillTime-parameter.preO)
%     else
%         initialiseFlows_SS(AC,thisFirstD,thisSecondD);
%     end
    %% Start acquisition & valve flipping
    tic
    datatime=now;
    startBackground(SS);

    toc
    if (u.NumBytesAvailable > 0)
        data = read(u, u.NumBytesAvailable, "string");
        split = splitlines(data);
        line = split{end-1};
        toks = strsplit(line, ',');
        
        if ((length(toks) < 24) | (toks(1) ~= "FT"))
            print("Bad read")
        else
            odor.light_on(i) = str2num(toks{2})
        end
    end
    toc
    pause(FillTime) %fill time set in thstim
%     StartScanImage_SS
    
    wait(SS,parameter.dur)
%     StopScanImage_SS
    %% Retrieve, save, visualize the data
%     set(statush, 'String','Saving',...
%         'back','b','Fontsize',0.3)
%     pause(0.001)
%     frewind(fid);
% %     data=single(fread(fid,[SS.ScansAcquired,inf],'single'));
%     fclose(fid);
%     
%     savedata
%     indexnum=indexnum+1;
    %% Wait until next trial, allowing Stop or Pause
%    set(statush, 'String',{'Waiting for' 'trigger'},...
%         'back','y','Fontsize',0.175)
%     if i<size(odorstim,1)
%         set(nextodorh,'string',sprintf('NEXT::%s',odorstim{i+1,2}))
%         set(roundh,'string',{'Next',sprintf('Round : %d/%d',ceil((i+1)/size(odortable,1)),parameter.numt),...
%             sprintf('Sweep : %d/%d',i+1-(ceil((i+1)/size(odortable,1))-1)*size(odortable,1),size(odortable,1))})
%     else
%         break
%     end
%     
%     set(nextodorh,'ForegroundColor','k')
%     if FillTime>=parameter.preO
%         while toc<parameter.iti-FillTime+parameter.preO
%             pause(0.01)
%             if stopkey
%                 break
%             end 
%             if get(pauseh,'value')==1
%                 set(statush, 'String','Pause',...
%                     'back','m','Fontsize',0.3)
%                 while get(pauseh,'value')==1
%                     pause(0.01)
%                 end
%                 set(statush, 'String',{'Waiting for' 'trigger'},...
%                     'back','y','Fontsize',0.175)
%             end
%         end
%         if stopkey
%             break
%         end
%         initialiseFlows_SS(AC,odorstim{i+1,4},odorstim{i+1,5});
%         injectOdour_SS(odorstim{i+1,1})
%         injectic=tic;
%         while toc(injectic)<(FillTime-parameter.preO-.5)
%             pause(0.01)
%             if stopkey
%                 break
%             end
%             
%             if get(pauseh,'value')==1
%                 set(statush, 'String','Pause',...
%                     'back','m','Fontsize',0.3)
%                 while get(pauseh,'value')==1
%                     pause(0.01)
%                 end
%                 set(statush, 'String',{'Waiting for' 'trigger'},...
%                     'back','y','Fontsize',0.175)
%             end
%         end
%         if stopkey
%             break
%         end
%     else
%         while toc<parameter.iti-.5
%             pause(0.01)
%             if stopkey
%                 break
%             end
%             
%             if get(pauseh,'value')==1
%                 set(statush, 'String','Pause',...
%                     'back','m','Fontsize',0.3)
%                 while get(pauseh,'value')==1
%                     pause(0.01)
%                 end
%                 set(statush, 'String',{'Waiting for' 'trigger'},...
%                     'back','y','Fontsize',0.175)
%             end
%         end
%         if stopkey
%             break
%         end
%     end
%     
   set(statush, 'String',{'Waiting for' 'trigger'},...
    'back','y','Fontsize',0.175)
    set(roundh,'string',{'Next',sprintf('Sweep : %d/%d',i+1,parameter.numt)})
    
    while toc<parameter.iti-0.4
        pause(0.01)
        if stopkey
            break
        end
        
        if get(pauseh,'value')==1
            set(statush, 'String','Pause',...
                'back','m','Fontsize',0.3)
            while get(pauseh,'value')==1
                pause(0.01)
            end
            set(statush, 'String',{'Waiting for' 'trigger'},...
                'back','y','Fontsize',0.175)
        end
    end
    
    if stopkey
        break
    end
    
    
end

save([PathName '\odor_delivery_' char(datetime('now','TimeZone','local','Format', 'MMM_dd_y_HH_mm_ss'))], 'odor')

% shutAllValves_SS
%QuickAOPutSample(NIdaq.dev,{'ao0','ao1'},0)
set(nextodorh,'string','')
set(roundh,'string','')