% Program 11_5
% Illustration of Overlap-Add Filtering Approach
%
k = 1:50;
w1 = 0.8*pi; w2 = 0.1*pi;
A = 1.5;B = 2.0;
x1 = A*cos(w1*(k-1)); x2 = B*cos(w2*(k-1));
x = x1+x2;
xs = zeros(10,5);
xs(:) = x;
si = [0 0 0];
b = 0.0662272*[1 3 3 1];
a = [1 -0.9356142 0.5671269 -0.10159107];
for n = 1:5
   for m = 1:10
 [ys(m,n),sf] = filter(b,a,xs(m,n),si);
 si = sf;
   end
end
y = ys(:);
stem(k-1,y);
xlabel('Time index n'); ylabel('Amplitude');
title('Output Sequence');