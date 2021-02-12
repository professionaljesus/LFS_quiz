%% LFS 2021 Quiz

%% DYNAMIC EVENTS SCORE



%% ACCELERATION EV
close all; clc; clear all

T_best_uncorrected = 12; %b?sta lagets b?sta tid av 4 f?rs?k (b?sta tiden inklusive DOO)
DOO_best = 12; % antal koner
%OC = DNF (off course => did not finish)
T_best = T_best_uncorrected + 2*DOO_best;

T_max = T_best * 1.5;

T_team_uncorrected = 12;
DOO_team = 12; %antal koner
%OC = DNF
T_team = T_team_uncorrected + 2*DOO_team;

acc_score = 3.5;

if(T_team < T_max)
    acc_score = 71.5 * ((T_max/T_team)-1)/0.5
end

%% ACCELERATION DV
close all; clc; clear all

T_best_uncorrected = 12; %b?sta lagets b?sta tid av 4 f?rs?k 
DOO_best = 12; % antal koner
%OC = DNF (off course => did not finish)
T_best = T_best_uncorrected + 2*DOO_best;

T_max = T_best * 2;

T_team_uncorrected = 12; %v?r b?sta tid 
DOO_team = 12; %antal koner
%OC = DNF
T_team = T_team_uncorrected + 2*DOO_team;

if(T_team < T_max)
    acc_score = 71.5 * ((T_max/T_team)-1) + 3.5
else
    acc_score = 3.5
end

%% SKIDPAD EV
close all; clc; clear all
%the time T is the average of the timed runs on the right and left side

T_best_uncorrected = 12;
DOO_best = 12; %antal koner
%OC = DNF
T_best = T_best_uncorrected + 0.2*DOO_best;

T_max = T_best * 1.25;

T_team_uncorrected = 12;
DOO_team = 12; %antal koner
%OC = DNF
T_team = T_team_uncorrected + 0.2*DOO_team;


if(T_team < T_max)
    Skid_score = (71.5 * (((T_max/T_team)^2-1)/0.5625)) + 3.5
else
    Skid_score = 3.5
end

%% SKIDPAD DV
close all; clc; clear all
%the time T is the average of the timed runs on the right and left side

T_best_uncorrected = 12;
DOO_best = 12; %antal koner
%OC = DNF
T_best = T_best_uncorrected + 0.2*DOO_best;

T_max = T_best * 1.5;

T_team_uncorrected = 12;
DOO_team = 12; %antal koner
%OC = DNF
T_team = T_team_uncorrected + 0.2*DOO_team;


if(T_team < T_max)
    Skid_score = (71.5 * (((T_max/T_team)^2-1)/1.25)) + 3.5
else
    Skid_score = 3.5
end

%% AUTOCROSS EV
close all; clc; clear all

T_best_uncorrected = 12;
DOO_best = 12;  %antal koner
OC_best = 12;    %antal off courses
T_best = T_best_uncorrected + 2*DOO_best + 10*OC_best;

T_max = T_best * 1.25;

T_team_uncorrected = 12;
DOO_team = 12; %antal koner
OC_team = 12; %antal off courses 
T_team = T_team_uncorrected + 2*DOO_team + 10*OC_team;

if(T_team < T_max)
    autoX_score =  95.5 * ((T_max/T_team)-1)/0.25 + 4.5
else
    autoX_score = 4.5
end

%% AUTOCROSS DV
close all; clc; clear all

T_best_uncorrected = 12;
DOO_best = 12;  %antal koner
OC_best = 12;    %antadl off courses
T_best = T_best_uncorrected + 2*DOO_best + 10*OC_best;

T_max = 12; %the time for driving the lap with 4 m/s

T_i = [12 12]; %tid per run
DOO_team = [12 12]; %antal koner per run
OC_team = [12 12]; %antal off courses per run
T_team = zeros(1,length(T_i));
for i = 1: length(T_i)
    T_team(i) = T_i(i) + 2*DOO_team(i) + 10*OC_team(i);
end


autoX_score = zeros(1,length(T_team));
for i = 1:length(T_team) 
    if(T_team(i) < T_max)
        autoX_score(i) =  90 * ((T_max-T_team(i))/(T_max-T_min));
    end
end

autoX_score = autoX_score(autoX_score~=0);

if (isempty(autoX_score))
    autoX_score = 10
else
    autoX_score = max(autoX_score(1), mean(autoX_score))
end

%% ENDURANCE
close all; clc; clear all

T_best_uncorrected = 12; %Gl?m ej multiplicera med 60 om givet i minuter
DOO_best = 12; %antal koner
OC_best = 12; %antar off courses
T_best_corrected = T_best_uncorrected + 2*DOO_best + 10*OC_best;

T_max = T_best_corrected * 1.333;

