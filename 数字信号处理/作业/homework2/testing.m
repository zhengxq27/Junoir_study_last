Dt = 0.0001; 
t = -10:Dt:10;
f = cos(t);
subplot(2,1,1);
plot(t,f);
xlabel('t');
ylabel('f(t)');
title('f(t) = 1/2 * (1 + cos(t) )');
% hold; %������ͼ
w = linspace(-10*pi,10*pi,1000); % [-2pi,2pi]֮���Ƶ������ָ�Ϊ500��
X = f*exp(-1j*t'*w)*Dt; %����Ҷ�任
subplot(2,1,2);
plot(w,X);
xlabel('��');
ylabel('X(j��)');
title('frequency spectrum');