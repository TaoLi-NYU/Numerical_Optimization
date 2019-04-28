function [gf] = grad_fhat(x)
%This function computes the gradient of f hat at x
gf=zeros(2,1);
gf(1)=20*(x(1)^2-x(2))*x(1)+2*(x(1)-1);
gf(2)=10*(x(2)-x(1)^2);
end

