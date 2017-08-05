function [ ac ] = BeatHistogram( AutoCorrelatedData )
%BEATHISTOGRAM Summary of this function goes here
%   Detailed explanation goes here

%peak extraction
ac = AutoCorrelatedData;
for i=2:1:length(ac)-1,
   peak=max(ac(i-1:i+1));%window size of 3
   if peak == ac(i-1)
       ac(i) = 0;
       ac(i+1) = 0;
   end
   if peak == ac(i)
       ac(i-1) = 0;
       ac(i+1) = 0;
   end
   if peak==ac(i+1)
       ac(i-1) = 0;
       ac(i) = 0;
   end
end

