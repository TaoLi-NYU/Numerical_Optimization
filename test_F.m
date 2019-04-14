function [F] = test_F(x)
% This function is defined in Exercise 4.1 for testing pure newton
%   F(1)=x(1)^2+4x(2); F(2)=-0.5x_1+8x_2^2
F=zeros(2,1);%preallocation
F(1)=x(1)^2+4*x(2);
F(2)=-0.5*x(1)+8*x(2)^2;

end

