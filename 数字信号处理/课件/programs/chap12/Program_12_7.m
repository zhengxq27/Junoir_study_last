% Program 12_7
% Granular Limit Cycles in First-Order IIR Filter
%
clf;
alpha = input('Type in the filter coefficient = ');
yi = input('Type in the initial condition = ');
x = input('Type in the value of x[0] = ');
for n = 1:21
    y(n) = a2dR(alpha*yi,5) + x;
    yi = y(n); x = 0;
end
k = 0:20;
stem(k,y)
ylabel('Amplitude'); xlabel('Time index n');
title(['\alpha = ' num2str(alpha)]);