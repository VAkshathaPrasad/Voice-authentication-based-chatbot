% Project title : Intelligent Chat Bot for Lab Security and Automation
% Author : V Akshatha Prasad

%% Start of execution from this file.
% Run this file after changing the Matlab current path

%% Main Function Voice Recognition
function []=voicerecognition()
clc;
ronaldo=9;
char st; char st1;

% Checking train database
if (exist('train_database.dat','file')==2)
    load('train_database.dat','-mat');
    str = {train_sound_number}; fstr = {train_sound_number};
    code = {train_sound_number};
    data = {train_sound_number,3};
end

% Checking test database
if (exist('test_database.dat','file')==2)
    load('test_database.dat','-mat');
    ste = {test_sound_number}; fste = {test_sound_number};
    code1 = {test_sound_number};
    data1 = {test_sound_number,4};
end

%%
% For making choice for the LAB-BOT
% Press "Database Signals" to view the signals present in the database
% Press "Plot of the signal" to plot any of the signal stored in database
% Press "Recognition rate calculation" to calculate the recognition rate of
% the system
% Press "Database files" to add, delete or test the speaker authentication
% Press "Exit" to exit from the system
%%

ch=0;
poss=5;
while ch~=poss
    ch=menu('LAB-BOT : For Security and Automation','1: Database Signals',...
        '2: Plot of the signal',...
        '3: Recognition rate calculation',...
        '4: Database files','5: Exit');
    disp('                                                                  ');
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Option 1 start loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    %%%%%%%%%%% Specifies and plays the audio signals present in the database %%%%%%%%%%%%%%%
    if ch==1
        disp('Database Signals present are:');
        ch2=0;
        while ch2~=3
            ch2=menu('Select Folder','Trained User','Tested User','Exit');
            %%%%%%%%% Train Database %%%%%%%%%%
            if ch2==1  
                if (exist('train_database.dat','file')==2)
                    load('train_database.dat','-mat');
                    ch12=0;
                    while ch12 ~=2
                        ch12=menu('Database Information','Database','Exit');
                        if ch12==1
                            st=strcat('Sound Database has : #',num2str(train_sound_number),'words. Enter a database number : #');
                            prompt = {st};
                            dlg_title = 'Database Information';
                            num_lines = 1;
                            def = {'1'};
                            options.Resize='on';
                            options.WindowStyle='normal';
                            options.Interpreter='tex';
                            an = inputdlg(prompt,dlg_title,num_lines,def);
                            an=cell2mat(an);
                            a = str2double(an);
                            if (isempty(an))
                            else
                                if (a <= train_sound_number)
                                    path=strcat(pwd,'\user\train\u',num2str(a),'.wav');
                                    [s fs]=audioread(path);
                                    p=audioplayer(s,fs);
                                    play(p);
                                else
                                    warndlg('Invalid Word ','Warning');
                                end
                            end
                        end
                    end     
                else
                    warndlg('Database is empty.',' Warning ')
                end
                
            %%%%%%%%% Test Database %%%%%%%%%%
            elseif ch2==2
                if (exist('test_database.dat','file')==2)
                    load('test_database.dat','-mat');
                    ch12=0;
                    while ch12 ~=2
                        ch12=menu('Database Information','Database','Exit');
                        if ch12==1
                            st=strcat('Sound Database has : #',num2str(test_sound_number),'words. Enter a database number : #');
                            prompt = {st};
                            dlg_title = 'Database Information';
                            num_lines = 1;
                            def = {'1'};
                            options.Resize='on';
                            options.WindowStyle='normal';
                            options.Interpreter='tex';
                            an = inputdlg(prompt,dlg_title,num_lines,def);
                            an=cell2mat(an);
                            a = str2double(an);
                            if (isempty(an))
                            else
                                if (a <= test_sound_number)
                                    path=strcat(pwd,'\user\test\u',num2str(a),'.wav');
                                    [s fs]=audioread(path);
                                    p=audioplayer(s,fs);
                                    play(p);
                                else
                                    warndlg('Invalid Word ','Warning');
                                end
                            end
                        end
                    end
                else
                    warndlg('Database is empty.',' Warning ')
                end
            end
        end
    end
   %%%%%%%%%%%%%%%%%%%%%%%%%%% Option 1 end loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------------------------------------------------------------------%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Option 2 start loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% Plots the audio signals present in the database %%%%%%%%%%%%%%%
    if ch==2
        disp('> 2: Plot of the signals present in the database');
        ch23=0;
        while ch23~=3
            ch23=menu('Select Folder','Trained User','Tested User','Exit');
            %%%%%%%%% Train Database %%%%%%%%%%
            if ch23==1
                if (exist('train_database.dat','file')==2)
                    load('train_database.dat','-mat');
                    
                    ch32=0;
                    while ch32 ~=2
                        ch32=menu('Database Information','Database','Exit');
                        if ch32==1
                            st=strcat('Sound Database has : #',num2str(train_sound_number),'words. Enter a database number : #');
                            prompt = {st};
                            dlg_title = 'Database Information';
                            num_lines = 1;
                            def = {'1'};
                            options.Resize='on';
                            options.WindowStyle='normal';
                            options.Interpreter='tex';
                            an = inputdlg(prompt,dlg_title,num_lines,def);
                            an=cell2mat(an);
                            a = str2double(an);
                            if (isempty(an))
                            else
                                if (a <= train_sound_number)
                                    path=strcat(pwd,'\user\train\u',num2str(a),'.wav');
                                    [s fs]=audioread(path);
                                    t = 0:1/fs:(length(s) - 1)/fs;
                                    plot(t, s), axis([0, (length(s) - 1)/fs -0.4 0.5]);
                                    st=sprintf("Plot of %s's audio signal",data{a,3});
                                    title(st);
                                    xlabel('Time [s]');
                                    ylabel('Amplitude (normalized)')
                                else
                                    warndlg('Invalid Word ','Warning');
                                end
                            end
                        end
                    end
                else
                    warndlg('Database is empty.',' Warning ')
                end
            %%%%%%%%% Test Database %%%%%%%%%%
            elseif ch23==2
                if (exist('test_database.dat','file')==2)
                    load('test_database.dat','-mat');
                    ch32=0;
                    while ch32 ~=2
                        ch32=menu('Database Information','Database','Exit');
                        if ch32==1
                            st=strcat('Sound Database has : #',num2str(test_sound_number),'words. Enter a database number : #');
                            prompt = {st};
                            dlg_title = 'Database Information';
                            num_lines = 1;
                            def = {'1'};
                            options.Resize='on';
                            options.WindowStyle='normal';
                            options.Interpreter='tex';
                            an = inputdlg(prompt,dlg_title,num_lines,def);
                            an=cell2mat(an);
                            a = str2double(an);
                            if (isempty(an))
                            else
                                if (a <= test_sound_number)
                                    %st=strcat('u',num2str(an));
                                    path=strcat(pwd,'\user\test\u',num2str(a),'.wav');
                                    [s fs]=audioread(path);
                                    t = 0:1/fs:(length(s) - 1)/fs;
                                    plot(t, s), axis([0, (length(s) - 1)/fs -0.4 0.5]);
                                    st=sprintf("Plot of %s's audio signal",data1{a,4});
                                    title(st);
                                    xlabel('Time [s]');
                                    ylabel('Amplitude (normalized)')
                                else
                                    warndlg('Invalid Word ','Warning');
                                end
                            end
                        end
                    end   
                else
                    warndlg('Database is empty.',' Warning ')
                end
            end
        end
    end
  %%%%%%%%%%%%%%%%%%%%%%%%%%% Option 2 end loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------------------------------------------------------------------%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Option 3 start loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% Recognition rate calculation %%%%%%%%%%%%%%%
