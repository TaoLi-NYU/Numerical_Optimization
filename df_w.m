function [df]=df_w(w,x)
%This function computes the the gradient of -f_w at x
df=zeros(3,1);
const=-2/(1-x(1)-x(2)-x(3))^3;
for i=1:3
    df(i)=w(i)/x(i)+const;
end
df=-df; %we compute the gradient of additive inverse
end
