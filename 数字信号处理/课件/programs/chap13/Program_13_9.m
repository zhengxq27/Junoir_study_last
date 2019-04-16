    % Program 13_9
    % IIR Lowpass Half-band Filter Design
    close all; clear all;
    % Enter filter stopband specifications
    ws = input('Normalized stopband angular frequency = ');
    ws = ws*pi; wp = pi - ws;
    delta_s = input('Stopband ripple = ');
    % Order estimation
    r = tan(0.5*wp)/tan(0.5*ws);
    r_hat = sqrt(1-(r^2));
    q0 = 0.5*(1-sqrt(r_hat))/(1+sqrt(r_hat));
    q = q0+2*(q0^5)+15*(q0^9)+150*(q0^13);
    D = ((1-(delta_s^2))/(delta_s^2))^2;
    N = ceil((log10(16*D))/(log10(1/q)));
    if (mod(N,2) == 0)
        N = N+1;
    end;
    % Readjusting ripple size
    D = (1/16)*(10^(N*log10(1/q)));
    delta_s = sqrt(1/(1+sqrt(D)));
    % Computing filter coefficients
    for k = 1:(N-1)/2,
        sum1 = 0;sum2 = 0;
        for i = 0:6,
            sum1 = sum1+((-1)^i)*(q^(i*(i+1)))*sin((2*i+1)*k*pi/N);
            if (i ~= 0)
            sum2 = sum2+((-1)^i)*(q^(i^2))*cos(2*pi*k*i/N);
            end;
        end;
        lambda(k) = (2*q^(0.25)*sum1)/(1+2*sum2);
        b(k) = sqrt((1-r*(lambda(k)^2))*(1-(lambda(k)^2)/r));
        c(k) = (2*b(k))/(1+(lambda(k)^2));
        alpha(k) = (2-c(k))/(2+c(k));
    end;
    alpha = sort(alpha);
    % Determine transfer function
    d0(1) = 1;d1(1)=1; for i = 1:2:(N-1)/2,
    d0 = conv(d0,[1 alpha(i)]);
    if (i ~= (N-1)/2)
        d1 = conv(d1,[1 alpha(i+1)]);
    end;
    end;
    % lowpass elliptic filter transfer function
    a0_num = zeros(1,2*length(fliplr(d0)));
    a0_num([1:2:length(a0_num)]) = fliplr(d0);
    a0_den = zeros(1,2*length(d0));
    a0_den([1:2:length(a0_den)]) = d0;
    a1_num = zeros(1,2*length(fliplr(d1)));
    a1_num([1:2:length(a1_num)]) = fliplr(d1);
    a1_den = zeros(1,2*length(d1));
    a1_den([1:2:length(a1_den)]) = d1;
    G0z_num = 0.5*([conv(a0_num,a1_den) 0]+[0 conv(a1_num,a0_den)]);
    G0z_den = conv(a0_den,a1_den);
    zplane(G0z_num,G0z_den);
    title('The pole-zero plot');
    pause
    [G0z,w] = freqz(G0z_num,G0z_den,512);
    plot(w/pi,20*log10(abs(G0z))); % Plot the gain response    
    axis([0 1 -80 5]);
    grid on; xlabel('\omega/\pi'); ylabel('Gain, dB');
    title('Gain response of the lowpass IIR half-band filter');