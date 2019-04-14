Dt = 0.0001; 
t = -10:Dt:10;
f = 0.*(t < -pi) + 0.5*(1 + cos(t)).*(t >= -pi & t <= pi) + 0.*(t > pi); % �ֶκ����������޷���ʾ�����������������-10��10����
plot(t,f);
xlabel('t');
ylabel('f(t)');
title('the comparsion of original siginal and the reconstructed signal');
hold;

T = 1; %��������Ϊ1
tn = -10:T:10;
f1 = 0.*(tn < -pi) + 0.5*(1 + cos(tn)).*(tn >= -pi & tn <= pi) + 0.*(tn > pi); %���ɳ����ź�
n = -10/T : 10/T;
fs = 1/T; %����Ƶ��

T_N = ones(length(n),1) * tn - n'*T*ones(1,length(tn));
xa = f1*sinc(fs*T_N);
plot(tn,xa);
legend('original signal','reconstructed signal');





