Dt = 0.0001; 
t = -10:Dt:10;
f = 0.*(t < -pi) + 0.5*(1 + cos(t)).*(t >= -pi & t <= pi) + 0.*(t > pi); % �ֶκ����������޷���ʾ�����������������-10��10����
w = linspace(-2*pi,2*pi,1000); % [-2pi,2pi]֮���Ƶ������ָ�Ϊ1000��
X = f*exp(-1j*t'*w)*Dt; %����Ҷ�任
subplot(3,1,1);
plot(w,X);
xlabel('��');
ylabel('X(j��)');
title('frequency spectrum of original ');