function [minimizer,data] = quad_penalty(F,grad_F,He_F,c,grad_c,He_c,rho,x,ftol,maxit,data)
% This function computes the minimizer of a given function F under equality
% constraints c(x)=0 using quadratic penalty 
%   F, grad_F, He_F: the function to be minimized and its gradient, Heesian
%   c, grad_c, He_c: equality constraints and its gradient, Hessian
%   rho: penalty parameter
%   x: initial point
%   ftol: tolerance for the norm of gradient of F
%   maxit: maximum number of iteration 
%   data: initialized wiht [] for recording the x^* of each newton
%   iteration
f=F(x);%function evalution
C=c(x);
grad_P=grad_F(x)+rho*C*grad_c(x);%gradient of penalty function
norm_g=norm(grad_P);%the norm of the gradient
H=He_F(x)+rho*(C*He_c(x)+grad_c(x)*grad_c(x)');%hessian of penalty function
k=0;% counting iter num
disp('iter        x(1)          x(2)            f               c              grad_P')
while(norm_g>ftol&&k<maxit)
    %print revelent resutls
    fprintf("%d\t",k);
    fprintf("%8.6e\t",x);
    fprintf("%8.6e\t",f);
    fprintf("%8.6e\t",C);
    fprintf("%8.6e\n",norm_g);
    p=-linsolve(H,grad_P);%compute the descent direction
    x=x+p;% pure newton update
    f=F(x);% update function evaluation
    C=c(x);
    grad_P=grad_F(x)+rho*C*grad_c(x);%update the gradient
    norm_g=norm(grad_P);
    H=He_F(x)+rho*(C*He_c(x)+grad_c(x)*grad_c(x)');%update the hessian
    k=k+1;
end
    fprintf("%d\t",k);
    fprintf("%8.6e\t",x);
    fprintf("%8.6e\t",f);
    fprintf("%8.6e\t",C);
    fprintf("%8.6e\n",norm_g);
    lambda=-rho*c(x);
    x_lambda=[x;lambda];
    data=[data,x_lambda];%data storage
if(rho<1000) % we only consider rho=1 10 100 1000
    rho=rho*10;
    %keep record of current xstar 
    [x,data]=quad_penalty(F,grad_F,He_F,c,grad_c,He_c,rho,x,ftol,maxit,data);%apply this func recursively

end
    minimizer=x;
    diff_data=abs(data-data(:,end));
    disp('iter      x(rho)-x       lambda(rho)-lambda')
    for i =1:4
        fprintf("%d\t",i);
        fprintf("%8.6e\t",norm(diff_data(1:2,i)));
        fprintf("%8.6e\n",diff_data(3,i));
    end
    
end


