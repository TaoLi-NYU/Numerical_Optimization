function [J] = Jacobian_F(x)
%This function computes the jacobina matirx of F at point x
%   J is a 2 by 2 matrix
J=zeros(2,2);
J(1,1)=2*x(1);
J(1,2)=4;
J(2,1)=-0.5;
J(2,2)=16*x(2);
end

