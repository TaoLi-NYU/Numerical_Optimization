function [df] = df_dual(A,b,x)
%UNTITLED22 Summary of this function goes here
%   Detailed explanation goes here
df=b - A*exp(-A'*x-1);
end

