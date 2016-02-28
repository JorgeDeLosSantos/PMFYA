clear;clc;
n=6;
v=[1 0 1 0 1 1 0 0 0 0 0];
A=v;
for k=1:n-1
    nf = [v(end-k+1:end),v(1:end-k)];
    A=[A;nf];
end
disp(A)