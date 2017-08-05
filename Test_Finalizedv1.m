%THE FINAL TEST
load('D:\dev\matlab\workspaces\capstone\Finalized Code\Feature Extraction\Musical Surface Features\song_data__centroid.mat')
load('D:\dev\matlab\workspaces\capstone\Finalized Code\Feature Extraction\Musical Surface Features\song_data__flux.mat')
load('D:\dev\matlab\workspaces\capstone\Finalized Code\Feature Extraction\Musical Surface Features\song_data__rolloff.mat')
load('D:\dev\matlab\workspaces\capstone\Finalized Code\Feature Extraction\Musical Surface Features\song_data__zerocrossing.mat')
load('D:\dev\matlab\workspaces\capstone\Finalized Code\Feature Extraction\Musical Surface Features\song_data_mazumdarzcr.mat')
%% 

%First Average all of the data gathered.
%Mean Centroid, Mean Flux, Mean Rolloff, Mean ZeroCrossing, Mean
%MazumdarZCR
mean_blues_centroid = mean(Centroid_blues);
mean_blues_flux = mean(Flux_blues);
mean_blues_rolloff = mean(Rolloff_blues);
mean_blues_zerocrossing = mean(ZeroCrossing_blues);
mode_blues_mazumdarzcr = mode(Mazumdar_ZCR_blues);

mean_jazz_centroid = mean(Centroid_jazz);
mean_jazz_flux = mean(Flux_jazz);
mean_jazz_rolloff = mean(Rolloff_jazz);
mean_jazz_zerocrossing = mean(ZeroCrossing_jazz);
mode_jazz_mazumdarzcr = mode(Mazumdar_ZCR_jazz);

mean_rnb_centroid = mean(Centroid_rnb);
mean_rnb_flux = mean(Flux_rnb);
mean_rnb_rolloff = mean(Rolloff_rnb);
mean_rnb_zerocrossing = mean(ZeroCrossing_rnb);
mode_rnb_mazumdarzcr = mode(Mazumdar_ZCR_rnb);

mean_rap_centroid = mean(Centroid_rap);
mean_rap_flux = mean(Flux_rap);
mean_rap_rolloff = mean(Rolloff_rap);
mean_rap_zerocrossing = mean(ZeroCrossing_rap);
mode_rap_mazumdarzcr = mode(Mazumdar_ZCR_rap);

mean_rock_centroid = mean(Centroid_rock);
mean_rock_flux = mean(Flux_rock);
mean_rock_rolloff = mean(Rolloff_rock);
mean_rock_zerocrossing = mean(ZeroCrossing_rock);
mode_rock_mazumdarzcr = mode(Mazumdar_ZCR_rock);

mean_classical_centroid = mean(Centroid_classical);
mean_classical_flux = mean(Flux_classical);
mean_classical_rolloff = mean(Rolloff_classical);
mean_classical_zerocrossing = mean(ZeroCrossing_classical);
mode_classical_mazumdarzcr = mode(Mazumdar_ZCR_classical);

mean_country_centroid = mean(Centroid_country);
mean_country_flux = mean(Flux_country);
mean_country_rolloff = mean(Rolloff_country);
mean_country_zerocrossing = mean(ZeroCrossing_country);
mode_country_mazumdarzcr = mode(Mazumdar_ZCR_country);

%STANDARD DEVIATION FROM MEAN
std_blues_centroid = std(Centroid_blues);
std_blues_flux = std(Flux_blues);
std_blues_rolloff = std(Rolloff_blues);
std_blues_zerocrossing = std(ZeroCrossing_blues);

std_jazz_centroid = std(Centroid_jazz);
std_jazz_flux = std(Flux_jazz);
std_jazz_rolloff = std(Rolloff_jazz);
std_jazz_zerocrossing = std(ZeroCrossing_jazz);

std_rnb_centroid = std(Centroid_rnb);
std_rnb_flux = std(Flux_rnb);
std_rnb_rolloff = std(Rolloff_rnb);
std_rnb_zerocrossing = std(ZeroCrossing_rnb);

std_rap_centroid = std(Centroid_rap);
std_rap_flux = std(Flux_rap);
std_rap_rolloff = std(Rolloff_rap);
std_rap_zerocrossing = std(ZeroCrossing_rap);

std_rock_centroid = std(Centroid_rock);
std_rock_flux = std(Flux_rock);
std_rock_rolloff = std(Rolloff_rock);
std_rock_zerocrossing = std(ZeroCrossing_rock);

std_classical_centroid = std(Centroid_classical);
std_classical_flux = std(Flux_classical);
std_classical_rolloff = std(Rolloff_classical);
std_classical_zerocrossing = std(ZeroCrossing_classical);

std_country_centroid = std(Centroid_country);
std_country_flux = std(Flux_country);
std_country_rolloff = std(Rolloff_country);
std_country_zerocrossing = std(ZeroCrossing_country);



%% 
%%%%%%
country=dir('../data/country/*.wav');
rnb=dir('../data/randb/*.wav');
rap=dir('../data/rap/*.wav');
rock=dir('../data/rock/*.wav');
blues=dir('../data/blues/*.wav');
jazz=dir('../data/jazz/*.wav');
classical=dir('../data/classical/*.wav');
%%%%%%%
for index=1:1:length(country),
    file=strcat('../data/country/',country(index).name);

