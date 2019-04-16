Dt = 0.0001; 
t = -10:Dt:10;
f = 0.*(t < -pi) + 0.5*(1 + cos(t)).*(t >= -pi & t <= pi) + 0.*(t > pi); % �ֶκ����������޷���ʾ�����������������-10��10����
subplot(3,1,1);
plot(t,f);
xlabel('t');
ylabel('f(t)');
title('f(t) = 1/2 * (1 + cos(t) )');
w = linspace(-2*pi,2*pi,1000); % [-2pi,2pi]֮���Ƶ������ָ�Ϊ1000��
X = f*exp(-1j*t'*w)*Dt; %����Ҷ�任
subplot(3,1,2);
plot(w,X);
xlabel('��');
ylabel('X(j��)');
title('frequency spectrum');

Y = ifft(X);
subplot(3,1,3);
t = -10:0.02:10-0.02;
plot(t,Y);






