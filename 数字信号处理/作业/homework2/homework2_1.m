Dt = 0.0001; 
t = -10:Dt:10;
f = 0.*(t < -pi) + 0.5*(1 + cos(t)).*(t >= -pi & t <= pi) + 0.*(t > pi); % �ֶκ����������޷���ʾ�����������������-10��10����
subplot(3,1,1);
plot(t,f);
xlabel('t');
ylabel('f(t)');
title('f(t) = 1/2 * (1 + cos(t) )');
% hold; %������ͼ
w = linspace(-2*pi,2*pi,500); % [-2pi,2pi]֮���Ƶ������ָ�Ϊ500��
X = f*exp(-1j*t'*w); %����Ҷ�任
subplot(3,1,2);
plot(w,X);
xlabel('��');
ylabel('X(j��)');
title('frequency spectrum');

T = fft(f);
subplot(3,1,3);
plot(w,T);




