function [step]=feasi(x,p,t)
%This function gives a proper stepsize for backtracking line search while
%preserving feasibility
% notice that this function is only designed for problem 2 HW5
index=find(p<0);
if (sum(p)<=0)
    T=min(-x(index)./p(index));
else
    T=(1-sum(x))/sum(p);
    M=-x(index)./p(index);
    T=min([T,M']);
end
step=min(t,T);
end