if ch==3
    flag1=0;
    % Read audio data from test folder for performing operations
    if (exist('test_database.dat','file')==2)
        load('test_database.dat','-mat');
    % Read audio data from train folder for performing operations
    if (exist('train_database.dat','file')==2)
        load('train_database.dat','-mat');
        % Calculate Recognition rate only when train and test database
        % count is same
        if (train_sound_number==test_sound_number)
            for i = 1: test_sound_number
                data1{i,1} = double( data1{i,1} );
            end
            Fs = 22050;
            for ii=1:test_sound_number
                k=16;
                % Compute MFCC cofficients for each sound present in database
                v = mfcc(data1{ii,1}, Fs);
                % Train VQ codebook
                code{ii} = vqlbg(v, k);
            end
            for classe = 1:test_sound_number
                data{classe} = double(data{classe});
                %----- code for speaker recognition -------
                disp('MFCC cofficients computation and VQ codebook training in progress...');
                % Number of centroids required
                disp(' ');
                % Compute MFCC coefficients for input sound
                v = mfcc(data{classe},Fs);
                % Current distance and sound ID initialization
                distmin = Inf;
                k1 = 0;
                for ii=1:test_sound_number
                    d = disteu(v, code{ii});
                    dist = sum(min(d,[],2)) / size(d,1);
                    if dist < distmin
                        distmin = dist
                        k1 = ii;
                    end
                end
                min_index = k1;
                speech_id = data{min_index,2};
                disp('Completed.');
                disp('Matching sound:');
                message = strcat('Recognized speaker ID: ',num2str(speech_id));
                disp(message);
                disp(' ');
                fprintf("flag=%d",data1{classe,3})
                if(data1{classe,3}==1)
                    flag1 = flag1 + 1;
                    fprintf("flag1=%d\n",flag1)
                end
            end
            disp('                                                             ');
            pause(0.5)
            st1 = strcat('This prototype is ', num2str(100*flag1/classe),'% efficient in recognising different stored sounds in TEST and TRAIN folders.');
            msgbox(st1,'Success','help');
        else
            disp('Train database and test database are not equal');
        end
    end
    end
