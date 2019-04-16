% Program 12_8
% Illustration of Overflow Limit Cycles
%
a = input('alpha_1 and alpha_2 values = ');
yi1 = -0.625; yi2 = -0.125;
for n = 1:41;
    y(n) = - a(1)*yi1 - a(2)*yi2;
    y(n) = a2dR(y(n),3);
    yi2 = yi1; yi1 = y(n);
end
k = 0:40;
stem(k,y)
xlabel('Time index n');ylabel('Amplitude');
title(['\alpha_1 = ' num2str(a(1)),'\alpha_2 = ' num2str(a(2))]);