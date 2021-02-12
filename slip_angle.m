%% SLIP ANGLE
WD_f = 333    %wheelbase front (weight dist)
WD_r = 333    %wheelbase rear (weight dist)
T = 333     %Track
v_y = 333   %velocity y-component
v_x = 333   %velocity x-component
y_v = 333   %yaw velocity
s = 333     %steering angle

%% slip angle (with yaw v) - front left tyre
slip_angle = s - atan((v_y + y_v*WD_f)/(v_x - y_v*(T/2)))

%% slip angle (without yaw y) - front left tyre
slip_angle = s - atan(v_y/v_x)