end


 %%%%%%%%%%%%%%%%%%%%%%%%%%% Option 3 end loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------------------------------------------------------------------%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Option 4 start loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% Operations with database signals  %%%%%%%%%%%%%%%

if ch==4
    disp('> 4: Test with the speech files')
    chos=0;
    possibility=5;
    while chos~=possibility  
    % For making choice for the operations on the database
    % Press "Add a new sound from microphone" to add the signals to the
    % database %%%% Train Signals 
    % Press "Speaker recognition from microphone" to authenticate the
    % speaker %%%% Test Signals
    % Press "Database Info" to get the information like how many train and
    % test signals are present in the database 
    % Press "Delete database" to delete train or test signals from the
    % database
    % Press "Exit" to exit from the Speaker Recognition system Menu options
%%    
        chos=menu('Speaker Recognition System','Add a new sound from microphone',...
            'Speaker recognition from microphone',...
            'Database Info','Delete database','Exit');
%% 
 %%%%%%%%%%%%%%%%%%%%%%%%%%% Add new signals to the database Start loop %%%%%%%%%%%%%%%%%%%%%%%%%%
        if chos==1
            if (exist('train_database.dat','file')==2)
                load('train_database.dat','-mat');
                prompt = 'Enter your name ';
                name = input(prompt,'s');
                disp(name)
                classe = input('Insert a class number (sound ID) that will be used for recognition:');
                if isempty(classe)
                    classe = train_sound_number+1;
                    disp( num2str(classe) );
                end
                message=('The following parameters will be used during recording:');
                disp(message);
                message=strcat('Sampling frequency',num2str(samplingfrequency));
                disp(message);
                message=strcat('Bits per sample',num2str(samplingbits));
                disp(message);
                durata = input('Insert the duration of the recording (in seconds):');
                if isempty(durata)
                    durata = 3;
                    disp( num2str(durata) );
                end
                micrecorder = audiorecorder(samplingfrequency,samplingbits,1);
                disp('Now, speak into microphone...');
                record(micrecorder,durata);
                
                while (isrecording(micrecorder)==1)
                    disp('Recording...');
                    pause(0.5);
                end
                disp('Recording stopped.');
                y1 = getaudiodata(micrecorder);
                y = getaudiodata(micrecorder, 'uint8');
                
                if size(y,2)==2
                    y=y(:,1);
                end
                y = double(y);
 %%%%%%%%%%%% Storage of collected train data into the database %%%%%%%%%
                train_sound_number = train_sound_number+1;
                code = {train_sound_number};
                data{train_sound_number,1} = y;
                data{train_sound_number,2} = classe;
                data{train_sound_number,3} = name;
                path=strcat(pwd,'\user\train\u',num2str(train_sound_number),'.wav');
                audiowrite(path,y1,samplingfrequency,'BitsPerSample',8);
                soundsc(y1,samplingfrequency);
                save('train_database.dat','data','train_sound_number','-append');
                msgbox('Sound added to database','Database result','help');
                disp('Sound added to database');
            else
                prompt = 'Enter your name ';
                name = input(prompt,'s');
                disp(name)
                classe = input('Insert a class number (sound ID) that will be used for recognition:');
                if isempty(classe)
                    classe = 1;
                    disp( num2str(classe) );
                end
                durata = input('Insert the duration of the recording (in seconds):');
                if isempty(durata)
                    durata = 3;
                    disp( num2str(durata) );
                end
                samplingfrequency = input('Insert the sampling frequency (22050 recommended):');
                if isempty(samplingfrequency )
                    samplingfrequency = 22050;
                    disp( num2str(samplingfrequency) );
                end
                samplingbits = input('Insert the number of bits per sample (8 recommended):');
                if isempty(samplingbits )
                    samplingbits = 8;
                    disp( num2str(samplingbits) );
                end
                micrecorder = audiorecorder(samplingfrequency,samplingbits,1);
                disp('Now, speak into microphone...');
                record(micrecorder,durata);
                
                while (isrecording(micrecorder)==1)
                    disp('Recording...');
                    pause(0.5);
                end
                disp('Recording stopped.');
                y1 = getaudiodata(micrecorder);
                y = getaudiodata(micrecorder, 'uint8');
                
                if size(y,2)==2
                    y=y(:,1);
                end
                y = double(y);
                train_sound_number = 1;
                data{train_sound_number,1} = y;
                data{train_sound_number,2} = classe;
                data{train_sound_number,3} = name;
                path=strcat(pwd,'\user\train\u',num2str(train_sound_number),'.wav');
                audiowrite(path,y1,samplingfrequency,'BitsPerSample',8);
                soundsc(y1,samplingfrequency);
                save('train_database.dat','data','train_sound_number','samplingfrequency','samplingbits');
                msgbox('Sound added to database','Database result','help');
                disp('Sound added to database');
            end
        end
        
