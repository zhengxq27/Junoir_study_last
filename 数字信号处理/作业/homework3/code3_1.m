%定义题目中给出的参数
fs = 15/(2*pi);
rp = 0.3; %通带最大衰减
as = 40; %阻带最大衰减
T = 1 / fs; %采样周期
ws = 5/fs; % 阻带截止频率
wp = 3/fs; % 通带截止频率

c = [3.32,3,11,5,56]*pi;
wc = (ws*wp)/2;
delt_w = ws - wp;

% Kaiser窗
n4 = ceil((as-8)/delt_w*2.285);
m4 = (n4 - 1)/2;
b = 0.5842*(as-21)^0.4 + 0.07886*(as-21);
win4 = kaiser(n4);
display(['Kaiser窗生成的冲激响应系数：','（阶数N:',num2str(n4),')']);

n = -m4:m4;
ft = fir1(n4-1,wc/pi,win4);

subplot(1,2,1);
plot(n,ft);
title('实际冲激响应');
xlabel('n');
ylabel('ft');

[h,w] = freqz(ft,1,512);
W = w/pi;
H = 20*log10(abs(h));
subplot(1,2,2);
plot(W,H);
title('增益效应');
xlabel(['pi(omega/omega','s)']);
ylabel('增益(dB)');