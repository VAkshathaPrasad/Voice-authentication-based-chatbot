function A=automate(name)
%%% GUI for lab automation %%%
defaultString = "Welcome" + name + "to the lab, I am your Lab Bot. What can I do for you?";
caUserInput=defaultString;
if isempty(caUserInput)
  return;
end % Bail out if they clicked Cancel.
caUserInput = char(caUserInput); % Convert from cell to string.
NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;
Speak(obj, caUserInput);
pause(0.5);
    samplingfrequency = 22050;
    samplingbits = 8;
    durata = 3;
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
    soundsc(y1,samplingfrequency);
    speechObject = speechClient('Google','languageCode','en-US');
    tableOut = speech2text(speechObject,y1,samplingfrequency)
msgbox('Thank you for using me');
end