function [hf] = hf_dual(A,x)
%UNTITLED24 Summary of this function goes here
%   Detailed explanation goes here
hf=A*diag(exp(-A'*x-1))*A';
end

