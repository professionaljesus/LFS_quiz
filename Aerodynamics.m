clc
clear all

%AERODYNAMICS

%% DOWNFORCE

cl=3.8;         %lift coefficient 
p=0;            %Density 
v=0;            %velocity 
A=1;            %Frontal area

Fl=cl*A*p*v^2/2

%% DRAGFORCE 

cd=0;           %drag coefficient 
p=0;            %Density 
v=0;            %velocity 
A=0;            %Frontal area

Fd=cd*A*p*v^2/2

%% SKIDPAD - CALC VELOCITY 

%Assumptions: no weight transfer, optimal grip

my=0;           %friktionskoefficient 
m=0;            %Total massa 
cl=0;           %coefficient of lift 
A=1;            %frontarea
p=1.1;          %densitet
R=18.25/2;      %Radie - skidpad radie fr?n banans mitt?
g=9.81;

v=sqrt(R*m*g*my/(m-0.5*R*p*A*cl*my))

%% COEFFICIENT OF LIFT 

FL=0;           %downforce  
p=0;            %Density 
v=0;            %velocity 
A=0;            %Frontal area

cl= 2*FL/(A*p*V^2);

%% COEFFICIENT OF DRAG 

Fd=0;           %downforce  
p=0;            %Density 
v=0;            %velocity 
A=0;            %Frontal area

cl= 2*Fd/(A*p*V^2);

%% PRESSURE COEFFICIENT 
P=0;            % ???????
P0=0;           % ??????
p=0;            %density
v=0;            %velocity

cp=(P-P0)*2/(p*v^2)

%% SHEARFORCE 

A = 0;          %Frontal area
my =0;          %Friction coefficient??
v=0;            %Surrounding velocity 
h=0;            %Separation distance

F=A*my*v/h

%% PITOT TUBE



