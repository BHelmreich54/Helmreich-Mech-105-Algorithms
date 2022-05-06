function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
%Initial Check
if length(A)~=height(A)
    error('A must be Square')
end

U = A;
P = eye(length(A));
L = eye(length(A));
%Pivot
for i = 1:length(A)-1
    if i == 1
        D = abs(U(i:end,i));
    else
        D = [zeros(i-1,1);abs(U(i:end,i))];
    end
    if abs(U(i,i)) < max(abs(D))
        [x,y] = max(abs(D));
        C = U(i,:);
        U(i,:) = U(y,:);
        U(y,:) = C;
        C = P(i,:);
        P(i,:) = P(y,:);
        P(y,:) = C;
    end
    %Elimination
    for j = i+1:length(A)
        N = U(j,i)/U(i,i);
        %L(j,i) = U(j,i)/U(i,i);
        U(j,:) = U(j,:)-(N*U(i,:));
    end
end
L = (P*A)/U;

if length(L)~=length(A) || height(L)~=height(A) || length(L)~=height(L)
    error('L Matrix is Incorrect Size') %Checks L Size
end
if length(U)~=length(A) || height(U)~=height(A) || length(U)~=height(U)
    error('U Matrix is Incorrect Size') %Checks U Size
end
if length(P)~=length(A) || height(P)~=height(A) || length(P)~=height(P)
    error('P Matrix is Incorrect Size') %Checks P Size
end
if P*A~=L*U
    error('Matrices are Incorrect') %Checks the Answers
end


end