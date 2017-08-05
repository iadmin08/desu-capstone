function [ highFreq ] = getHighPass( songData, Fs )
%GETHIGH Summary of this function goes here
%   Detailed explanation goes here

N=10;
Wn = ((Fs/16)/(Fs/2));%Fs/2 represents 1
[B,A] = butter(N,Wn,'high');
highFreq = filter(B,A,songData);

end

