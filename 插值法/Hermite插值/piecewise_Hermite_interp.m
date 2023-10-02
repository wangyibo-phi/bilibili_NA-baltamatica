function [out1] = piecewise_Hermite_interp(x0,y0,dy0,x)
    % 分段Hermite插值
    % x0 : [x1 x2 ...]
    % y0 : [y1 y2...]
    % dy0 : [y1' y2'...]
    % length(x)=1
    %
    %   Version:            1.0
    %   Author:             PHI1_NA
    %   Contact:            PHI1_NA@outlook.com
    %   last modified:      09/13/2023
    m = length(x);
    n = length(x0);
    y = zeros(1,m);
    for k =1:1:m
        for i =1:1:n-1
        	   if x0(i)<=x(k) && x(k)<= x0(i+1)
        	   	 y(k) = Hermite_interp(x0([i,i+1]),y0([i,i+1]),dy0([i,i+1]),x(k));
        	   end
        end
    end
    out1 = y;
end

function [output]= Hermite_interp(x0,y0,dy0,x)
    % Hermite插值
    % x0 : [x1 x2]
    % y0 : [y1 y2]
    % dy0 : [y1' y2']
    % length(x)=1
    %
    %   Version:            1.0
    %   Author:             PHI1_NA
    %   Contact:            PHI1_NA@outlook.com
    %   last modified:      05/16/2023
        h = x0(2)-x0(1);
        h1 = x - x0(1);
        h2 = x - x0(2);
        X1 = (h2/h)^2;
        X2 = (h1/h)^2;
        alpha1 = (1+2*h1/h)*X1;
        alpha2 = (1+2*h2/(-h))*X2;
        beta1 = h1*X1;
        beta2 = h2*X2;
        output = alpha1*y0(1)+alpha2*y0(2)+beta1*dy0(1)+beta2*dy0(2);
    end