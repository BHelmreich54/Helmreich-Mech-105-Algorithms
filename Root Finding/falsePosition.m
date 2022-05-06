function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false postion method
%   Detailed explanation goes here
%Input:
%func = function being evaluated
%xl = lower guess
%xu = upper guess
%es = desired error percentage (default to 0.0001%)
%maxit = maximum number of iterations (default to 200)
%Output:
%root = position of the estimated root
%fx = function value at estimated root
%ea = approximate relative error
%iter = number of iterations performed
es = 0.0001;
maxit = 200;
if nargin < 3
    error('At least 3 inputs required')
end
if func(xl)*func(xu) > 0
    error('Guesses do not bracket root')
elseif func(xl)*func(xu) == 0
    if func(xl) == 0
        fprintf('xl is root')
    else
        fprintf('xu is root')
    end
else
    xr = xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    iter = 1;
    ea = abs((xr-xu)/xr)*100;
    if func(xr) == 0
        ea = 0;
    end
        while ea > es && iter <= maxit
            iter = iter+1;
            xrold = xr;
            if func(xr)*func(xu) < 0
                xl = xr;
            else
                xu = xr;
            end
            xr = xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu)));
            ea = abs((xr-xrold)/xr)*100;
            if func(xr) == 0 || ea <= es
                ea = 0;
            end
        end
end

root = xr;
fx = func(xr);
ea = ea;
iter = iter;

end