Dt = 0.0001; 
t = -10:Dt:10;
f = cos(t);
subplot(2,1,1);
plot(t,f);
xlabel('t');
ylabel('f(t)');
title('f(t) = 1/2 * (1 + cos(t) )');
% hold; %锁定绘图
w = linspace(-10*pi,10*pi,1000); % [-2pi,2pi]之间的频率区间分割为500份
X = f*exp(-1j*t'*w)*Dt; %傅里叶变换
subplot(2,1,2);
plot(w,X);
xlabel('Ω');
ylabel('X(jΩ)');
title('frequency spectrum');