function [anyZcr] = FinalTest(d,sr,file)
%Determines if song is rap or country. based on zero crossing below
%specific threshold
%d is the music data, Fs is the sample rate
%if it returns a 1 then that song has zero crossing above a specific
%threshold. if it returns 0 then that song doesn;t
dsize=size(d);
if dsize(2) > 1
    d(:,2) = [];%deletes the second column..mono
end

%%------------------------------ZERO CROSSING
% find length of wav file 
len_samp = length(d);
% Length of frame 
frame_size = .02;
frame_length = round(sr*frame_size); 
frames_per_sec = round(1/frame_size); % 50 frames per second
% Calculate number of zero-crossings in each frame 
zcr = []; 
n=1;
for frame = 1:frame_length:len_samp-frame_length
    frameData = d(frame:frame+frame_length-1);
    % Sum up zero crossings accross frame 
    zcr(n) = 0;
    for i = 2:length(frameData)
    zcr(n) = zcr(n) + abs(sign(frameData(i)) - sign(frameData(i-1))); 
    end
    zcr(n) = zcr(n)/(2*frame_length); 
    n=n+1;
end
num_frames = length(zcr);
zcr(zcr>.005)=0;

%plot(1:1:num_frames,zcr)
%axis([0 300 -.005 .005]) %for cutoff
%str2 = sprintf('Zero Crossings: %s',file);
%title(str2);
%xlabel('Frame');
%ylabel('Sum of Zero Crossings Across Frame');

if any(zcr)
    signal_type = 'This is a rap music signal';
    anyZcr=true;
end
if ~any(zcr)
    signal_type = 'This is a country music signal';
    anyZcr=false;
end

%disp(signal_type);

