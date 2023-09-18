function [m,a,b] =max_loc(A)
% 获取矩阵中最大元素的位置
% max：矩阵中最大值
% [a,b] 最大值在矩阵中的位置
% 判断矩阵类型
%
%   Version:            1.0
%   Author:             PHI1_NA
%   Contact:            PHI1_NA@outlook.com
%   last modified:      05/16/2023
    [r,l] = size(A);
    if r == 1    % 行向量
        a = 1;
        [m,b] = max(A);
    elseif l == 1    % 列向量
        b = 1;
        [m,a] = max(A);
    else
        [M,I] = max(A);
        [m,b] = max(M); % b = 最大元素所在的列
        a = I(b); % a = 最大元素所在的行
    end
end