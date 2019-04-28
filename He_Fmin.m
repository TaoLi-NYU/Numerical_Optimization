function [h] = He_Fmin(x)
%This function computes the Hessain matrix of Fmin at x
h=zeros(2,2);
h(1,1)=6*x(1);
h(2,1)=-1;
h(1,2)=h(2,1);
end

