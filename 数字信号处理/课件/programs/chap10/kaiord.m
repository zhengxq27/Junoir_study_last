function[N] = kaiord(dp, ds, Fp, Fs, FT);
num = -20*log10(sqrt(dp*ds))-13;
den = 14.6*(Fs - Fp)/FT;
N = ceil(num/den);