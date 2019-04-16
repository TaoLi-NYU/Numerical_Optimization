function [zero] = newton_back_quad(f,df,hf,x,gamma,eta,ftol,maxit)
%This function finds the minimizer of a given function f using backtracking
%line search and local quadratic model
% f,df,hf: the given function and its gradient as well as the hessian
% alpha: stepsize
% gamma: discounting factor
% eta: reduction tolerance 
% maxit: maximum number of iteration 
% x:initial point
e=1;
k=1;
while(e>ftol&&k<maxit)
    alpha=1;% initial step size
    grad=df(x); %gradient
    H=hf(x);% hessian
    p=linsolve(H,-grad);% newton direction
    while true
        Q=0.5*(alpha^2-2*alpha)*grad'*p;
        delta=f(x)-f(x+alpha*p);
        rho=delta/Q;
        if (rho>=eta)
            break;
        else
            alpha=alpha*gamma;
        end
    end
    x=x+alpha*p;
    k=k+1;
    e=f(x);
end
zero=x;
end

