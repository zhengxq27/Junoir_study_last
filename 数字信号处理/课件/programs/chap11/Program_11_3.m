% Program 11_3
% Illustration of Cascade Realization of IIR Filters
% and Structure Verification
%
format long
x = [1 zeros(1,6)];
b1 = 0.0662272*[1 1];
a1 = [1 -0.2593284];
y1 = filter(b1,a1,x,0);
si = [0 0];
b2 = [1 2 1];
a2 = [1 -0.6762858 0.3917468];
y2 = filter(b2,a2,y1,si);
[p,d] = strucver(y2,3);
disp('Actual numerator coefficients are ');disp(p');
disp('Actual denominator coefficients are ');disp(d');