% Program 11_11
% Illustration of Zoom FFT Computation
%
n = 0:31;
x = sin(2*pi*11*n/64);
XZ = zoomfft(x,64,8,85);
%print absolute values of the DFT samples
disp('DFT Samples');disp(abs(XZ))