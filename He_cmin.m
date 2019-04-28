function [hc] = He_cmin(x)
%This function computes the Hessain matrix of cmin at x
hc=zeros(2,2);
hc(1,1)=5;
hc(2,2)=0.5;
end

