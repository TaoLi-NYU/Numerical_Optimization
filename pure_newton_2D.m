function [x] = pure_newton_2D(F,Jacobian,x0,ftol,maxit)
% zero-finding using pure newton in 2 dimensional case
%   F: a nonlinear function to be tested 
%   J: the jacobian matrix of F at x
%   x0: the initial point
%   ftol: tolerance for the norm F
%   maxit: maximum number of iterations
x=x0;
F_val=F(x);
F_norm=norm(F_val,2);

count=0;
disp('iter     x_k(1)         x_k(2)         F_k(1)           F_k(2)          norm(F_k)')

while(F_norm>ftol&&count<maxit)
    % print relevant results
    fprintf('%d\t',count);
    fprintf('%8.6e\t',x(1));
    fprintf('%8.6e\t',x(2));
    fprintf('%8.6e\t',F_val(1));
    fprintf('%8.6e\t',F_val(2));
    fprintf('%8.6e\t',F_norm);
    fprintf('\n');
    %pure newtom iterates
    J=Jacobian(x); %compute the jacobian matirx at x
    p=linsolve(J,-F_val); % compute the newton step 
    x=x+p;% update x
    % update count, evaluation F_val and norm  
    count=count+1;
    F_val=F(x);
    F_norm=norm(F_val,2);
    
end
end


