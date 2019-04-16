%A proposed natural sounding reveberator (The Schroeder’s Reverberator)
% y = reverb(x,R,a)
%
% Parameters:
%  x is the input audio signal
%  R is a 6-element vector describing the delays in allpass structure
%  a is a 7-element vector describing multiplier values in the reverberator
%
% Return value:
%  y is the output signal
%
% Copyright 2004 Vincent Wan
% Credits: Vikas Sahdev, Rajesh Samudrala, Rajani Sadasivam
%
% Example:
%  a = [0.6 0.4 0.2 0.1 0.7 0.6 0.8];
%  R = [700 900 600 400 450 390];
%  [x,fs,nbits] = wavread('dsp01.wav');
%  y = reverb(x,R,a);
%  wavplay(y,fs);

function y = reverb(x,R,a)

d1 = multiecho(x, R(1), a(1), 0);
d2 = multiecho(x, R(2), a(2), 0);
d3 = multiecho(x, R(3), a(3), 0);
d4 = multiecho(x, R(4), a(4), 0);
d_IIR = d1 + d2 + d3 + d4;  %output of IIR echo generators

d_ALL1 = alpas(d_IIR, R(5), a(5));
d_ALL2 = alpas(d_ALL1, R(6), a(6));

y = x + a(7)*d_ALL2;

