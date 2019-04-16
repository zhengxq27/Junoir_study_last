%Program_6_7
% Stability Test
%
num = input('Type in the numerator vector = ');
den = input('Type in the denominator vector = ');
N = max(length(num),length(den));
x = 1; y0 = 0; S = 0;zi = zeros(1,N-1);
for n = 1:1000
    [y,zf] = filter(num,den,x,zi);
    if abs(y) < 0.000001, break, end
    x = 0;
    S = S + abs(y);
    y0 = y;zi = zf;
end

if n < 1000
    disp('Stable Transfer Function');
else
    disp('Unstable Transfer Function');
end