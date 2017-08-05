function [ lowFreq ] = getLowPass( songData, Fs )
%GETLOW Summary of this function goes here
%   Detailed explanation goes here

N=10;
Wn = ((Fs/32)/(Fs));%Fs/2 represents 1.
[B,A] = butter(N,Wn,'low');
lowFreq = filter(B,A,songData);

end

