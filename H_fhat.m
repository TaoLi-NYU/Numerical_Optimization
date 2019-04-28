function [hf] = H_fhat(x)
%This function computes the hessian of fhat
hf=zeros(2,2);
hf(1,1)=20*(x(1)^2-x(2))+40*x(1)^2+2;
hf(1,2)=-20*x(1);
hf(2,1)=hf(1,2);
hf(2,2)=10;
end

