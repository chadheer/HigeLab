
%% Generating odor stim
if get(randomodorh,'value') &&  size(odortable,1)>2 %Randomize odor
    
    rep=[];
    for i=1:parameter.numt;
        rep=[rep,randperm(size(odortable,1))];
        if i>1 && rep(end-size(odortable,1))==rep(end-size(odortable,1)+1)%To prevent present same odor successively
            rep(end-size(odortable,1)+1:end-size(odortable,1)+2)=[rep(end-size(odortable,1)+2),rep(end-size(odortable,1)+1)];
        end
    end
else    %Not randomize odor
    rep=repmat(1:size(odortable,1),1,parameter.numt);
end
odorstim=odortable(rep',:);
%%'i'th row corresponds to 'i'th sweep


%% Recording loop
for i=1:size(odorstim,1); 
    %% Setup odor stim
    thisValve=odorstim{i,1};
    thisOdor=odorstim{i,2};
    thisStim=odorstim{i,3};
    thisFirstD=odorstim{i,4};
    thisSecondD=odorstim{i,5};
    thisTotalD=odorstim{i,6};
    set(nextodorh,'string',thisOdor)
    set(nextodorh,'ForegroundColor','r')
    
    %% Hardware setup
    SS=MakeDefaultAISession(NIdaq.dev,aichannels);
    ThisChName={SS.Channels.Name}';% Must be called before adding ao channels
    SS.Rate=parameter.ai_sr;    
    SS.DurationInSeconds=parameter.dur;
    fid=fopen('DataLog.bin','w+');%temporary file to log data
    SS.NotifyWhenDataAvailableExceeds=parameter.dur*parameter.ai_sr;
    SS.addlistener('DataAvailable',...
        @(~,event) fwrite(fid,[event.TimeStamps,event.Data],'single'));

    %% Change the status indicator
    
    set(statush, 'String','Running',...
        'back','r','Fontsize',0.225)
    set(roundh,'string',{' ',sprintf('Round : %d/%d',ceil(i/size(odortable,1)),parameter.numt),...
        sprintf('Sweep : %d/%d',i-(ceil(i/size(odortable,1))-1)*size(odortable,1),size(odortable,1))})
    
    %% Wait until the right timing  
    if i>2 && FillTime>=parameter.preO
        pause(FillTime-parameter.preO-toc(injectic))
    elseif i>2 && FillTime<parameter.preO
        initialiseFlows_SS(AC,thisFirstD,thisSecondD);
        pause(parameter.iti-toc)
    elseif i==1 && FillTime>=parameter.preO
        initialiseFlows_SS(AC,thisFirstD,thisSecondD);
        injectOdour_SS(thisValve)
        pause(FillTime-parameter.preO)
    else
        initialiseFlows_SS(AC,thisFirstD,thisSecondD);
    end
    %% Start acquisition & valve flipping
    datatime=now;
    startBackground(SS);
    StartScanImage_SS
    
    tic
    
    if FillTime<parameter.preO
        pause(parameter.preO-FillTime)
        injectOdour_SS(thisValve)
    end
    pause(parameter.preO-toc)
    FlipValve_SS('final',0)
    pause(parameter.preO+parameter.odorD-toc)
    shutAllValves_SS
    wait(SS,parameter.dur+5)
    StopScanImage_SS
    %% Retrieve, save, visualize the data
    set(statush, 'String','Saving',...
        'back','b','Fontsize',0.3)
    pause(0.001)
    frewind(fid);
    data=single(fread(fid,[SS.ScansAcquired,inf],'single'));
    fclose(fid);
    
    savedata
    indexnum=indexnum+1;
    %% Wait until next trial, allowing Stop or Pause
    set(statush, 'String',{'Waiting for' 'trigger'},...
        'back','y','Fontsize',0.175)
    if i<size(odorstim,1)
        set(nextodorh,'string',sprintf('NEXT::%s',odorstim{i+1,2}))
        set(roundh,'string',{'Next',sprintf('Round : %d/%d',ceil((i+1)/size(odortable,1)),parameter.numt),...
            sprintf('Sweep : %d/%d',i+1-(ceil((i+1)/size(odortable,1))-1)*size(odortable,1),size(odortable,1))})
    else
        break
    end
    
    set(nextodorh,'ForegroundColor','k')
    if FillTime>=parameter.preO
        while toc<parameter.iti-FillTime+parameter.preO
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
        initialiseFlows_SS(AC,odorstim{i+1,4},odorstim{i+1,5});
        injectOdour_SS(odorstim{i+1,1})
        injectic=tic;
        while toc(injectic)<(FillTime-parameter.preO-.5)
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
    else
        while toc<parameter.iti-.5
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
    
    
end
shutAllValves_SS
set(nextodorh,'string','')
set(roundh,'string','')