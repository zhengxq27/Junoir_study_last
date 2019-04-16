% Program 12_4
%  Computation of the Output Noise Variance Due
%  to Input Quantization of a Digital Filter
%  Based on a Partial-Fraction Approach
%
num = input('Type in the numerator = ');
den = input('Type in the denominator = ');
[r,p,K] = residue(num,den); % partial fraction expansion
R = size(r,1);
R2 = size(K,1);
     if R2 > 1
        disp('Cannot continue...');
        return;
     end

     if R2 == 1
        nvar = K^2;
     else
        nvar = 0;
     end
% Compute output noise variance
for k = 1:R,
     for m = 1:R,
        integral = r(k)*conj(r(m))/(1-p(k)*conj(p(m)));
        nvar = nvar + integral;
     end
end
disp('Normalized Output Noise Variance = ');disp(real(nvar))