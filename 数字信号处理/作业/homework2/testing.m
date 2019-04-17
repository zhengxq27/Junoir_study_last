Dt = 0.2; 
t = linspace(-100,100,1000); %����������0.2
f = cos(t);
%f = ones(1,length(t));
subplot(3,1,1);
plot(t,f);
xlabel('t');
ylabel('f(t)');
title('f(t) = cost');
% hold; %������ͼ
w = linspace(-2*pi,2*pi,1000); % [-2pi,2pi]֮���Ƶ������ָ�Ϊ200��
%���������Ƶ�ʲ��ܸ���4*pi���ο�˹���ʣ�
%�������ڲ���С��1/(4*pi)������Ĳ���������0.1������������

X = f*exp(-1j*t'*w)*Dt; %����Ҷ�任
subplot(3,1,2);
plot(w,abs(X));
xlabel('��');
ylabel('X(j��)');
title('������');
subplot(3,1,3);
plot(w,angle(X));
title('��λ��');



