function [hf] = hf_center(A,x)
%This function computes the hessian matrix of f_center at x
%   
d=1./(1-A*x);
hf=A'*diag(d.^2)*A + diag(1./(1+x).^2 + 1./(1-x).^2);

end

