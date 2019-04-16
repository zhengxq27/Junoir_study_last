% Program 3_1
% Discrete-Time Fourier Transform Computation
%
% Read in the desired number of frequency samples
k = input('Number of frequency points = ');
% Read in the numerator and denominator coefficients
num = input('Numerator coefficients = ');
den = input('Denominator coefficients = ');
% Compute the frequency response
w = 0:pi/(k-1):pi;
h = freqz(num, den, w);
% Plot the frequency response
subplot(2,2,1)
plot(w/pi,real(h));grid
title('Real part')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(2,2,2)
plot(w/pi,imag(h));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(2,2,3)
plot(w/pi,abs(h));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
subplot(2,2,4)
plot(w/pi,angle(h));grid
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')