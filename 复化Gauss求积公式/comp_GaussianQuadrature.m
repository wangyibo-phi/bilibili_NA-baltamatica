function  GS = comp_GaussianQuadrature(a,b,n1,n2,f)
% [a,b]
% n1 : 一个小区间内选取的积分节点数目
% n2 : 将[a,b]分划成 n2 个小区间
% f: 支持向量运算的函数
%
%   Version:            1.0
%   Author:             PHI1_NA
%   Contact:            PHI1_NA@outlook.com
%   last modified:      08/04/2023
S = zeros(1,n2);
h = (b-a)/n2;
k = 0:1:n2;
jd = a + k * h;
for i =1:1:n2
    S(i) = Gaussian_Quadrature(jd(i),jd(i+1),n1,f);
end
	GS = sum(S);
end

function output = Gaussian_Quadrature(a,b,n,f)
% [a,b]
% n : 积分节点个数
% f: 支持向量运算的函数
%
%   Version:            1.0
%   Author:             PHI1_NA
%   Contact:            PHI1_NA@outlook.com
%   last modified:      08/04/2023
load('gs_quadrature.mat');
xi = jiedian{n}; % 是列向量
Xi = ((a+b)+(b-a)*xi)./2;
Yi = f(Xi);
alpha = quanzhong{n}; % 是列向量
A = alpha .* Yi;
Sum = sum(A);
output = (b-a)/2 * Sum;
end