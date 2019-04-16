% Symbolic Analysis of Digital Filter Structure
% The input and the output nodes have to be specified
% as the 3rd and 4th argument.
% Design and copyright: Dr Hugo Tassignon
%
function [Num,Den] = sym_di_f(delay,mult,in_node,out_node);
clc
% Number of rows in mult & delay
Sm = size(mult,1); Sd = size(delay,1);
max_node = max(max(mult(:,1:2)));
% Fill in the system matrix with the constants for the
% multipliers and the delay elements. The number of delays
% determines the order of the system: (Sd+1)
for k = 1:Sd+1,
    T = eye(max_node);
    z_1(k) = exp(-j*(k-1)*2*pi/(Sd+1));
        for n1 = 1:Sm,
            m = mult(n1,2);
            n = mult(n1,1);
            T(m,n) = -mult(n1,3);
        end
        for n2 = 1:Sd,
            m = delay(n2,2);
            n = delay(n2,1);
            T(m,n) = T(m,n)-z_1(k);
        end
    D(k) = det(T);
    T_1 = inv(T);
    V_Sd = T_1(out_node,in_node);
    N(k) = V_Sd*D(k);
end
%
Num = real(ifft(N))
Den = real(ifft(D))