%Multiple Echo
% y = multiecho(x,R,a,N);
%
% Generates multiple echos R samples apart with exponentially decaying amplitude
% Parameters:
%  x is the input audio signal
%  R is the delay in number of samples
%  a specifies the attenuation in the echos
%  N-1 is the total number of echos (If N = 0, an infinite number of echos is produced)
%
% Return value:
%  y is the output signal
%
% Copyright 2004 Vincent Wan
% Credits: Vikas Sahdev, Rajesh Samudrala, Rajani Sadasivam
%
% Example:
%  [x,fs,nbits] = wavread('dsp01.wav');
%  y = multiecho(x,8000,0.5,3);
%  wavplay(y,fs);

function y = multiecho(x,R,a,N);

if (N == 0)
   num=[zeros(1,R),1];
   den=[1,zeros(1,R-1),-a];
else
   num=[1,zeros(1,N*R-1),-a^N];
   den=[1,zeros(1,R-1),-a];
end
y=filter(num,den,x);

