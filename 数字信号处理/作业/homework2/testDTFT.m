function [] = testDTFT(xn,n,N)
    figure(3);
    x1 = [0,0,0,1,0,0,0];
    w=[-800:1:800]*4*pi/800;     %Ƶ��-800----+800 �ĳ��ȣ���Ӧ�������Ƶ�������٣���ʡȥ��    
    w =[-N/2:1:N/2]*4*pi*2/N;
    X=x1*exp(-j*(n'*w));         %��dtft�任������ԭʼ����ķ������Ը�ָ��������Ͷ���
    subplot(211)
    stem(n,xn);
    title('ԭʼ�ź�(ָ���ź�)');
    subplot(212);
    plot(w/pi,abs(X));
    title('DTFT�任')
end







