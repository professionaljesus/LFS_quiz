function [FzFL,FzFR,FzRL,FzRR]=wtt(Ay,Ax0, g, w_f, w_r, cgh, tlltd, wb, t_f, t_r, clA, cp_f, v, mass)
    
df    =  clA*0.5*1.225*v^2;        %Downforce
wt_f  = (Ay*g*cgh*w_f)/t_f;        %Front w.t. due to lat. g
wt_r  = (Ay*g*cgh*w_r)/t_r;        %Rear w.t. due to lat. g
wt_ay =  wt_f+wt_r;                %Total w.t. due to lat. g

wt_ax = (Ax0*cgh*mass*g)/wb;       %W.t. due to throttle

%Wheel loads with w.t. and tlltd

FzFR = (w_f*g/2) + wt_ay*tlltd + (df*cp_f/2) - wt_ax*0.5;         %Front right
FzFL = (w_f*g/2) - wt_ay*tlltd + (df*cp_f/2) - wt_ax*0.5;         %Front left
FzRR = (w_r*g/2) + wt_ay*(1-tlltd) + (df*(1-cp_f)/2) + wt_ax*0.5; %Rear right
FzRL = (w_r*g/2) - wt_ay*(1-tlltd) + (df*(1-cp_f)/2) + wt_ax*0.5; %Rear left

%Fz=0 if wheel has lost contact with the road
if FzFL<0
    FzFL=0;
end
if FzFR<0
    FzFR=0;
end
if FzRL<0
    FzRL=0;
end
if FzRR<0
    FzRR=0;
end

end