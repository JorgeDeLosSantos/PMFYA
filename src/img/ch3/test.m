clear;clc;
s1.sub1 = 2;
s1.sub2 = 3;
s1.sub3 = 'AM';
S = struct('Campo1',ones(3),'Campo2',s1);
print_struct(S);