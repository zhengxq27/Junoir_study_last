Dt = 0.2; 
t = linspace(-100,100,1000); %采样周期是0.2
f = cos(t);
%f = ones(1,length(t));
subplot(3,1,1);
plot(t,f);
xlabel('t');
ylabel('f(t)');
title('f(t) = cost');
% hold; %锁定绘图
w = linspace(-2*pi,2*pi,1000); % [-2pi,2pi]之间的频率区间分割为200份
%采样的最高频率不能高于4*pi（奈奎斯特率）
%采样周期不能小于1/(4*pi)，上面的采样周期是0.1，满足条件；

X = f*exp(-1j*t'*w)*Dt; %傅里叶变换
subplot(3,1,2);
plot(w,abs(X));
xlabel('Ω');
ylabel('X(jΩ)');
title('幅度谱');
subplot(3,1,3);
plot(w,angle(X));
title('相位谱');



