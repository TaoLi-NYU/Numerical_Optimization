function [sol,lambda] = newton_equ(f,df,hf,A,x,alpha,beta,gtol,maxit)
% This function computes the minimizaer of a covex eqaulity constrained problem
% f df hf: objective function and its gradient as well as the hessian 
% A: equality constraints
% x: initial point
% alpha: backtracking parameter
% beta: discounting factor
% gtol: tolerance 
% maxit: maximum number of iteration
e=1;
[m,n]=size(A);
k=1;
while(e>gtol&&k<maxit)
    D=df(x); % gradient at x
    H=hf(x); % the Hessian matrix 
    % compute the descent direction
    Matrix=[H, A'; A, zeros(m)]; 
    delta=linsolve(Matrix,[-D; zeros(m,1)]);
    p=delta(1:n);% descent direction
    t=1;% initial stepsize
    %keep feasibility
    while(min(x+t*p) <= 0)
        t=beta*t;
    end
    %backtracking
    f_t=f(x+t*p); %
    f_a=f(x)+alpha*t*D'*p;% upperline
    while(f_t>f_a)
        t=beta*t;
        f_t=f(x+t*p);
        f_a=f(x)+alpha*t*D'*p;
    end
    x=x+t*p;
    e=abs(D'*p);
    k=k+1;
end
sol=x;
lambda=delta((n+1):end);
end