%Second, Compare the data to the inputed song
%I want to create a possibility array(sort of like a histogram), that will contain all possible
%genres a song could, and each genre in the array will have a weight 
%associated with it. the genre with the most weight after the comparison 
%will be chosen, if there is a tie then both will be chosen.

%Given some input song "is"
[isy, isfs, isnbits] = wavread(file);%'../data/classical/cls (3)'
%Split the channel
isysize=size(isy);
if isysize(2) > 1
    isy(:,2) = [];%deletes the second column..mono
end
%grab 15 minute interval
%song 661500 elements for a 15 minute song at 44100hz sample rate
%x=1;
%indices_to_keep = x:1:x+661500;%grab next 661500 after x
%isy = isy(indices_to_keep);

addpath('D:\dev\matlab\workspaces\capstone\Finalized Code\Feature Extraction\Musical Surface Features');
addpath('D:\dev\matlab\workspaces\capstone\Finalized Code\Feature Extraction\')

%extract the features from the input song
[S,F,T]=spectrogram(isy,isfs/15,0,isfs/15,isfs);
isCentroid=Centroid(S,F,T);%average centroid
isFlux=Flux(S,F,T);%average flux
isRolloff=Rolloff(S,F,T);%roll off
isZerCrossing=ZeroCrossing(S,F,T);
isMaz_ZCR=Mazumdar_ZCR(isy, isfs, 'song title');%rnb,rap,jazz=1  %country,classical,rock,blues=0

rmpath('D:\dev\matlab\workspaces\capstone\Finalized Code\Feature Extraction\Musical Surface Features');
rmpath('D:\dev\matlab\workspaces\capstone\Finalized Code\Feature Extraction\')

%COMPARE
%'rap'=1,'rnb'=2,'rock'=3,'country'=4,'classical'=5,'jazz'=6,'blues'=7
possible=[1,2,3,4,5,6,7];
if isMaz_ZCR == 1
   %song is rnb,rap or jazz
   %remove others
   possible=possible(find(possible~=3));
   possible=possible(find(possible~=4));
   possible=possible(find(possible~=5));
   possible=possible(find(possible~=7));
else
   %song is country,classical,rock or blues
   possible=possible(find(possible~=1));
   possible=possible(find(possible~=2));
   possible=possible(find(possible~=6));
end

%outside a genres centroid range
if isCentroid < min(Centroid_blues) || isCentroid > max(Centroid_blues)
    possible=possible(find(possible~=7));
end
if isCentroid < min(Centroid_classical) || isCentroid > max(Centroid_classical)
    possible=possible(find(possible~=5));
end
if isCentroid < min(Centroid_country) || isCentroid > max(Centroid_country)
    possible=possible(find(possible~=4));
end
if isCentroid < min(Centroid_jazz) || isCentroid > max(Centroid_jazz)
    possible=possible(find(possible~=6));
end
if isCentroid < min(Centroid_rap) || isCentroid > max(Centroid_rap)
    possible=possible(find(possible~=1));
end
if isCentroid < min(Centroid_rnb) || isCentroid > max(Centroid_rnb)
    possible=possible(find(possible~=2));
end
if isCentroid < min(Centroid_rock) || isCentroid > max(Centroid_rock)
    possible=possible(find(possible~=3));
end


%outside a genres flux range
if isFlux < min(Flux_blues) || isFlux > max(Flux_blues)
    possible=possible(find(possible~=7));
end
if isFlux < min(Flux_classical) || isFlux > max(Flux_classical)
    possible=possible(find(possible~=5));
end
if isFlux < min(Flux_country) || isFlux > max(Flux_country)
    possible=possible(find(possible~=4));
end
if isFlux < min(Flux_jazz) || isFlux > max(Flux_jazz)
    possible=possible(find(possible~=6));
end
if isFlux < min(Flux_rap) || isFlux > max(Flux_rap)
    possible=possible(find(possible~=1));
end
if isFlux < min(Flux_rnb) || isFlux > max(Flux_rnb)
    possible=possible(find(possible~=2));
end
if isFlux < min(Flux_rock) || isFlux > max(Flux_rock)
    possible=possible(find(possible~=3));
end

%compare roll off
%country has the lowest roll off around 1100 which is 100 times smaller
%than the second smallest rolloff, rock.
if isRolloff > max(Rolloff_country)
    %your not country
    possible=possible(find(possible~=4));%remove country
end

%add more rolloff stuff if needed,since the numbers are different enough.





%% 

%Third, Decide
decide='The song is ';
if find(possible==1)
    decide=strcat(decide,' rap');
end
if find(possible==2)
    decide=strcat(decide,' R&B');
end
if find(possible==3)
    decide=strcat(decide,' rock');
end
if find(possible==4)
    decide=strcat(decide,' country');
end
if find(possible==5)
    decide=strcat(decide,' classical');
end
if find(possible==6)
    decide=strcat(decide,' jazz');
end
if find(possible==7)
    decide=strcat(decide,' blues');
end

disp(decide)


    
end

%error with cls (3) it doesnt return any genre, perhap i shouldnt remove
%from list but instead add percentages to each


