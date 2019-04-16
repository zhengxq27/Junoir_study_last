% Program 3
% Spectrogram of a Speech Signal
%
load mtlb
n = 1:4001;
plot(n-1,mtlb);
xlabel('Time index n');ylabel('Amplitude');
pause
nfft = input('Type in the window length = ');
ovlap = input('Type in the desired overlap = ');
specgram(mtlb,nfft,7418,hamming(nfft),ovlap)
