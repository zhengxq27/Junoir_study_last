% Program 4_1
% Signal Smoothing by a Moving-Average Filter
%
R = 50;
d = rand(R,1)-0.5;
m = 0:1:R-1;
s = 2*m.*(0.9.^m);
x  = s + d';
plot(m,d,'r-',m,s,'b--',m,x,'g:')
xlabel('Time index n'); ylabel('Amplitude')
legend('d[n]','s[n]','x[n]');
pause
M = input('Number of input samples = ');
b = ones(M,1)/M;
y = filter(b,1,x);
plot(m,s,'r-',m,y,'b--')
legend('s[n]','y[n]');
xlabel ('Time index n');ylabel('Amplitude')