%%%%%%%%%%%%%%%%%%%%%%%%%%% Add new signals to the database End loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------------------------------------------------------------------%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Voice Recognition from microphone Start loop %%%%%%%%%%%%%%%%%%%%%%%%
        if chos==2
            if (exist('train_database.dat','file')==2)
                load('train_database.dat','-mat');
                if (exist('test_database.dat','file')==2)
                    load('test_database.dat','-mat');
                    classe1 = input('Insert a class number (sound ID) that will be used for recognition:');
                    if isempty(classe1)
                        classe1 = test_sound_number+1;
                        disp( num2str(classe1) );
                    end
                    message=('The following parameters will be used during recording:');
                    disp(message);
                    message=strcat('Sampling frequency',num2str(samplingfrequency));
                    disp(message);
                    message=strcat('Bits per sample',num2str(samplingbits));
                    disp(message);
                    durata = input('Insert the duration of the recording (in seconds):');
                    if isempty(durata)
                        durata = 3;
                        disp( num2str(durata) );
                    end
                    micrecorder = audiorecorder(samplingfrequency,samplingbits,1);
                    disp('Now, speak into microphone...');
                    record(micrecorder,durata);
                    
                    while (isrecording(micrecorder)==1)
                        disp('Recording...');
                        pause(0.5);
                    end
                    disp('Recording stopped.');
                    y1 = getaudiodata(micrecorder);
                    y = getaudiodata(micrecorder, 'uint8');
                    % if the input sound is not mono
                    
                    if size(y,2)==2
                        y=y(:,1);
                    end
                    y = double(y);
                    test_sound_number = test_sound_number+1;
                    code1 = {test_sound_number};
                    data1{test_sound_number,1} = y;
                    data1{test_sound_number,2} = classe1;
                    path=strcat(pwd,'\user\test\u',num2str(test_sound_number),'.wav');
                    audiowrite(path,y1,samplingfrequency,'BitsPerSample',8);
                    soundsc(y1,samplingfrequency);
              
                    k =16;
                    Fs = samplingfrequency;
                    for ii=1:train_sound_number
                        % Compute MFCC cofficients for each sound present in database
                        v = mfcc(data{ii,1}, Fs);
                        % Train VQ codebook
                        code{ii} = vqlbg(v, k);
                        disp('...');
                    end
                    disp('Completed.');
                    % Compute MFCC coefficients for input sound
                    flag1 = 0;
                    v = mfcc(y,Fs);
                    % Current distance and sound ID initialization
                    distmin = Inf;
                    k1 = 0;
                    
                    for ii=1:train_sound_number
                        d = disteu(v, code{ii});
                        dist = sum(min(d,[],2)) / size(d,1);
                        message=strcat('For User #',num2str(ii),' Dist : ',num2str(dist));
                        disp(message);
                        
                        if dist < distmin
                            distmin = dist;
                            k1 = ii;
                        end
                    end
                    fprintf("distmin=%d",distmin)
                    if ((distmin < ronaldo)&&(distmin>1))
                        min_index = k1
                        flag1=flag1+1;
                        speech_id = data{min_index,2};
                        message = strcat('Recognized speaker ID: ',num2str(speech_id));
                        disp(message);
                        message = strcat ('Recognized Student is : ',data{speech_id,3});
                        disp(message);
                        data1{speech_id,4}=data{speech_id,3};
                        msgbox(message,'Matching result','help');
                        flag=1;
                        data1{test_sound_number,3} = flag;
                        pause(1.5);
                        automate(data{speech_id,3});                        
                        ch3=0;
                        while ch3~=3
                            ch3=menu('Matched result verification:','Recognized Sound','Recorded sound','Exit');
                            if ch3==1
                                path=strcat(pwd,'\user\train\u',num2str(speech_id),'.wav');
                                [s fs]=audioread(path);
                                p=audioplayer(s,fs);
                                play(p);
                            end
                            if ch3==2
                                path=strcat(pwd,'\user\test\u',num2str(test_sound_number),'.wav');
                                [s fs]=audioread(path);
                                p=audioplayer(s,fs);
                                play(p);
                            end
                        end
                    else
                        flag=0;
                        data1{test_sound_number,3} = flag;
                        fprintf('\nNo Matching user found\n')
                        warndlg('Wrong User . No matching Result.',' Warning ')
                    end
                    save('test_database.dat','data1','test_sound_number','-append');
                    msgbox('Sound added to database','Database result','help');
                    disp('Sound added to database');                     
                else
                    classe1 = input('Insert a class number (sound ID) that will be used for recognition:');
                    if isempty(classe1)
                        classe1 = 1;
                        disp( num2str(classe1) );
                    end
                    durata = input('Insert the duration of the recording (in seconds):');
                    if isempty(durata)
                        durata = 3;
                        disp( num2str(durata) );
                    end
                    samplingfrequency = input('Insert the sampling frequency (22050 recommended):');
                    if isempty(samplingfrequency )
                        samplingfrequency = 22050;
                        disp( num2str(samplingfrequency) );
                    end
                    samplingbits = input('Insert the number of bits per sample (8 recommended):');
                    if isempty(samplingbits )
                        samplingbits = 8;
                        disp( num2str(samplingbits) );
                    end
                    micrecorder = audiorecorder(samplingfrequency,samplingbits,1);
                    disp('Now, speak into microphone...');
                    record(micrecorder,durata);
                    
                    while (isrecording(micrecorder)==1)
                        disp('Recording...');
                        pause(0.5);
                    end
                    disp('Recording stopped.');
                    y1 = getaudiodata(micrecorder);
                    y = getaudiodata(micrecorder, 'uint8');
                    
                    if size(y,2)==2
                        y=y(:,1);
                    end
                    y = double(y);
                    test_sound_number = 1;
                    data1{test_sound_number,1} = y;
                    data1{test_sound_number,2} = classe1;
                    path=strcat(pwd,'\user\test\u',num2str(test_sound_number),'.wav');
                    audiowrite(path,y1,samplingfrequency,'BitsPerSample',8);
                    soundsc(y1,samplingfrequency);
                    %----- code for speaker recognition -------
                    disp('MFCC cofficients computation and VQ codebook training in progress...');
                    disp(' ');
                    % Number of centroids required
                    k =16;
                    Fs = samplingfrequency;
                    for ii=1:train_sound_number
                        % Compute MFCC cofficients for each sound present in database
                        v = mfcc(data{ii,1}, Fs);
                        % Train VQ codebook
                        code{ii} = vqlbg(v, k);
                        disp('...');
                    end
                    disp('Completed.');
                    % Compute MFCC coefficients for input sound
                    flag1 = 0;
                    v = mfcc(y,Fs);
                    % Current distance and sound ID initialization
                    distmin = Inf;
                    k1 = 0;
                    
                    for ii=1:train_sound_number
                        d = disteu(v, code{ii});
                        dist = sum(min(d,[],2)) / size(d,1);
                        message=strcat('For User #',num2str(ii),' Dist : ',num2str(dist));
                        disp(message);
                        
                        if dist < distmin
                            distmin = dist;
                            k1 = ii;
                        end
                    end
                    
                    if ((distmin < ronaldo)&&(distmin>1))
                        min_index = k1;
                        flag1=flag1+1;
                        %fprintf("min_index=%d",min_index);
                        speech_id = data{min_index,2};
                        %fprintf("speech_id=%d",speech_id);
                        %-----------------------------------------
                        %disp('Matching sound:');
                        message = strcat('Recognized speaker ID: ',num2str(speech_id));
                        disp(message);
                        message = strcat ('Recognized Student is : ',data{speech_id,3});
                        disp(message);
                        data1{speech_id,4}=data{speech_id,3};
                        msgbox(message,'Matching result','help');
                        flag=1;
                        data1{test_sound_number,3} = flag;                       
                        pause(1.5);
                        automate(data{speech_id,3});                         
                        ch3=0;
                        while ch3~=3
                            ch3=menu('Matched result verification:','Recognized Sound','Recorded sound','Exit');
                            
                            if ch3==1
                                path=strcat(pwd,'\user\train\u',num2str(speech_id),'.wav');
                                [s fs]=audioread(path);
                                p=audioplayer(s,fs);
                                play(p);
                            end
                            
                            if ch3==2
                                path=strcat(pwd,'\user\test\u',num2str(test_sound_number),'.wav');
                                [s fs]=audioread(path);
                                p=audioplayer(s,fs);
                                play(p);
                            end
                        end
                    else
                        flag=0;
                        data1{test_sound_number,3} = flag;
                        fprintf('\nNo Matching user found\n')
                        warndlg('Wrong User . No matching Result.',' Warning ')
                    end
                    save('test_database.dat','data1','test_sound_number');
                    msgbox('Sound added to database','Database result','help');
                    disp('Sound added to database'); 
                    %             else
                    %                 warndlg('Database is empty. No matching is possible.',' Warning ')
                end
            end
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%% Voice Recognition from microphone End loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------------------------------------------------------------------%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Database Info Start loop %%%%%%%%%%%%%%%%%%%%%%%%

        
        if chos==3
            ch1=0;
            while ch1~=3
                ch1=menu('Select Folder','Trained Database','Tested Database','Exit');
                if ch1==1
                    if (exist('train_database.dat','file')==2)
                        load('train_database.dat','-mat');
                        message=strcat('Database has #',num2str(train_sound_number),'words:');
                        disp(message);
                        disp(' ');
                        for ii=1:train_sound_number
                            st=strcat('Sound Database has : #\n',num2str(train_sound_number));
                            disp(st);
                            message=strcat('Sound ID:',num2str(data{ii,2}));
                            disp(message);
                        end
                        ch32=0;
                        while ch32 ~=2
                            ch32=menu('Database Information','Database','Exit');
                            if ch32==1
                                st=strcat('Sound Database has : #',num2str(train_sound_number),'words. Enter a database number : #');
                                prompt = {st};
                                dlg_title = 'Database Information';
                                num_lines = 1;
                                def = {'1'};
                                options.Resize='on';
                                options.WindowStyle='normal';
                                options.Interpreter='tex';
                                an = inputdlg(prompt,dlg_title,num_lines,def);
                                an=cell2mat(an);
                                a=str2double(an);
                                if (isempty(an))
                                else 
                                    if (a <= train_sound_number)
                                        %st=strcat('u',num2str(an));
                                        path=strcat(pwd,'\user\train\u',num2str(a),'.wav');
                                        [s fs]=audioread(path);
                                        p=audioplayer(s,fs);
                                        play(p);
                                    else
                                        warndlg('Invalid Word ','Warning');
                                    end
                                end
                            end
                        end
                    else
                        warndlg('Database is empty.',' Warning ')
                    end
                elseif ch1==2
                    if (exist('test_database.dat','file')==2)
                        load('test_database.dat','-mat');
                        message=strcat('Database has #',num2str(test_sound_number),'words:');
                        disp(message);
                        disp(' ');
                        for ii=1:test_sound_number
                            st=strcat('Sound Database has : #\n',num2str(test_sound_number));
                            disp(st);
                            message=strcat('Sound ID:',num2str(data1{ii,2}));
                            disp(message);
                        end
                        
                        ch32=0;
                        while ch32 ~=2
                            ch32=menu('Database Information','Database','Exit');
                            
                            if ch32==1
                                st=strcat('Sound Database has : #',num2str(test_sound_number),'words. Enter a database number : #');
                                prompt = {st};
                                dlg_title = 'Database Information';
                                num_lines = 1;
                                def = {'1'};
                                options.Resize='on';
                                options.WindowStyle='normal';
                                options.Interpreter='tex';
                                an = inputdlg(prompt,dlg_title,num_lines,def);
                                an=cell2mat(an);
                                a=str2double(an);
                                
                                if (isempty(an))
                                    
                                else
                                    
                                    if (a <= test_sound_number)
                                        %st=strcat('u',num2str(an));
                                        path=strcat(pwd,'\user\test\u',num2str(a),'.wav');
                                        [s fs]=audioread(path);
                                        p=audioplayer(s,fs);
                                        play(p);
                                    else
                                        warndlg('Invalid Word ','Warning');
                                    end
                                end
                            end
                        end
                    else
                        warndlg('Database is empty.',' Warning ')
                    end
                end
            end
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%% Database Info End loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------------------------------------------------------------------%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Delete Database Info Start loop %%%%%%%%%%%%%%%%%%%%%%%%
        if chos==4
            ch1=0;
            while ch1~=3
                ch1=menu('Select Folder','Trained Database','Tested Database','Exit');
                if ch1==1
                    if (exist('train_database.dat','file')==2)
                        button = questdlg('Do you really want to remove the Database?');
                        
                        if strcmp(button,'Yes')
                            load('train_database.dat','-mat');
                            
                            for ii=1:train_sound_number
                                %st=strcat('u',num2str(ii),'.wav');
                                path1=strcat(pwd,'\user\train\u',num2str(ii),'.wav');
                                delete(path1);
                            end
                            
                            if (exist('v.wav','file')==2)
                                delete('v.wav');
                            end
                            
                            delete('train_database.dat');
                            msgbox('Database was succesfully removed from the current directory.','Database removed','help');
                        end
                        
                    else
                        warndlg('Database is empty.',' Warning ')
                    end
                elseif ch1==2
                    if (exist('test_database.dat','file')==2)
                        button = questdlg('Do you really want to remove the Database?');
                        
                        if strcmp(button,'Yes')
                            load('test_database.dat','-mat');
                            
                            for ii=1:test_sound_number
                                %st=strcat('u',num2str(ii),'.wav');
                                path=strcat(pwd,'\user\test\u',num2str(ii),'.wav');
                                delete(path);
                            end
                            
                            if (exist('v.wav','file')==2)
                                delete('v.wav');
                            end
                            
                            delete('test_database.dat');
                            msgbox('Database was succesfully removed from the current directory.','Database removed','help');
                        end
                        
                    else
                        warndlg('Database is empty.',' Warning ')
                    end
                end
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%% Delete Database Info End loop %%%%%%%%%%%%%%%%%%%%%%%%
    end
end
 %%%%%%%%%%%%%%%%%%%%%%%%%%% Option 4 end loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
end
 %%%%%%%%%%%%%%%%%%%%%%%%%%% Function voice recognition end loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