T_team_uncorrected = 12; %Gl?m ej multiplicera med 60 om givet i min
DOO_team = 12; %antal koner
OC_team = 12; %antal off courses 
T_team_corrected = T_team_uncorrected + 2*DOO_team + 10*OC_team;

if T_team_corrected < T_max
    Endurance_score = 300 * ((T_max/T_team_corrected)-1)/0.333 + 25
    Endurance_score_minus25 = Endurance_score - 25 %Ibland gl?mmer de att man egentligen f?r 25p f?r att klara endurance..
else
    Endurance_score = 25
end  


%% Efficiency EV
close all; clc; clear all;

%Tider utan p?l?gg tidsp?l?gg f?r t.ex. DOO elr. OC fr?n Endurance:

T_team_uncorrected = 12;    %Gl?m ej multiplicera med 60 om givet i minuter
T_best_uncorrected = 12;    %Gl?m ej multiplicera med 60 om givet i minuter

%used energy is calculated at the integral of voltage*current dt, the
%values are mesaured during the drive (regeneradet energy is multiplied p?
%0.9 and subracted from the result (D.7.10.2)

EN_team = 0.85; %the teams corrected used energy
EN_min = 0.48; %the lowest corrected used energy of all teams 

E_team = (T_best_uncorrected * EN_min^2) / (T_team_uncorrected * EN_team^2);
E_max = 0.85; %the highest efficiency factor of all teams who are able to score in efficiency

if T_team_uncorrected/T_best_uncorrected > 1.333
    Efficiency_Score = 0    
    
else 
    Efficiency_Score = 100 * ((0.1/E_team - 1) / (0.1/E_max - 1))   
    
end

%% Efficiency DV
%Tider utan p?l?gg tidsp?l?gg f?r t.ex. DOO elr. OC fr?n track drive:
%scored for the run with highest trackdrive score

T_team_uncorrected = 12;    %Gl?m ej multiplicera med 60 om givet i minuter
T_best_uncorrected = 12;    %Gl?m ej multiplicera med 60 om givet i minuter

%used energy is calculated at the integral of voltage*current dt, the
%values are mesaured during the drive (regeneradet energy is multiplied p?
%0.9 and subracted from the result (D.7.10.2)

EN_team = 0.85; %the teams corrected used energy
EN_min = 0.48; %the lowest corrected used energy of all teams 


E_team = (T_best_uncorrected * EN_min^2) / (T_team_uncorrected * EN_team^2);
E_max = 0.85; %the highest efficiency factor of all teams who are able to score in efficiency


if T_team_uncorrected/T_best_uncorrected > 2
    Efficiency_Score = 0    
    
else 
    Efficiency_Score = 75 * ((0.1/E_team - 1) / (0.1/E_max - 1))   
    
end

%% TrackDrive DV

T_best_uncorrected = 12;
DOO_best = 12;  %antal koner
OC_best = 12;    %antal off courses
T_best = T_best_uncorrected + 2*DOO_best + 10*OC_best;

T_max = T_best * 2;

T_team_uncorrected = 12;
DOO_team = 12; %antal koner
OC_team = 12; %antal off courses 
USS_team = 0; %1 if unsafe stop
T_team = T_team_uncorrected + 2*DOO_team + 10*OC_team;
completed_laps = 0; %number of completed laps

T_D_score=0;
if T_team < T_max
    T_D_score = 150 * ( T_max / T_team - 1);
    if USS_team
        T_D_score = T_D_score + 1;
    end
end

T_D_score = T_D_score + completed_laps*5

%% VEHICLE DYNAMICS


%% SLIP ANGLE
WB_f = 333    %wheelbase front (weight dist)
WB_r = 333    %wheelbase rear (weight dist)
T = 333     %Track
v_y = 333   %velocity y-component
v_x = 333   %velocity x-component
y_v = 333   %yaw velocity
s = 333     %steering angle

%% slip angle (with yaw v) - front left tyre
slip_angle = s - atan((v_y + y_v*WB_f)/(v_x - y_v*(T/2)))

%% slip angle (without yaw y) - front left tyre
slip_angle = s - atan(v_y/v_x)

%% CRITICALLY DAMPED AND NATURAL FREQ

C = 333        %damper koeff
R = 333      %damping ratio
K_s = 333      %spring constant
K_t = 333       %spring constant tire
m_unsprung = 333        %mass unsprung
m_c = 333               %mass chassi
m_whole = 333       %mass whole car
omega = 333     %natural freq

%% natural frequency sprung mass
omega_chassi = sqrt(K_s*m_c)

%% Natural frequency wheel (wheel hop freq)
omega_unsprung = sqrt((K_t+K_s)/m_unsprung)

%% Damping ratio, with known C
ratio = 1/2 * (C/sqrt(K_s*m_c))

%% Damper koeff, with known R
koeff = R * 2 * sqrt(K_s*m_c)

%% Damper constant for critical damping 

damper_koeff = 2 * sqrt(m_whole*K_s)