function [h] = Hessian_curv(x)
%This fucntion computes the Hessian matix at a given point x
h=zeros(3,3);
h(1,1)=2;
h(2,2)=2*cos(x(3))-x(3)^2*exp(x(2));
h(2,3)=-2*x(2)*sin(x(3))-2*x(3)*exp(x(2));
h(3,2)=h(2,3);
h(3,3)=-x(2)^2*cos(x(3))-2*exp(x(2));
end

