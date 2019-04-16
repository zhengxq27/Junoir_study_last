%When executed, the program asks the user to enter the coefficients of the
% transfer function pair in ascending order. After execition it returns the 
% lattice coefficients delta and gamma:
%[delta,gamma] = latc2tfpair;
%It also displays the lattice coefficients in the command window

function [H,G] = latc2tfpair(del,gamma,splcase)

% del = input('Enter the lattice coefficients delta: ');
% gamma = input('Enter the lattice coefficients gamma: ');
% splcase = input('Enter the type of special case if applicable, or enter a vector of 0's with the same length of lattice coefficients: ');


%Initialize the reverse calculation of the transfer functions from the
%lattice multiplier coefficients
Hrev(length(del),length(del)) = 0;
Grev(length(del),length(del)) = 0;

Hrev(1,1) = del(1);
Grev(1,1) = gamma(1);
N = length(del)-1;
%Recursion to find the transfer functions from the lattice multiplier coefficients
%for different cases
for k = 2:(N+1)
    if (splcase(k) == 1) || (splcase(k) == 2) || (splcase(k) == 3)
        Grev(k,:) = Hrev(k-1,:) + del(k)*[0 Grev(k-1,1:length(del)-1)];
        Hrev(k,:) = gamma(k)*Hrev(k-1,:) + [0 Grev(k-1,1:length(del)-1)];
    else
        Hrev(k,:) = Hrev(k-1,:) + del(k)*[0 Grev(k-1,1:length(del)-1)];
        Grev(k,:) = gamma(k)*Hrev(k-1,:) + [0 Grev(k-1,1:length(del)-1)];
    end
    
    %In case #4, H+1 has been synthesized but we need H
    if splcase(k) == 4
        Hrev(k,1) = Hrev(k,1)-1;
    end

end


H = Hrev(length(del),:);
G = Grev(length(del),:);
