function [ FluxSum ] = Flux(S,F,T)
%FLUX - 
%   Detailed explanation goes here
%S(freq,time)
Flux=0;
%not using any more time_frame=2;%i arbitrarily choose frame 2. i could've picked any frame.
%this variable should be a argument
FluxSum=0;
for time=2:1:length(T),%all time domains

    for bin=1:1:length(F),
        %now uses magnitude of complex abs(COMPLEX)
        Flux = Flux + ( abs(S(bin,time)) - abs(S(bin,time-1)) )^2;
    end
    
    FluxSum = FluxSum + Flux;
end

    FluxSum = FluxSum / length(T);%average flux of this song
