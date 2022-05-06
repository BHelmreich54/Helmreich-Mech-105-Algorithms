function [I] = Simpson(x,y)
%Simpson Numerical evaluation of integral by Simpson's 1/3 Rule
%   % Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
I = 0;
if length(x) ~= length(y)
    error('Inputs must be the same length')
end
for j = 1:length(x)-1
    if x(j+1)-x(j) ~= ((x(length(x))-x(1))/(length(x)-1))
        error('x is not equally spaced')
    end
end
if rem(length(x)-1,2) ~= 0
    warning('x has odd number of intervals, Trapeziod Rule will be used for last interval')
    for i = 1:2:length(x)-2
        I = I+(((x(length(x))-x(1))/(3*(length(x)-1)))*(y(i)+4*y(i+1)+y(i+2)));
    end
    I = I+(((x(length(x))-x(length(x)-1))/2)*(y(length(x))+y(length(x)-1)));
else
    for i = 1:2:length(x)-2
        I = I+(((x(length(x))-x(1))/(3*(length(x)-1)))*(y(i)+4*y(i+1)+y(i+2)));
    end
end
end