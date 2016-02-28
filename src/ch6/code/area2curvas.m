clear;clc;
x = linspace(0,pi);
y1 = sin(x);
y2 = cos(x);
plot(x,y1,x,y2)
X = [x fliplr(x)];
Y = [min(y1,y2) max(fliplr(y1),fliplr(y2))];
patch(X,Y,'r')