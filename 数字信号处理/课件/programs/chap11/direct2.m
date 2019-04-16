function [y,sf] = direct2(p,d,x,si);
% Y = DIRECT2(P,D,X) filters input data vector X with
% the filter described by vectors P and D to create the
% filtered data Y.  The filter is a "Direct Form II"
% implementation of the difference equation:
% y(n) = p(1)*x(n) + p(2)*x(n-1) + ... + p(np+1)*x(n-np)
%           - d(2)*y(n-1) - ... - d(nd+1)*y(n-nd)
% [Y,SF] = DIRECT2(P,D,X,SI) gives access to initial and
% final conditions, SI and SF, of the delays.
dlen = length(d); plen = length(p);
N = max(dlen,plen); M =length(x);
sf = zeros(1,N-1); y = zeros(1,M);
if nargin ~= 3,
    sf = si;
end
if dlen < plen,
    d = [d zeros(1,plen - dlen)];
else
    p = [pzeros(1, dlen - plen)];
end
p = p/d(1);
d = d/d(1);
for n = 1:M;
    wnew = [1 -d(2:N)]*[x(n) sf]';
    K = [wnew sf];
    y(n) = K*p';
    sf = [wnew sf(1:N-2)];
end