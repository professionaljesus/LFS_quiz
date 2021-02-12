syms ay bx by
f1 = 575
f2 = 285
a = 0.125
alp = 12.5

eq1 = f2*cosd(alp) + bx == 0
eq2 = f2*sind(alp) - f1 + by + ay == 0
eq3 = f2*cosd(alp)*a + f1*a - 2*a*by + 2*a*bx == 0

sol = solve([eq1 eq2 eq3], [ay,bx,by])

ans = sqrt(sol.by^2 + sol.bx^2)
double(ans)