% Program 11
% Sigma-Delta Quantizer Operation
N = input('Type in the length of input sequence = ');
n = 1:1:N;
m = n-1;
A = input('Type in the input amplitude = ');
x = A*ones(1,N);
plot(m,x);
axis([0 N-1 -1.2 1.2]);
xlabel('Time'); ylabel('Amplitude');
title('Input analog signal');
pause
y = zeros(1,N+1);
v0 = 0;
   for k = 2:1:N+1;
        v1 = x(k-1) - y(k-1) + v0;
        y(k) = sign(v1);
        v0 = v1;
   end
yn = y(2:N+1);
axis([0 N-1 -1.2 1.2]);
stem(m, yn);
xlabel('Time'); ylabel('Amplitude');
title('Output of sigma-delta modulator');
ave = sum(yn)/N;
disp('Average value of output is = ');disp(ave);
