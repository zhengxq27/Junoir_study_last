% Program 4_4
% Set up the filter coefficients
b = [-6.76195 13.456335 -6.76195];
%  Set initial conditions to zero values
zi = [0 0];
% Generate the two sinusoidal sequences
n = 0:99;
x1 = cos(0.1*n);
x2 = cos(0.4*n);
%  Generate the filter output sequence
y = filter(b, 1, x1+x2, zi);
% Plot the input and the output sequences
plot(n,y,'r-',n,x2,'b--',n,x1,'g-.');grid
axis([0 100 -1.2 4]);
ylabel('Amplitude'); xlabel('Time index n');
legend('y[n]','x2[n]','x1[n]')