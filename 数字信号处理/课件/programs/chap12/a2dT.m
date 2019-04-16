function beq = a2dT(d,n)
% BEQ = A2DT(D, N) generates the decimal
% equivalent beq of the binary representation
% of a decimal number D with N bits for the
% magnitude part obtained by truncation
%
m = 1; d1 = abs(d);
while fix(d1) > 0
    d1 = abs(d)/(2^m);
    m = m+1;
end
beq = fix(d1*2^n);
beq = sign(d).*beq.*2^(m-n-1);