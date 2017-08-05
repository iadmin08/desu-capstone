function [ envelope ] = EnvelopeExtraction( SongData, FS )
%ENVELOPEEXTRACTION - Helps in calculating beat histogram
%   
%This function performs Full Wave Retectification,
%Low-Pass Filtering, Downsampling and Mean Removal
%Full Wave Retectification - 
%Low-Pass Filtering - 
%Downsampling - 
%Mean Removal - 

y=SongData;
%%
%Full Wave Rectification
y=abs(y);

%%
%Low-Pass Filtering
y = filter(.01, [1 -.99], y);%?? might be wrong

%%
%Downsampling
y = downsample(y, 16);

%%
%Mean Removal
y = y - mean(y);

%%
envelope = y;

end

