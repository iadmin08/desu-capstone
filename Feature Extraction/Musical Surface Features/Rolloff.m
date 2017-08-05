function [ RollSum ] = Rolloff( S, F, T )
%ROLLOFF calculates the roll off at some time t i arbitrarily choose t=1
%   Detailed explanation goes here
%S(freq,time)
M_of_F=0;
M_of_F_85=0;
Roll=0;
RollSum=0;
for time=1:1:length(T),%all time domains

    for bin=1:1:length(F),
        M_of_F= M_of_F + S(bin,time);%sum up column 1
    end

    %now we have M[f], now lets calculate 85% of it

    for Roll=1:1:length(F),
        M_of_F_85 = M_of_F_85 + S(Roll,time);
        if (M_of_F_85 > 0.85*M_of_F)%larger than 85% of M[f]
            break
        end 
    RollSum= RollSum + Roll;
    end

    % Dont do this %RollSum = RollSum / length(T);%average rolloff for this song

end