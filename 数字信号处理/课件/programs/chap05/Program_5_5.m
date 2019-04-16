% Program 5_5
% Illustration of Overlap-Add Method
%
% Generate the noise sequence
R = 64;
d = rand(R,1)-0.5;
% Generate the uncorrupted sequence and add noise
k = 0:R-1;
s = 2*k.*(0.9.^k);
x = s + d';
% Read in the length of the moving average filter
M = input('Length of moving average filter = ');
% Generate the moving average filter coefficients
h = ones(1,M)/M;
% Perform the overlap-add filtering operation
y = fftfilt(h,x,4);
% Plot the results
plot(k,s,'r-',k,y,'b--')
xlabel('Time index n');ylabel('Amplitude')
legend('s[n]','y[n]')