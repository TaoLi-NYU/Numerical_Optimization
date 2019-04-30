function [hf] = H_fbar(x)
%This function computes the hessian matrix of fbat
hf=zeros(4);
hf(1,1)=2;
hf(2,2)=1;
hf(3,3)=0.1;
hf(4,4)=0.001;
end

