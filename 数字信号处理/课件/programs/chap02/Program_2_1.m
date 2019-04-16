% Program 2_1
% Generation of the ensemble average
%
R = 50;
m = 0:R-1;
s = 2*m.*(0.9.^m); % Generate the uncorrupted signal
d = rand(R,1)-0.5; % Generate the random noise
x1 = s+d';
stem(m,d);
xlabel('Time index n');ylabel('Amplitude'); title('Noise');
pause
for n = 1:50;
    d = rand(R,1)-0.5;
    x = s + d';
    x1 = x1 + x;
end
x1 = x1/50;
stem(m,x1);
xlabel('Time index n');ylabel('Amplitude'); title('Ensemble average');