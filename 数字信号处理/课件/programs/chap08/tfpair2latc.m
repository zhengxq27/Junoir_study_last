%When executed, the program asks the user to enter the transfer function
%pair. It passes back the lattice coefficients if used as follows:
%[delta,gamma] = fir_lat;
%It also displays the lattice coefficients in the command window along with
%the information relevant to special cases.

function [del,gamma,splcase] = tfpair2latc


HN = input('Enter the coefficients of H(z) in ascending powers of 1/z: ');
GN = input('Enter the coefficients of G(z) in ascending powers of 1/z: ');

%intiialize the coefficients to zero for speed
H(length(HN),length(HN)) = 0;
G(length(GN),length(GN)) = 0;

%the last row of the coefficient matrix is the given transfer function
%H(N)/G(N) 
H(length(HN),:) = HN;
G(length(GN),:) = GN;

%intialize delta and gamma arrays
N = length(HN) - 1;
del(N+1) = 0;
gamma(N+1) = 0;
K(N+1) = 0;

splcase(N+1) = 0;


%recursion as given in section 8.9.1 to find the reflection coefficitents
%for different cases
for i = N+1:-1:2        
    if AlmostEqual(H(i,i)*G(i,1), G(i,i)*H(i,1))    %H(i,i)*G(i,1) == G(i,i)*H(i,1)
        splcase(i) = 4;
        H(i,1) = H(i,1) + 1;
    end
    if (~AlmostEqual(H(i,1), 0) && ~AlmostEqual(G(i,i), 0)) && ~(AlmostEqual(H(i,i)*G(i,1), G(i,i)*H(i,1)))  %(H(i,1) && G(i,i) ~= 0) && (H(i,i)*G(i,1) ~= G(i,i)*H(i,1))
        del(i) = H(i,i)/G(i,i);
        gamma(i) = G(i,1)/H(i,1);
        K(i) = 1/(1-del(i)*gamma(i));
        H(i-1,:) = K(i)*(H(i,:) - del(i)*G(i,:));
        G(i-1,:) = [K(i)*(G(i,2:length(G)) - gamma(i)*H(i,2:length(H))) 0];
    elseif AlmostEqual(H(i,1), 0) || AlmostEqual(G(i,i), 0) %and(H(i,1),G(i,i)) == 0
        if AlmostEqual(H(i,1), 0) && AlmostEqual(G(i,i), 0) %H(i,1) == 0 && G(i,i) == 0
            splcase(i) = 3;
        elseif AlmostEqual(G(i,i), 0) %G(i,i) == 0
            splcase(i) = 1;
        elseif AlmostEqual(H(i,1), 0) %H(i,1) == 0
            splcase(i) = 2;
        end
        del(i) = G(i,i)/H(i,i);
        gamma(i) = H(i,1)/G(i,1);
        K(i) = 1/(1-del(i)*gamma(i));
        H(i-1,:) = K(i)*(G(i,:) - del(i)*H(i,:));
        G(i-1,:) = [K(i)*(H(i,2:length(G)) - gamma(i)*G(i,2:length(H))) 0];
    end
end

del(1) = H(1,1);
gamma(1) = G(1,1);
splcase(1) = 0;




function IfEqual = AlmostEqual(A, B)
%define maximum allowed absolute error for equality
MaxErr = 100*eps;

IfEqual = abs(A - B) <= MaxErr;
    