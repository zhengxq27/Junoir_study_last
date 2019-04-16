% Program 5_3
% Numerical Computation of Fourier transform Using DFT
k = 0:15; w = 0:511;
x = cos(2*pi*k*3/16);% Generate the length-16 sinusoidal sequence
X = fft(x); % Compute its 16-point DFT
XE = fft(x,512); % Compute its 512-point DFT
% Plot the frequency response and the 16-point DFT samples
plot(k/16,abs(X),'o', w/512,abs(XE))
xlabel('\omega/\pi'); ylabel('Magnitude')