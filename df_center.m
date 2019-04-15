function [y] =df_center(A,x)
%This function computes the gradient of f_center at x
y=A'*(1./(1-A*x)) - 1./(1+x) + 1./(1-x);
end

