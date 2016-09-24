clear;clc;
set(gca,'NextPlot','Add');
syms x y z
P1 = [6 4.5 2.5];
P2 = [4 4.5 1.5];
P3 = [4 2 2.5];
M = [x-P1(1),  y-P1(2),  z-P1(3);
    P2(1)-P1(1), P2(2)-P1(2), P2(3)-P1(3);
    P3(1)-P1(1), P3(2)-P1(2), P3(3)-P1(3)];
fxy = solve(det(M)==0,z);
ezmesh(fxy);
fxy
