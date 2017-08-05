function [ Csum ] = Centroid( S, F, T )
%CENTROID Summary of this function goes here
%   Detailed explanation goes here
%S(freq,time)

F_M_of_F=0;
M_of_F=0;

%sum up columns
%i choose frame 1(point in time) perhaps this should be variable
Csum=0;
for time=1:1:length(T),%all time domains
    
    for bin=1:1:length(F),
        %now uses magnitude of complex number abs(COMPLEX)
        F_M_of_F = F_M_of_F + F(bin)*abs(S(bin,1));%sum up column 1 * f
    end

    for bin=1:1:length(F),
        M_of_F= M_of_F + abs(S(bin,1));%sum up column 1
    end

    C=F_M_of_F / M_of_F;
    Csum = Csum + C;
end

    Csum = Csum / length(T);%average centroid of this song

end
