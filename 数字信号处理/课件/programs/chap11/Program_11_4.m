% Program 11_4
% Illustration of Lowpass Filtering
% Using the Cascade Realization
%
k = 1:51;
w1 = 0.8*pi;w2 = 0.1*pi;
A = 1.5;B = 2.0;
x1 = A*cos(w1*(k-1)); x2 = B*cos(w2*(k-1));
x = x1+x2;
b1 = 0.0662272*[1 1];
a1 = [1 -0.2593284];
y1 = filter(b1,a1,x,0);
si = [0 0];
b2 = [1 2 1];
a2 = [1 -0.6762858 0.3917468];
y2 = filter(b2,a2,y1,si);
stem(k-1,y2);axis([0 50 -4 4]);
xlabel('Time index n'); ylabel('Amplitude');