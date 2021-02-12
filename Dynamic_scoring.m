clc
clear all

%DYNAMIC SCORING

%% SKIDPAD SCORING 
%300
clc
clear
%laptime WITHOUT penalties 
T_fastest = 0;           %Time for the fastest run ever 
T_team = 0;            %Time for the fastest run for our TEAM

%Penalties 
fastest_cones = 0;
team_cones = 0;
DNF = 0;                   % DNF, DQ or OC, 1 if true (1 if all runs are DNF)

Tteam = (T_team + 0.2*team_cones);
Tmax= 1.25*(T_fastest + 0.2*fastest_cones);

%PLUS 3.5 PO??NG om man klarar ett varv utan DNF eller DQ
SKIDPAD_SCORE = 71.5*((Tmax/Tteam)^2-1)/0.5625;

if SKIDPAD_SCORE < 0 || SKIDPAD_SCORE == 0
    SKIDPAD_SCORE = 3.5*(1-DNF)
else
    SKIDPAD_SCORE = 71.5*((Tmax/Tteam)^2-1)/0.5625 + 3.5*(1-DNF)
end

% % ACCELERATION SCORE 
clc
clear
%75 max

%laptime WITHOUT penalties 
T_fastest = 0;           %Time for the fastest run ever 
T_team = 0;              %Time for the fastest run for the TEAM

%Cone-penalties 
fastest_cones = 0;
team_cones = 0; 
DNF = 0;                     % 1 if all laps are DNF, OC = DNF
 
Tteam = (T_team + 2*team_cones);
Tmax= 1.5*(T_fastest + 2*fastest_cones);


%PLUS 3.5 PO??NG om man klarar ett varv utan DNF eller DQ
ACCELERATION_SCORE = 71.5*((Tmax/Tteam)-1)/0.5; 

if ACCELERATION_SCORE < 0 || ACCELERATION_SCORE == 0
    ACCELERATION_SCORE = 3.5*(1-DNF)
else
    ACCELERATION_SCORE = 71.5*((Tmax/Tteam)-1)/0.5 + 3.5*(1-DNF)
end

%% AUTOCROSS SCORING 
clc
clear

%laptime WITHOUT penalties
T_fastest = 0;           %Time for the fastest run ever 
T_team =0;              %Time for the fastest run for the TEAM

%Cone-penalties 
fastest_cones = 0;          %DOO
team_cones = 0;             %DOO
OC_fast=0;                % off-course
OC_team=0;                % off-course
DNF=0;                    % DNF or DQ 
 
Tteam = (T_team + 2*team_cones + 10*OC_team);
Tmax= 1.25*(T_fastest + 2*fastest_cones + 10*OC_fast);

%PLUS 4.5 PO??NG om man klarar ett varv utan DNF eller DQ
AUTOCROSS_SCORE = 95.5*((Tmax/Tteam)-1)/0.25;

if AUTOCROSS_SCORE < 0 || AUTOCROSS_SCORE == 0
    AUTOCROSS_SCORE = 4.5*(1-DNF)
else
    AUTOCROSS_SCORE = 95.5*((Tmax/Tteam)-1)/0.25 + 4.5*(1-DNF)
end
%% ENDURANCE SCORE 
clc
clear
%DNF = 0 po??ng !!!!!!!!!!

%laptime WITHOUT penalties 
T_fastest = 0;           %Time for the fastest run ever 
T_team = 0;              %Time for the fastest run for the TEAM

%Cone-penalties /off-course
fastest_cones = 0;
team_cones = 0;
OC_fast = 0;             % 0 om man inte har k??rt off-course
OC_team=0;


%Wet to dry/damp - Addera den tiden det tar att byta d?ck
%Dry/damp to wet - Tiden ?ver 13 min f?r b?de d?ck- och f?rarbyte adderas till tiden, f?r ske vid f?rarbyte
 
Tteam = (T_team + 2*team_cones + 10*OC_team);
Tmax= 1.333*(T_fastest + 2*fastest_cones + 10*OC_fast); 

%PLUS 25 Po?NG om man klarar ett varv utan DNF eller DQ
ENDURANCE_SCORE = 300*((Tmax/Tteam)-1)/0.333; 

if ENDURANCE_SCORE < 0 || ENDURANCE_SCORE == 0
    ENDURANCE_SCORE = 25*(1-DNF)
else
    ENDURANCE_SCORE = 300*((Tmax/Tteam)-1)/0.333 + 25
end

%% EFFICIENCY 

