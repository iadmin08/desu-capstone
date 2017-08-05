file='../data/country/c (1).wav';
%file='../data/rap/rap (12).wav';

%y-data,Fs-sample rate, nbits-number of bits per sample
[y, Fs, nbits]=wavread(file);

%Surface features depend on S,F,T. how can the be useful else where???

[S,F,T]=spectrogram(y(:,1),Fs/15,0,Fs/15,Fs);%Fs/15=2490 samplerate/time
%spectrogram(y(:,1),Fs/15,0,Fs/15,Fs);%without assignment this will display figure
%S contains the amplitude at specfic freqs & times  
%---Inside of S Rows are Freq and Columns are Time. S(Row,Column)
%F contains the freq
%T contains the time



%The syntax is: spectrogram(x,window,overlap,NFFT,fs)
%where x is your entire data vector
%window is your window function. 
%If you enter just a number, say W (must be integer), 
%then MATLAB chops up your data into chunks of W samples each and 
%forms the spectrogram from it. 
%This is equivalent to using a rectangular window of length W samples. 
%If you want to use a different window, provide hann(W) or 
%whatever window you choose.
%overlap is the number of samples that you need to overlap. 
%So, if you need 50% overlap, this value should be W/2. 
%Use floor(W/2) or ceil(W/2) if W can take odd values. This is just an integer.
%NFFT is the FFT length
%fs is the sampling frequency of your data vector. 
%You can leave this empty, and MATLAB plots the figure in terms of 
%normalized frequencies and the time axis as simply the data chunk index. 
%If you enter it, MATLAB scales the axis accordingly.