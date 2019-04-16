% Program 12_5
% Computation of Approximate Output round-off Noise
%
num = input('Numerator coefficients = ');
den = input('Denominator coefficients = ');
x = 1;
order = max(length(num),length(den))-1;
si = [zeros(1,order)];
varnew = 0; k = 1;
while k > 0.000001
   [y,sf] = filter(num,den,x,si);
   si = sf;
   varold = varnew;
   varnew = varnew + abs(y)*abs(y);
   k = varnew - varold;
   x = 0;
end
disp('Output Noise Variance = ');disp(varnew)