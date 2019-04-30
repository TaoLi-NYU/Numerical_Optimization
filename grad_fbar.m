function [gf] = grad_fbar(x)
%This function computes the gradient of f_bar at x
gf=zeros(4,1);
gf(1)=1+2*x(1);
gf(2)=1+x(2);
gf(3)=1+0.1*x(3);
gf(4)=1+0.001*x(4);
end

