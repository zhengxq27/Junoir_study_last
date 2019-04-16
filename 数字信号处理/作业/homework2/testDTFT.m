function [] = testDTFT(xn,n,N)
    figure(3);
    x1 = [0,0,0,1,0,0,0];
    w=[-800:1:800]*4*pi/800;     %频域共-800----+800 的长度（本应是无穷，高频分量很少，故省去）    
    w =[-N/2:1:N/2]*4*pi*2/N;
    X=x1*exp(-j*(n'*w));         %求dtft变换，采用原始定义的方法，对复指数分量求和而得
    subplot(211)
    stem(n,xn);
    title('原始信号(指数信号)');
    subplot(212);
    plot(w/pi,abs(X));
    title('DTFT变换')
end







