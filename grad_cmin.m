function [gc] = grad_cmin(x)
%This function computes the gradient cmin at x
gc=zeros(2,1);
gc(1)=5*x(1);
gc(2)=0.5*x(2);
end

