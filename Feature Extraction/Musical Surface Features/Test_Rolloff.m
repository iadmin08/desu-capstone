country=dir('../../../data/country/*.wav');
rnb=dir('../../../data/randb/*.wav');
rap=dir('../../../data/rap/*.wav');
rock=dir('../../../data/rock/*.wav');
blues=dir('../../../data/blues/*.wav');
jazz=dir('../../../data/jazz/*.wav');
classical=dir('../../../data/classical/*.wav');


Rolloff_country=zeros(1,length(country));
for index=1:1:length(country),
    %disp(country(index).name);
    file=strcat('../../../data/country/',country(index).name);
    [countryY, countryFs, countryNbits]=wavread(file);
    [S,F,T]=spectrogram(countryY(:,1),countryFs/15,0,countryFs/15,countryFs);
    Rolloff_country(index)=Rolloff(S,F,T);
end

Rolloff_rnb=zeros(1,length(rnb));
for index=1:1:length(rnb),
    %disp(rnb(index).name);
    file=strcat('../../../data/randb/',rnb(index).name);
    [rnbY, rnbFs, rnbNbits]=wavread(file);
    [S,F,T]=spectrogram(rnbY(:,1),rnbFs/15,0,rnbFs/15,rnbFs);
    Rolloff_rnb(index)=Rolloff(S,F,T);
end

Rolloff_rap=zeros(1,length(rap));
for index=1:1:length(rap),
    %disp(rap(index).name);
    file=strcat('../../../data/rap/',rap(index).name);
    [rapY, rapFs, rapNbits]=wavread(file);
    [S,F,T]=spectrogram(rapY(:,1),rapFs/15,0,rapFs/15,rapFs);
    Rolloff_rap(index)=Rolloff(S,F,T);
end

Rolloff_rock=zeros(1,length(rock));
for index=1:1:length(rock),
    %disp(rock(index).name);
    file=strcat('../../../data/rock/',rock(index).name);
    [rockY, rockFs, rockNbits]=wavread(file);
    [S,F,T]=spectrogram(rockY(:,1),rockFs/15,0,rockFs/15,rockFs);
    Rolloff_rock(index)=Rolloff(S,F,T);
end

Rolloff_blues=zeros(1,length(blues));
for index=1:1:length(blues),
    %disp(blues(index).name);
    file=strcat('../../../data/blues/',blues(index).name);
    [bluesY, bluesFs, bluesNbits]=wavread(file);
    [S,F,T]=spectrogram(bluesY(:,1),bluesFs/15,0,bluesFs/15,bluesFs);
    Rolloff_blues(index)=Rolloff(S,F,T);
end

Rolloff_jazz=zeros(1,length(jazz));
for index=1:1:length(jazz),
    %disp(jazz(index).name);
    file=strcat('../../../data/jazz/',jazz(index).name);
    [jazzY, jazzFs, jazzNbits]=wavread(file);
    [S,F,T]=spectrogram(jazzY(:,1),jazzFs/15,0,jazzFs/15,jazzFs);
    Rolloff_jazz(index)=Rolloff(S,F,T);
end

Rolloff_classical=zeros(1,length(classical));
for index=1:1:length(classical),
    %disp(classical(index).name);
    file=strcat('../../../data/classical/',classical(index).name);
    [classicalY, classicalFs, classicalNbits]=wavread(file);
    [S,F,T]=spectrogram(classicalY(:,1),classicalFs/15,0,classicalFs/15,classicalFs);
    Rolloff_classical(index)=Rolloff(S,F,T);
end