Dt = 0.1; 
t = linspace(-10,10,200); %采样周期是0.1
f = cos(t);
%f = ones(1,length(t));
subplot(3,1,1);
plot(t,f);
xlabel('t');
ylabel('f(t)');
title('f(t) = cost');
% hold; %锁定绘图
w = linspace(-2*pi,2*pi,200); % [-2pi,2pi]之间的频率区间分割为200份
%采样的最高频率不能高于4*pi（奈奎斯特率）
%采样周期不能小于1/(4*pi)，上面的采样周期是0.1，满足条件；

X = f*exp(-1j*t'*w)*Dt; %傅里叶变换
subplot(3,1,2);
plot(w,abs(X));
xlabel('Ω');
ylabel('X(jΩ)');
title('frequency spectrum');
subplot(3,1,3);
plot(w,angle(X));


%nfft = 2^nextpow2(2001);
%x = fft(f,nfft)/2001; %除以信号长度才可以得到频谱
%fs = 1/0.01; %采样频率
%w1 = fs/2*linspace(0,1,nfft);
%subplot(3,1,3);
%plot(w1,2*abs(x(1:nfft)));


