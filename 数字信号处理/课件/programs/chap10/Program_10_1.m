% Program 10_1
% Estimation of FIR Filter Order Using firpmord
%
fedge = input('Type in the bandedges in Hz = ');
mval = input('Desired magnitude values in each band = ');
dev = input('Allowable deviation in each band = ');
FT = input('Type in the sampling frequency in Hz = ');
[N, fpts, mag, wt] = firpmord(fedge, mval, dev, FT);
fprintf('Filter order is %d \n',N);