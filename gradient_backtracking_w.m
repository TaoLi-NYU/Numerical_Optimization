function [y] = gradient_backtracking_w(f,df,alpha,beta,x,w,ftol)
%This function performs backtracking line search for a given function f (f_w)and
%return a desired stepsize for current point x
% f: function to be tested
%df: the gradient of f
% p: a given descent direction
% alpha: 
% beat: discounting factor
% x: current point
t=1;% initial step size
e=1;% the difference between two iterates
while(e>ftol)
    p=-df(w,x);%descent direction
    f_t=f(w,x+t*p); %
    f_a=f(w,x)+alpha*t*df(w,x)'*p;% upperline
    %f_t has to be below the upper line, otherwise cut off the stepsize
    while(f_t>f_a)
        t=beta*t;
        f_t=f(w,x+t*p);
        f_a=f(w,x)+alpha*t*df(w,x)'*p;
    end
%if it is a unconstrained problme then step=t;
%otherwise we shall be careful about feasibility
step=feasi(x,p,t);
e=abs(f(w,x+step*p)-f(w,x));
x=x+t*p;
end
y=x;
end