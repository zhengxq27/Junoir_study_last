function y = circonv(x1, x2)
% Develops a sequence y obtained by the circular
% convolution of two equal-length sequences x1 and x2
L1 = length(x1);
L2 = length(x2);
if L1 ~= L2, error('Sequences of unequal length'), end
y = zeros(1,L1);
x2tr = [x2(1) x2(L2:-1:2)];
for k = 1:L1,
    sh = circshift(x2tr', k-1)';
    h = x1.*sh;
    disp(sh);
    y(k) = sum(h);
end