% Program 12_6
% Illustration of Scaling & Round-Off Noise Calculation
%
format long
k1 = sqrt(1.07210002757252);
k2 = sqrt(0.02679820762398);
k3 = sqrt(11.96975400608943);
x1 = 1/k1;
si1 = 0;
si2 = [0 0];
b1 = 1;
varnew = 0; k = 1;
while k > 0.000001
   y1 = 0.2593284*si1 + x1;
   x2 = (0.0662272/k2)*(y1 + si1);
   si1 = y1;
   y2 = 0.6762858*si2(1) - 0.3917468*si2(2) + x2;
   y3 = (y2 + 2*si2(1) + si2(2))/k3;
   si2(2) = si2(1); si2(1) = y2;
   varold = varnew;
   varnew = varnew + abs(y3)*abs(y3);
   % Compute approximate L2 norm square
   k = varnew - varold;
   x1 = 0;
end
disp('L2 norm square = ');disp(varnew);