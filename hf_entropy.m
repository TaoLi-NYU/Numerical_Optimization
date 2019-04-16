function [hf] = hf_entropy(x)
%This function computes the hessian matrix of f_entropy 
%  
hf=diag(1./x);
end

