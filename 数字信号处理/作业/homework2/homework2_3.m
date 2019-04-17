Dt = 0.1; 
t = -10:Dt:10;
f = 0.*(t < -pi) + 0.5*(1 + cos(t)).*(t >= -pi & t <= pi) + 0.*(t > pi); % 分段函数，这里无法表示负无穷到正无穷所以用-10到10近似
%以上过程为建立原始信号
w = linspace(-2*pi,2*pi,1000); % [-2pi,2pi]之间的频率区间分割为1000份
X = f*exp(-1j*t'*w)*Dt; %傅里叶变换，t'的每个相邻时间差是0.0001，足够小，我们近似认为此时级数等于积分

T1 = 2; %采样周期
tn1 = -10:T1:10;
f1 = 0.*(tn1 < -pi) + 0.5*(1 + cos(tn1)).*(tn1 >= -pi & tn1 <= pi) + 0.*(tn1 > pi);
X1 = f1*exp(-1j*tn1'*w); 
subplot(3,1,1);
plot(w,X1);
xlabel('Ω');
ylabel('X1(jΩ)');
title('采样信号的频谱');

X2 = 0.*(w < -2.4) + X1.*(w >= -2.4 & w <= 2.4) + 0.*(w >2.4);
subplot(3,1,2);
plot(w,X2);
xlabel('Ω');
ylabel('X2(jΩ)');
title('滤波之后的频谱');

%傅里叶逆变换
t1 = linspace(-10,10,1000);
w1 = linspace(-pi,pi,1000);
fr = (0.5/pi)*X2*exp(1j*t1'*w1)*(0.002*pi);
subplot(3,1,3);
plot(t1,fr);
xlabel('t');
ylabel('f(t)');
title('重建信号与初始信号的比较');
hold on;
plot(t,f);
legend('reconstructed','original');







