clear;clc;
% str = 'Avenida Siempreviva 742';
% nums = regexp(str,'\d*','match');
str = fileread('amor_mio_mi_amor.txt');
regexp(str,'am(o|a)r','match')