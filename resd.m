function [res] = resd(A,b,df,x,w)
%This function computes both primal residual and dual residual 
% A,b: equality constraints
% df: gradient 
% x,w: primal and dual
res_dual=df+A'*w;
res_pri=A*x-b;
res=[res_dual;res_pri];
end

