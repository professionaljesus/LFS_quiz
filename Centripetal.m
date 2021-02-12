clc
clear all 
%CENTRIPETALACCELERATION

%% 
r=7;            %Kr?kningsradie
v=0;            %Hastighet
m=0;            %Massa

ac = v^2/r
Fac=m*ac

%%
r=100;          %Kr?kningsradie
w=20;           %Vinkelhastighet 
 
ac = w^2*r

%% 
r=100;          %Kr?kningsradie
f=0;            %frekvens

ac = 4*pi^2*f^2*r

%%
r=100;          %Kr?kningsradie
T=0;            %Omloppstid tid/varv

ac = (4*pi^2*r)/T^2


