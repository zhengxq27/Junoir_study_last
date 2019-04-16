% Program 5_1
% Illustration of DFT Computation
%
% Read in the length N of sequence and the desired
% length M of the DFT
N = input('Type in the length of the sequence = ');
M = input('Type in the length of the DFT = ');
%  Generate the length-N time-domain sequence
u = [ones(1,N)];
% Compute its M-point DFT
U = fft(u,M);
% Plot the time-domain sequence and its DFT
t = 0:1:N-1;
stem(t,u)
title('Original time-domain sequence')
xlabel('Time index n'); ylabel('Amplitude')
pause
subplot(2,1,1)
k = 0:1:M-1;
stem(k,abs(U))
title('Magnitude of the DFT samples')
xlabel('Frequency index k'); ylabel('Magnitude')
subplot(2,1,2)
stem(k,angle(U))
title('Phase of the DFT samples')
xlabel('Frequency index k'); ylabel('Phase')