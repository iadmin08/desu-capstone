function [ autoc ] = AutoCorrelation( SongData )
%AUTOCORRELATION Summary of this function goes here
%   Detailed explanation goes here

x=SongData;
k=1;
autoc=zeros(length(x),1);
for i=1:1:length(x),
    sum=0;
    for n=2:k:length(x),
        if (n-k) <= 0
            sum = sum + x(n)*x(1);
        else
            sum = sum + x(n)*x(n-k);
        end
    end
    sum = sum * (1/length(x));
    autoc(i)=sum;
    k = k + 1;

end