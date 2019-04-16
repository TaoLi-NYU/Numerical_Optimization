function [f] =f_dual(A,b,x)
%UNTITLED21 Summary of this function goes here
%   Detailed explanation goes here
f=b'*x + sum(exp(-A'*x-1));
end

