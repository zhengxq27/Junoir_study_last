function [Y] = haar_1D(X)
% Computes the Haar transform of the input vector X
% The length of X must be a power-of-2
% Recursively builds the Haar matrix H
v = log2(length(X)) - 1;
H = [1 1;1 -1];
for m = 1:v,
A = [kron(H,[1 1]);
2^(m/2).*kron(eye(2^m),[1 -1])];
H = A;
end
Y = H*double(X(:));