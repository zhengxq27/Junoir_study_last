f=1;Um=1;nt=2;%输入信号频率、振幅和显示周期数
N = 8; %采样点数
T = 1/f;% 信号周期
dt = T/N; %采样时间间隔
n = 0 : nt*N - 1; %建立离散信号的时间序列
tn = n*dt;
y = Um*sin(2*f*pi*t); %声明sin函数
yn = Um*sin(2*f*pi*tn);%对原模拟信号进行采样
t = 0:0.01:2;
plot(t,y); %绘制函数
hold; %锁定绘图
axis([0,nt*T,min(y),max(y)]);%限定横坐标和纵坐标的显示范围
title('f(t) = sin(2πt)'); %加标题
xlabel('t'); %横坐标符号
ylabel('f(t)'); %纵坐标符号
stem(tn,yn);


