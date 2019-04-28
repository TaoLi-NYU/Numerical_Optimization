function [g] = grad_Fmin(x)
%This function computes the gradient of Fmin at x
g=zeros(2,1);
g(1)=3*x(1)^2-x(2);
g(2)=-x(1);
end

