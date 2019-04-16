function[N] = bellangord(dp, ds, Fp, Fs, FT)
num = -2*log10(10*dp*ds);
den = 3*(Fs - Fp)/FT;
N = ceil(num/den)-1;