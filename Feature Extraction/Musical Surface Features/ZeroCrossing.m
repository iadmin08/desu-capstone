function [ ZXing ] = ZeroXing( S,F,T )
%ZEROXING Summary of this function goes here
%   Calculates the zero crossing at a particular time t
%S(freq,time)
time_frame=1;%lets arbitrarily choose frame 1
ZXing=0;
    for bin=2:1:length(F),
        ZXing = ZXing + abs(sign(S(bin,time_frame)) - sign(S(bin-1,time_frame)));
        %disp(bin);
    end

    ZXing = ZXing * 0.5;%give measurement of noisiness
    
end

