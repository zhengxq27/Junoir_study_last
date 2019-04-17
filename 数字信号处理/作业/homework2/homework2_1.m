Dt = 0.1; 
t = -10:Dt:10;
f = 0.*(t < -pi) + 0.5*(1 + cos(t)).*(t >= -pi & t <= pi) + 0.*(t > pi); % �ֶκ����������޷���ʾ�����������������-10��10����
subplot(2,1,1);
plot(t,f);
xlabel('t');
ylabel('f(t)');
title('f(t) = 1/2 * (1 + cos(t) )');
w = linspace(-2*pi,2*pi,1000); % [-2pi,2pi]֮���Ƶ������ָ�Ϊ1000��
%���������Ƶ�ʲ��ܸ���4*pi���ο�˹���ʣ�
%�������ڲ���С��1/(4*pi)������Ĳ���������0.1������������
X = f*exp(-1j*t'*w)*Dt; %����Ҷ�任
subplot(2,1,2);
plot(w,X);
xlabel('��');
ylabel('X(j��)');
title('frequency spectrum');







