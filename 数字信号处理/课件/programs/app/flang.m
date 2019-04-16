%Flanger
% flang(x,R,a,omega,fs)
% 
% Parameters:
%  x is the input audio signal
%  R is the maximum delay value 
%  a specifies the attenuation in the echo, and can be set between [-1,1]
%  omega is a low angular frequency over which the delay varies sinusoidally
%  fs is the sampling frequency
%
% Return value:
%  y is the output signal
%
% Copyright 2004 Vincent Wan
% Credits: Vikas Sahdev, Rajesh Samudrala, Rajani Sadasivam
%
% Example:
%  [x,fs,nbits] = wavread('dsp01.wav');
%  y = flang(x,1000,0.5,2*pi*6,fs);
%  wavplay(y,fs);

function y = flang(x,R,a,omega,fs)
y=zeros(size(x)); 

% filter the signal 
max_length = length(x);
for i=1:max_length   
   delay = R/2*(1-cos(omega*i/fs));
   delay_ceiling = ceil(delay);
   y(i) = x(i);
   if (delay <= (i - 1))
      %Use linear interpolation
      y(i) = y(i)+a*( x(i-delay_ceiling) + (x(i-delay_ceiling+1) - x(i-delay_ceiling))*(delay_ceiling - delay));
   end 
end