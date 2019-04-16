%Allpass reveberator 
% y = alpas(x,R,a)
%
% Parameters:
%  x is the input audio signal
%  R is the delay in allpass structure
%  a specifies the allpass filter coefficient 
%
% Return value:
%  y is the output signal
%
% Copyright 2004 Vincent Wan
% Credits: Vikas Sahdev, Rajesh Samudrala, Rajani Sadasivam
%
% Example:
%  [x,fs,nbits] = wavread('dsp01.wav');
%  y = alpas(x,8000,0.5);
%  wavplay(y,fs);

function y = alpas(x,R,a)

num=[a,zeros(1,R-1),1];

den=fliplr(num);

y=filter(num,den,x);

