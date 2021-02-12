x1 = 0.1
x2 = 0.25
x3 = 0.275
w = 0.125
lt = 0.400
m = 2
q = 0.5
a = 30

x_c = [x1, x1 + x3 + lt*cosd(a)]
y_c = [w/2, w/2 + lt*sind(a)]
masses = [m, 0.5*lt]


x = x_c*masses';
x = x/sum(masses);
y = y_c*masses';
y = y/sum(masses);

f = @(x) w - w/(x1 + x2) * x

f(x)
y





