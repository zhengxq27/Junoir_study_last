% Program 11_9
% Simulation of FIR Cascaded Lattice Structure
% 
%disp('special cases not supported for now')
delta = input('Type in the lattice coefficients (delta) = ');
gamma = input('Type in the lattice coefficients (gamma)= ');
x = zeros(length(delta)+1,2+length(delta));
y = zeros(length(delta)+1,2+length(delta));
x(1,2)=1*delta(1);
y(1,2)=1*gamma(1);

for i = 2:length(delta)+2
    for j = 2:length(delta)
        x(j,i)=x(j-1,i)+delta(j)*y(j-1,i-1);
        y(j,i)=y(j-1,i-1)+gamma(j)*x(j-1,i);
    end
end
disp('Coefficients of H(z)');disp(x(length(delta),2:length(delta)+1));
disp('Coefficients of G(z)');disp(y(length(delta),2:length(delta)+1));