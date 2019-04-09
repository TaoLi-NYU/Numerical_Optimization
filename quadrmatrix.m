function [y] = quadrmatrix(c,H,x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
y=c'*x+0.5*x'*H*x;
end

