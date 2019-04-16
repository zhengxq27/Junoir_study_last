function [p,d] = strucver(ir,N)
H = zeros(2*N+1,N+1);
H(:,1) = ir';
for n = 2:N+1;
    H(:,n) = [zeros(1,n-1) ir(1:2*(N+1)-n)]';
end
H1 = zeros(N+1,N+1);
for k = 1:N+1;
    H1(k,:) = H(k,:);
end
H3 = zeros(N,N+1);
for k = 1:N;
    H3(k,:) = H(k+N+1,:);
end
H2 = H3(:,2:N+1);
hf = H3(:,1);
% Compute the denominator coefficients
d = -(inv(H2))*hf;
% Compute the numerator coefficients
p = H1*[1;d];
d = [1; d];