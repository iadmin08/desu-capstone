country=dir('../../data/country/*.wav');%0
rnb=dir('../../data/randb/*.wav');%1
rap=dir('../../data/rap/*.wav');%1
rock=dir('../../data/rock/*.wav');%0
blues=dir('../../data/blues/*.wav');%0
jazz=dir('../../data/jazz/*.wav');%1
classical=dir('../../data/classical/*.wav');%0

Mazumdar_ZCR_country=zeros(1,length(country));
for index=1:1:length(country),
    %disp(country(index).name);
    file=strcat('../../data/country/',country(index).name);
    [countryY, countryFs, countryNbits]=wavread(file);
    Mazumdar_ZCR_country(index)=Mazumdar_ZCR(countryY, countryFs,file);
end

Mazumdar_ZCR_rnb=zeros(1,length(rnb));
for index=1:1:length(rnb),
    %disp(rnb(index).name);
    file=strcat('../../data/randb/',rnb(index).name);
    [rnbY, rnbFs, rnbNbits]=wavread(file);
    Mazumdar_ZCR_rnb(index)=Mazumdar_ZCR(rnbY, rnbFs,file);
end

Mazumdar_ZCR_rap=zeros(1,length(rap));
for index=1:1:length(rap),
    %disp(rap(index).name);
    file=strcat('../../data/rap/',rap(index).name);
    [rapY, rapFs, rapNbits]=wavread(file);
    Mazumdar_ZCR_rap(index)=Mazumdar_ZCR(rapY, rapFs,file);
end

Mazumdar_ZCR_rock=zeros(1,length(rock));
for index=1:1:length(rock),
    %disp(rock(index).name);
    file=strcat('../../data/rock/',rock(index).name);
    [rockY, rockFs, rockNbits]=wavread(file);
    Mazumdar_ZCR_rock(index)=Mazumdar_ZCR(rockY, rockFs,file);
end

Mazumdar_ZCR_blues=zeros(1,length(blues));
for index=1:1:length(blues),
    %disp(blues(index).name);
    file=strcat('../../data/blues/',blues(index).name);
    [bluesY, bluesFs, bluesNbits]=wavread(file);
    Mazumdar_ZCR_blues(index)=Mazumdar_ZCR(bluesY, bluesFs,file);
end

Mazumdar_ZCR_jazz=zeros(1,length(jazz));
for index=1:1:length(jazz),
    %disp(jazz(index).name);
    file=strcat('../../data/jazz/',jazz(index).name);
    [jazzY, jazzFs, jazzNbits]=wavread(file);
    Mazumdar_ZCR_jazz(index)=Mazumdar_ZCR(jazzY, jazzFs,file);
end

Mazumdar_ZCR_classical=zeros(1,length(classical));
for index=1:1:length(classical),
    %disp(classical(index).name);
    file=strcat('../../data/classical/',classical(index).name);
    [classicalY, classicalFs, classicalNbits]=wavread(file);
    Mazumdar_ZCR_classical(index)=Mazumdar_ZCR(classicalY, classicalFs,file);
end