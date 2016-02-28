clear;clc;
x = linspace(0,pi,50);
y = sin(x);
X = [x fliplr(x)];
Y = [zeros(size(x)) fliplr(y)];
patch(X,Y,'r')