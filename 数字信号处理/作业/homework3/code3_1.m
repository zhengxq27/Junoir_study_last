%������Ŀ�и����Ĳ���
fs = 15/(2*pi);
rp = 0.3; %ͨ�����˥��
as = 40; %������˥��
T = 1 / fs; %��������
ws = 5/fs; % �����ֹƵ��
wp = 3/fs; % ͨ����ֹƵ��

c = [3.32,3,11,5,56]*pi;
wc = (ws*wp)/2;
delt_w = ws - wp;

% Kaiser��
n4 = ceil((as-8)/delt_w*2.285);
m4 = (n4 - 1)/2;
b = 0.5842*(as-21)^0.4 + 0.07886*(as-21);
win4 = kaiser(n4);
display(['Kaiser�����ɵĳ弤��Ӧϵ����','������N:',num2str(n4),')']);

n = -m4:m4;
ft = fir1(n4-1,wc/pi,win4);

subplot(1,2,1);
plot(n,ft);
title('ʵ�ʳ弤��Ӧ');
xlabel('n');
ylabel('ft');

[h,w] = freqz(ft,1,512);
W = w/pi;
H = 20*log10(abs(h));
subplot(1,2,2);
plot(W,H);
title('����ЧӦ');
xlabel(['pi(omega/omega','s)']);
ylabel('����(dB)');