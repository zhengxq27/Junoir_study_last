function beq = a2dR(d,n)
% BEQ = A2DR(D, N) generates the decimal
% equivalent beq of the binary representation
% of a decimal number D with N bits for the
% magnitude part obtained by rounding
%
m = 1; d1 = abs(d);
while fix(d1) > 0
    d1 = abs(d)/(2^m);
    m = m+1;
end
beq = fix(d1*2^n+.5);
beq = sign(d).*beq.*2^(m-n-1);