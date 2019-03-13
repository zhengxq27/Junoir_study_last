f=1;Um=1;nt=2;%输入信号频率、振幅和显示周期数
N = 16; %采样点数
T = 1/f;% 信号周期
dt = T/N; %采样时间间隔
n = 0 : nt*N - 1; %建立离散信号的时间序列
tn = n*dt;
y1 = Um*sin(2*f*pi*t); %声明sin函数
y_1 = Um*sin(2*f*pi*tn);%对原模拟信号进行采样,采样点数为8
t = 0:0.01:2;
plot(t,y1); %绘制函数
hold; %锁定绘图

axis([0,nt*T,min(y1),max(y1)]);%限定横坐标和纵坐标的显示范围
title('f(t) = sin(2πt)'); %加标题
xlabel('t'); %横坐标符号
ylabel('f(t)'); %纵坐标符号
stem(tn,y_1);


y2 = Um*sin(4*f*pi*t); %声明y2函数
plot(t,y2);

y3 = Um*sin(2*f*pi*t + pi/2); %声明y3函数
plot(t,y3);




