%% Outer back tire skidpad
m = 220
%lift
cl = 3.8
A = 1
%Rho
p = 1.1
%wheellenght
L = 1.53
%trackwidth
t = 1.2
cgh = 0.2
g = 9.81
r = 9.125
mu = 1.4

syms v
eq = mu*(m*g + cl*p*0.5*A*v^2) == m*v^2/r;
v = double(solve(eq,v))
v = v(2)
ay = v^2/r

Fout = m*g/4 + p * A * cl * v^2 / 8 + ay * cgh * m / (2*t) 




