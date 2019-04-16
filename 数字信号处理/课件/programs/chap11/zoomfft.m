function [XF] = zoomfft(X,R,K,I)
% ZOOMFFT(X,R,K,I) computes K samples of the N-point of the
% vector X beginning with the I-th sample where N = R*K
%
N = R*K;
X = [X zeros(1,N - length(X))];
y = zeros(K,R);
for r = 1:R
    y(:,r) = X(r : R : N)';
end
Y = fft(y);
XF = zeros(1,K);
for n = I:I+K-1
    for r = 1:R
    XF(n-I+1) = XF(n-I+1) + exp(-i*(n-1)*(r-1)*2*pi/N)*Y(mod(n-1,K)+1,r);
    end
end