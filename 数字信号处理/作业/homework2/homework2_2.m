%在整个程序中,w、Dt和t的值都是不变的
       % w表示采样的频率
       % t既是为了模拟连续时间信号取的时间序列，同时也是为求积分的时候所取的间隔很小的时间序列
       % Dt代表时间序列t任意两个相邻时间内的时间间隔
Dt = 0.0001; 
t = -10:Dt:10;
f = 0.*(t < -pi) + 0.5*(1 + cos(t)).*(t >= -pi & t <= pi) + 0.*(t > pi); % 分段函数，这里无法表示负无穷到正无穷所以用-10到10近似
%以上过程为建立原始信号
subplot(4,2,1);
plot(t,f);
xlabel('t');
ylabel('f(t)');
title('original signal');
%绘制原始信号的图像
w = linspace(-2*pi,2*pi,1000); % [-2pi,2pi]之间的频率区间分割为1000份
X = f*exp(-1j*t'*w)*Dt; %傅里叶变换，t'的每个相邻时间差是0.0001，足够小，我们近似认为此时级数等于积分
subplot(4,2,2);
plot(w,X);
xlabel('Ω');
ylabel('X(jΩ)');
title('frequency spectrum');

T1 = 1; %采样周期为1
dt1 = 1/T1; %采样间隔，在上面我们初始化原始信号的范围是-10到10；
tn1 = -10:dt1:10;
f1 = 0.*(tn1 < -pi) + 0.5*(1 + cos(tn1)).*(tn1 >= -pi & tn1 <= pi) + 0.*(tn1 > pi);
subplot(4,2,3);
stem(tn1,f1); %绘制采样信号图像
X1 = f*exp(-1j*t'*w)*Dt; %傅里叶变换，t'的每个相邻时间差是0.0001，足够小，我们近似认为此时级数等于积分
subplot(4,2,4);
plot(w,X1);
xlabel('Ω');
ylabel('X1(jΩ)');
title('frequency spectrum of X1');

T2 = pi/2; %采样周期为pi/2
tn2 = -10:T2:10;
f2 = 0.*(tn2 < -pi) + 0.5*(1 + cos(tn2)).*(tn2 >= -pi & tn2 <= pi) + 0.*(tn2 > pi);
subplot(4,2,5);
stem(tn2,f2); %绘制采样信号图像
X2 = f*exp(-1j*t'*w)*Dt; %傅里叶变换，t'的每个相邻时间差是0.0001，足够小，我们近似认为此时级数等于积分
subplot(4,2,6);
plot(w,X2);
xlabel('Ω');
ylabel('X2(jΩ)');
title('frequency spectrum of X2');

T3 = 2; %采样周期为2
tn3 = -10:T3:10;
f3 = 0.*(tn3 < -pi) + 0.5*(1 + cos(tn3)).*(tn3 >= -pi & tn3 <= pi) + 0.*(tn3 > pi);
subplot(4,2,7);
stem(tn3,f3); %绘制采样信号图像
X3 = f*exp(-1j*t'*w)*Dt; %傅里叶变换，t'的每个相邻时间差是0.0001，足够小，我们近似认为此时级数等于积分
subplot(4,2,8);
plot(w,X3);
xlabel('Ω');
ylabel('X3(jΩ)');
title('frequency spectrum of X3');






