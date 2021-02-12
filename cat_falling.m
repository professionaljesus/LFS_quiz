syms t

A = 0.04;
rho = 1.2;
cw = 0.8;
m = 1.5;
g = 9.8;

eqn = t^2*g/2 - cw*rho*A*g^2*t^4/(2*3*4*m) == 15;

double(solve(eqn,t))