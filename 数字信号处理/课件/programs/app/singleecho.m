%Delay Function
% y =  singleecho(x, R, a);
% 
% Parameters:
%  x is the input audio signal
%  R is the delay in number of samples
%  a specifies the attenuation in the echo
%
% Return value:
%  y is the output signal
%
% Copyright 2004 Vincent Wan
% Credits: Vikas Sahdev, Rajesh Samudrala, Rajani Sadasivam
%
% Example:
%  [x,fs,nbits] = wavread('dsp01.wav');
%  y = singleecho(x,8000,0.5);
%  wavplay(y,fs);

function y =  singleecho(x, R, a);
xlen=length(x); %Calc. the number of samples in the file 

y=zeros(size(x)); 

% filter the signal 

for i=1:1:R+1
   y(i) = x(i);
end

for i=R+1:1:xlen 
  y(i)= x(i)+ a*x(i-R); 
end;



