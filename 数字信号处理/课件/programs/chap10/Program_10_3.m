% Program 10_3
% Design of a minimum-phase lowpass FIR filter
%
Wp = 0.45; Ws = 0.6; Rp = 2; Rs = 26;
% Desired ripple values of minimum-phase filter
dp = 1- 10^(-Rp/20); ds = 10^(-Rs/20);
% Compute ripple values of prototype linear-phase filter
Ds = (ds*ds)/(2 - ds*ds);
Dp = (1 + Ds)*((dp + 1)*(dp + 1) - 1);
% Estimate filter order
[N,fpts,mag,wt] = firpmord([Wp Ws], [1 0], [Dp Ds]);
% Design the prototype linear-phase filter H(z)
[b,err,res] = firpm(N, fpts, mag, wt);
K = N/2;
b1 = b(1:K);
% Design the linear-phase filter G(z)
c = [b1 (b(K+1) + res.error(length(res.error))) fliplr(b1)]/(1+Ds);
zplane(c) % Plot the zeros of G(z)
pause
c1 = c(K+1:N+1);
[y, ssp, iter] = minphase(c1);
zplane(y) % Plot the zeros of the minimum-phase filter
pause
[hh,w] = freqz(y,1, 512);
% Plot the gain response of the minimum-phase filter
plot(w/pi, 20*log10(abs(hh)));grid
xlabel('\omega/\pi');ylabel('Gain, dB');