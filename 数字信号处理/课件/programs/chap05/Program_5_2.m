% Program 5_2
% Illustration of IDFT Computation
%
% Read in the length K of the DFT and the desired
% length N of the IDFT
K = input('Type in the length of the DFT = ');
N = input('Type in the length of the IDFT = ');
%  Generate the length-K DFT sequence
k = 0:K-1;
V = k/K;
%  Compute its N-point IDFT
v = ifft(V,N);
% Plot the DFT and its IDFT
stem(k,V)
xlabel('Frequency index k'); ylabel('Amplitude')
title('Original DFT samples')
pause
subplot(2,1,1)
n = 0:N-1;
stem(n,real(v))
title('Real part of the time-domain samples')
xlabel('Time index n'); ylabel('Amplitude')
subplot(2,1,2)
stem(n,imag(v))
title('Imaginary part of the time-domain samples')
xlabel('Time index n'); ylabel('Amplitude')