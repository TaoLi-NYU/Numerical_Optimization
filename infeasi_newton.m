function [sol,lambda] = infeasi_newton(df,hf,A,b ,x,alpha,beta,gtol,maxit)
%This function computes the minimizaer of a covex eqaulity constrained problem
% using backtracking from a infeasible point
% f df hf: objective function and its gradient as well as the hessian 
% A: equality constraints
% b: equality constraints
% x: initial point
% alpha: backtracking parameter
% beta: discounting factor
% gtol: tolerance 
% maxit: maximum number of iteration
e=1;
[m,n]=size(A);
k=1;
w=zeros(m,1);
while(e>gtol&&k<maxit)
    D=df(x); % gradient at x
    H=hf(x); % the Hessian matrix 
    % compute the descent direction
    Matrix=[H, A'; A, zeros(m)]; 
    res=resd(A,b,D,x,w);
    delta=linsolve(Matrix,-res);
    p=delta(1:n);% descent direction
    v=delta((n+1):end); % dual 
    t=1;% initial stepsize
    %keep feasibility
    while(min(x+t*p) <= 0)
        t=beta*t;
    end
    %backtracking 
    e=norm(resd(A,b,D,x,w));
    x=x+t*p;
    w=w+t*v;
    e1=norm(resd(A,b,D,x,w));
    while(e1>(1-alpha*t)*e)
        t=beta*t;
        e=e1;
        x=x+t*p;
        w=w+t*v;
        e1=norm(resd(A,b,D,x,w));
    end
    e=e1;
end
sol=x;
lambda=w;
end

