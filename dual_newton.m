function [sol] = dual_newton(f,df,hf,A,b,alpha,beta,gtol,maxit)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,~]=size(A);
x=zeros(m,1);
e=1;
k=1;
while(e>gtol&&k<=maxit)
    t=1;
    Df=df(A,b,x);
    p=linsolve(hf(A,x),-Df);%descent direction
    f_t=f(A,b,x+t*p); %
    f_a=f(A,b,x)+alpha*t*Df'*p;% upperline
    %f_t has to be below the upper line, otherwise cut off the stepsize
    while(f_t>f_a)
        t=beta*t;
        f_t=f(A,b,x+t*p);
        f_a=f(A,b,x)+alpha*t*Df'*p;
    end
    k=k+1;
    e=abs(Df'*p);
    x=x+t*p;
end
sol=x;
end

