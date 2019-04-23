function [g] =grad_curv(x)
%This fucntion computes the gradient at x
g=zeros(2,1);
g(1)=2*x(1);
g(2)=2*x(2)*cos(x(3))-x(3)^2*exp(x(2));
g(3)=-x(2)^2*sin(x(3))-2*exp(x(2))*x(3)+4;
end

