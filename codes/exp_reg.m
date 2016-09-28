clear;clc;
% str = 'Avenida Siempreviva 742';
% nums = regexp(str,'\d*','start');
str = fileread('amor_mio_mi_amor.txt');
regexp(str,'amor|amar','match')