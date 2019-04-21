function [zero] = newton_back_quad(F,Jacobian,x,gamma,eta,ftol,maxit)
%This function finds the minimizer of a given function f using backtracking
%line search 
% f,df,hf: the given function and its gradient as well as the hessian
% alpha: stepsize
% gamma: discounting factor
% eta: reduction tolerance 
% maxit: maximum number of iteration 
% x:initial point
F_val=F(x);
e=norm(F_val);
k=0;
disp('iter     x_k(1)         x_k(2)          F_k(1)           F_k(2)          norm(F_k)        alpha_k')
while(e>ftol&&k<maxit)
    % print relevant results
    fprintf('%d\t',k);
    fprintf('%8.6e\t',x(1));
    fprintf('%8.6e\t',x(2));
    fprintf('%8.6e\t',F_val(1));
    fprintf('%8.6e\t',F_val(2));
    fprintf('%8.6e\t',e);
    alpha=1;% initial step size
    J=Jacobian(x);% jacobian matrix
    p=linsolve(J,-F_val);% newton direction
    while true
        Q=norm(F_val)-norm(F_val+alpha*J*p);% reduction in merit function of linear model
        delta=norm(F(x))-norm(F(x+alpha*p));% reduction in merit function
        rho=delta/Q;% reduciton ratio
        if (rho>=eta)
            break;
        else
            alpha=alpha*gamma; %stepsize contraction
        end
    end
    fprintf('%8.6e\n',alpha);
    x=x+alpha*p;
    k=k+1;
    F_val=F(x);
    e=norm(F_val);
end
zero=x;
fprintf('%d\t',k);
fprintf('%8.6e\t',x(1));
fprintf('%8.6e\t',x(2));
fprintf('%8.6e\t',F_val(1));
fprintf('%8.6e\t',F_val(2));
fprintf('%8.6e\t',e);
fprintf('%8.6e\n',alpha);

end

