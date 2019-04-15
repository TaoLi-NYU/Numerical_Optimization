function [y] = gradient_backtracking(f,df,alpha,beta,x,ftol)
%This function performs backtracking line search for a given function f (f_opt)and
%return a desired stepsize for current point x
% f: function to be tested
%df: the gradient of f
% p: a given descent direction
% alpha: 
% beat: discounting factor
% x: current point

e=1;% the difference between two iterates
while(e>ftol)
    t=1;% initial step size
    p=-df(x);%descent direction
    f_t=f(x+t*p); %
    f_a=f(x)+alpha*t*df(x)'*p;% upperline
    %f_t has to be below the upper line, otherwise cut off the stepsize
    while(f_t>f_a)
        t=beta*t;
        f_t=f(x+t*p);
        f_a=f(x)+alpha*t*df(x)'*p;
    end
%if it is a unconstrained problme then step=t;
%otherwise we shall be careful about feasibility
step=t;
e=abs(f(x+step*p)-f(x));
x=x+t*p;
end
y=x;
end

