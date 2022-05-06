function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%Ben Helmreich
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
if length(x) ~= length(y)
    error('Arrays must be the same length')
end

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
n = length(x);
Q1 = floor((n+1)/4);
Q3 = floor(((3*n)+3)/4);
IQR = sortedY(Q3)-sortedY(Q1);

j = 1;
for i = 1:n
    if sortedY(i)>=(sortedY(Q1)-(1.5*IQR)) && sortedY(i)<=(sortedY(Q3)+(1.5*IQR))
        fX(j) = sortedX(i);
        fY(j) = sortedY(i);
        j = j+1;
    end
end

n = length(fX);
sumy = sum(fY);
sumx = sum(fX);
sumxy = sum(fX.*fY);
sumxsqr = sum(fX.^2);
sumsqrx = sumx^2;
sumysqr = sum(fY.^2);
sumsqry = sumy^2;
ymean = mean(fY);
xmean = mean(fX);
a1 = ((n*sumxy)-(sumx*sumy))/((n*sumxsqr)-(sumsqrx));
a0 = ymean-(a1*xmean);
fun = @(x) (a1*x)+a0;
slope = a1;
intercept = a0;

r = ((n*sumxy)-(sumx*sumy))/(sqrt((n*sumxsqr)-(sumsqrx))*sqrt((n*sumysqr)-(sumsqry)));
Rsquared = r^2;

end