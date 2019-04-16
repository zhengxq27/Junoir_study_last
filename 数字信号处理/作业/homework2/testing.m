Dt = 0.1; 
t = linspace(-10,10,200); %����������0.1
f = cos(t);
%f = ones(1,length(t));
subplot(3,1,1);
plot(t,f);
xlabel('t');
ylabel('f(t)');
title('f(t) = cost');
% hold; %������ͼ
w = linspace(-2*pi,2*pi,200); % [-2pi,2pi]֮���Ƶ������ָ�Ϊ200��
%���������Ƶ�ʲ��ܸ���4*pi���ο�˹���ʣ�
%�������ڲ���С��1/(4*pi)������Ĳ���������0.1������������

X = f*exp(-1j*t'*w)*Dt; %����Ҷ�任
subplot(3,1,2);
plot(w,abs(X));
xlabel('��');
ylabel('X(j��)');
title('frequency spectrum');
subplot(3,1,3);
plot(w,angle(X));


%nfft = 2^nextpow2(2001);
%x = fft(f,nfft)/2001; %�����źų��Ȳſ��Եõ�Ƶ��
%fs = 1/0.01; %����Ƶ��
%w1 = fs/2*linspace(0,1,nfft);
%subplot(3,1,3);
%plot(w1,2*abs(x(1:nfft)));


