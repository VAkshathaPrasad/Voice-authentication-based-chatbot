# Voice-authentication-based-chatbot
Towards creating a voice authenticated chatbot <br />

## Problem Statement:
To develop a voice verified chat bot which first validates the user to avoid potential risks and then performs the activity by following user's voice commands.

## Approach: <br />
Techniques used to develop such a system is:
```
1. MFCC
2. Google Cloud's Speech to text API
```

## System Working: <br />
The system working can be easily understood with the flow diagram:
<p align="center">
  <img src="https://i.imgur.com/RMuH8Jr.png" />
</p>

## Pre-requisities: <br />
1. MATLAB release R2017a or above
2. Google cloud account to use Cloud's Speech to text API
3. Download [speech2text](https://in.mathworks.com/matlabcentral/fileexchange/65266-speech2text/) Zip file from the link and unzip into the Matlab prject folder (optional).

## Steps to run: <br />
1. Download the Zip folder of the project (which also consists of setup.m file from [speech2text](https://in.mathworks.com/matlabcentral/fileexchange/65266-speech2text/)).
2. Unzip the folder into the Matlab path.
3. First run the setup.m script from the unzipped folder. This makes sure the downloaded files are added to your MATLAB path and the Speech to Text automation algorithm is installed in Audio Labeler app if you are running MATLAB R2019b.
4. Next, create a Google cloud account with the cloud service and generate an authorization key (follow the steps in Google Cloud Speech-to-Text section).
5. After completing steps mentioned in the Google Cloud Speech-to-Text section, Go to voicerecognition.m file and run the file.

## Google Cloud Speech-to-Text: <br />
Using the Google Cloud Speech-to-Text API requires an API key for authorizing the request. The following steps describe how to create the API key:
- Navigate to the APIs & Services->Credentials panel in Cloud Platform Console.
- Select Create credentials, then select API key from the drop-down menu.
[![INSERT YOUR GRAPHIC HERE](https://i.imgur.com/K90TVio.png)]()
- Click the Create button. A dialog box appears which displays your newly created key.
- Once you have the API key, download it and create a JSON file. JSON file should have an attribute called: "key" (case sensitive). For example, if the API key generated is ABCDefgh, then the file will have the attribute "key", and value "ABCDefgh", as shown below:
```
      "key" : "ABCDefgh"
```
- Save the file as "Google_Credentials_Speech2text.json" to a secure location (preferably in the project folder). The speech2text function will look for "Google_Credentials_Speech2text.json" to obtain the API key, which the Google Speech API requires for authentication.


## Output obtained: <br />
<div align="center">
<img width="400" height="150" src="https://i.imgur.com/B0cbYqD.png" >
<p> Adding students voice to trained folder </p>
</div>

<div align="center">
<img width="400" height="150" src="https://i.imgur.com/mDCmvcV.png" >
<p> Calculation of distances and matching student's voice </p>
</div>

<div align="center">
<img width="400" height="150" src="https://i.imgur.com/lPAsULd.png" >
<p> Wrong user Result </p>
</div>

<div align="center">
<img width="400" height="150" src="https://i.imgur.com/CGO6YEg.png" >
<p> Google’s Speech to Text transcript </p>
</div>

<div align="center">
<img width="400" height="150" src="https://i.imgur.com/67w8URA.png" >
<p> Recognition Rate for testing 8 speakers </p>
</div>
