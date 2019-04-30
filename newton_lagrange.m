function [minimizer] = newton_lagrange(grad_F,He_F,c,grad_c,He_c,x,lambda,ftol,maxit)
%This function computes the minimizer of F under equality constraints
%c(x)=0 using Newton_Lagrange method
%   F, grad_F, He_F: the function to be minimized and its gradient, Heesian
%   c, grad_c, He_c: equality constraints and its gradient, Hessian
%   x: initial point
%   lambda: lagrange multiplier
%   ftol: tolerance for the norm of gradient of F
%   maxit: maximum number of iteration 

%compute the dimensions
N=length(x);
M=length(lambda);
F_val=zeros(N+M,1);
C_grad=grad_c(x); %this is a column vector
F_val(1:N)=grad_F(x)-C_grad*lambda;%the first N components
F_val(N+1:end)=c(x);% the remaining components 
F_norm=norm(F_val);
k=0;%counting iter number
while(F_norm>ftol&&k<maxit)
    % print relevant results
    fprintf('%d\t',k);
    fprintf('%8.6e\t',lambda);
    fprintf('%8.6e\t',x);
    fprintf('%8.6e\t',F_val);
    fprintf('%8.6e\n',F_norm);
    %compute the hessain of the lagrangian
    H=He_F(x)-lambda*He_c(x);
    %Jacobian associated with Newton equation
    J=[H -C_grad;C_grad' 0];
    p=-linsolve(J,F_val); % compute the newton step 
    x=x+p(1:N);% update x
    lambda=lambda+p(N+1:end);% update lambda
    %update relevant stuff
    C_grad=grad_c(x); 
    F_val(1:N)=grad_F(x)-C_grad*lambda;%the first N components
    F_val(N+1:end)=c(x);% the remaining components 
    F_norm=norm(F_val);
    k=k+1;
end
    fprintf('%d\t',k);
    fprintf('%8.6e\t',lambda);
    fprintf('%8.6e\t',x);
    fprintf('%8.6e\t',F_val);
    fprintf('%8.6e\n',F_norm);
    minimizer=x;
end
