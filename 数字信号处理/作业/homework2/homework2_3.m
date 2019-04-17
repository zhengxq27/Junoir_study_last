Dt = 0.1; 
t = -10:Dt:10;
f = 0.*(t < -pi) + 0.5*(1 + cos(t)).*(t >= -pi & t <= pi) + 0.*(t > pi); % �ֶκ����������޷���ʾ�����������������-10��10����
%���Ϲ���Ϊ����ԭʼ�ź�
w = linspace(-2*pi,2*pi,1000); % [-2pi,2pi]֮���Ƶ������ָ�Ϊ1000��
X = f*exp(-1j*t'*w)*Dt; %����Ҷ�任��t'��ÿ������ʱ�����0.0001���㹻С�����ǽ�����Ϊ��ʱ�������ڻ���

T1 = 2; %��������
tn1 = -10:T1:10;
f1 = 0.*(tn1 < -pi) + 0.5*(1 + cos(tn1)).*(tn1 >= -pi & tn1 <= pi) + 0.*(tn1 > pi);
X1 = f1*exp(-1j*tn1'*w); 
subplot(3,1,1);
plot(w,X1);
xlabel('��');
ylabel('X1(j��)');
title('�����źŵ�Ƶ��');

X2 = 0.*(w < -2.4) + X1.*(w >= -2.4 & w <= 2.4) + 0.*(w >2.4);
subplot(3,1,2);
plot(w,X2);
xlabel('��');
ylabel('X2(j��)');
title('�˲�֮���Ƶ��');

%����Ҷ��任
t1 = linspace(-10,10,1000);
w1 = linspace(-pi,pi,1000);
fr = (0.5/pi)*X2*exp(1j*t1'*w1)*(0.002*pi);
subplot(3,1,3);
plot(t1,fr);
xlabel('t');
ylabel('f(t)');
title('�ؽ��ź����ʼ�źŵıȽ�');
hold on;
plot(t,f);
legend('reconstructed','original');







