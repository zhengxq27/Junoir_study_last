Dt = 0.1; 
t = -10:Dt:10;
f = 0.*(t < -pi) + 0.5*(1 + cos(t)).*(t >= -pi & t <= pi) + 0.*(t > pi); % 分段函数，这里无法表示负无穷到正无穷所以用-10到10近似
subplot(2,1,1);
plot(t,f);
xlabel('t');
ylabel('f(t)');
title('f(t) = 1/2 * (1 + cos(t) )');
w = linspace(-2*pi,2*pi,1000); % [-2pi,2pi]之间的频率区间分割为1000份
%采样的最高频率不能高于4*pi（奈奎斯特率）
%采样周期不能小于1/(4*pi)，上面的采样周期是0.1，满足条件；
X = f*exp(-1j*t'*w)*Dt; %傅里叶变换
subplot(2,1,2);
plot(w,X);
xlabel('Ω');
ylabel('X(jΩ)');
title('frequency spectrum');







