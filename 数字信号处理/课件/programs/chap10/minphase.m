function [y,ssp,iter] = minphase(g);
% Extracts the minimum phase factor y from a linear-phase filter.
% Input: g = [g(0) g(1) . . . g(N)] (row vector) where
% the g vector is the right-half of a linear-phase FIR filter.
% Assumption: Unit-circle zeros of g are of even multiplicity.
% Copyright (c) January 2002 by H.J. Orchard and A.N. Willson, Jr.
% Initialize y (poly. with all zeros at z = 0)
y = [1 zeros(1,length(g)-1)];
ssp = realmax;% A large number (for previous norm)
ss = ssp/2;   % Smaller large no. (for current norm)
iter = 0; e = 0;  % Initialize iter. counter & correction vector
while ( ss < ssp)
    y = y + e'; ssp = ss;% Update y and move old norm(e) value
    iter = iter + 1; % Increment the iteration count
    AR = toeplitz([y(1),zeros(1, length(g)-1)], y);
    M = toeplitz([y(length(g)),zeros(1,length(g)-1)],fliplr(y));
    AL = fliplr(M);
    A = AL + AR;% Create the A matrix
    b = g' - AL*y'; % and the b vector
    e = A\b;% Solve Ae = b for the correction vector e
    ss = norm(e);   % Get norm to see if it is still decreasing
end;