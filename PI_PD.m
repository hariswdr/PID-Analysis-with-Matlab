%%UAS PTK (PI and PD)
%Nama : Gede Haris Widiarta
%NIM  : 1102174038

clear all;
clc;

%%Inisialisasi Sistem
s  = tf('s');
La = 1/((s+1)*(s+2)*(s+10));
% rlocus(La);
s1 = -4+6*j;            %Pole dominan

%%PD Control
sdtLa = angle(1/(s1^3 + 13*s1^2 + 32*s1 + 20))*180/pi;
sdtPD = 180 - sdtLa
zd = 6/(tand(90))+4     %90 hasil dari stdPD
PD = s+zd
Lb = PD*La
% rlocus(Lb);
K  = 51.5               %Gain dari pole baru -> bisa diliat di rlocus Lb
Lc = K*Lb 
Tc = Lc/(1+Lc)
% step(Tc)
% hold on

%%PI Control
PI = (s+0.1)/s         %Pole terdekat dengan origin
Ld = PI*Lc
Td = Ld/(1+Ld)
% step(Td)

%%PID (Kp,Ki,Kd)
PID = K*PI*PD
%Hasil -> Kp = 211.2, Ki = 20.6, Kd = 51.5