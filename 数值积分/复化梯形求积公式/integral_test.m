% 复化梯形求积例子
%   Author:             PHI1_NA
%   Contact:            PHI1_NA@outlook.com
%   last modified:      07/11/2023
clc;clear all;format long;
f = @(x) 4./(1+x.^2);

N = [10 20 40 80 160];
delta = zeros(1,5);
k = 1;
for n = N
    T = comp_tra_integral(0,1,n,f);
    delta(k) = abs(pi-T);
    k++;
end
    	plot(N,delta,'b');
disp(delta);
