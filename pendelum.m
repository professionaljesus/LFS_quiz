syms alpha

l = 0.3
r = l*sind(alpha/2)5/
v = 2*r*pi*100/60
m = 1
g = 9.81

eq = m*v^2 / r / sind(alpha/2) == m*g/cosd(alpha/2)

double(solve(eq, alpha))
