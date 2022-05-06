function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n,m);
% Test for correct number of inputs 
    if nargin ~= 2
        error
    end
% Now the real challenge is to fill in the correct values of A
% Fill forst row of numbers
    for x=1:n
        A(x,1) = x;
    end
% Fill first column of numbers
for y=1:m
    A(1,y) = y;
end
% Fill the rest of the matrix with the addition of the numbers to the left
% and above the previous number
for x=2:n
    for y=2:m
        A(x,y)=A(x-1,y)+A(x,y-1);
    end
end
end
% Things beyond here are outside of your function