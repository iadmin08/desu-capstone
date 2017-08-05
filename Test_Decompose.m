%This file test the wavelt packet decomposition
%It is possible to listen to each node
%each node represents the inputed song strectched and dilated differently
%Right node-details aka high
%Left node-coarse aka low
%as you descend in leves the sample rate reduces by a factor of 2

%useful functions: wpdec, wpcoef, wprcoef, wprec 

file='../data/country/c (1).wav';
%file='../data/rap/rap (12).wav';

%y-data,Fs-sample rate, nbits-number of bits per sample
[y, Fs, nbits]=wavread(file);

%T=tree
level=3;
T=wpdec(y,level,'db4');
%plot(T);

%%%%%%%%%%%%%%%%%%Add Up Nodes on third Level%%%%%%%%%%%%%%%%%%%

%where NodeNum is a specific node in the tree
NodeNum=1;
coEff=wpcoef(T,NodeNum);

%test for combining nodes from tree
first=(2^level);
last=(2^level+1)-1;
c=wpcoef(T,first);%set c to first node on level

for i=first+1:1:last,%add the rest of nodes on level
    c=c+wpcoef(T,i);
end

%listen to combined sound %divide by 8 becuase of 3rd level...2^3=8
%sound(c,Fs/8)

