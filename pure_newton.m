function [x]=pure_newton(f,df,x0,ftol,maxit)
% zero finding using pure newton method
% f: function to be applied 
% df: the derivative of f
% x0=starting point
% stopping condition: abs(f)<ftol or the number of iter exceeds maxit
x=x0;
f_val=f(x);
count=0;
data=ones(1,maxit); %preallocation for data storage
while(f_val~=0&&abs(f_val)>ftol&&count<maxit)
    df_val=df(x); % compute the derivative
    x1=x-f_val/df_val; %updata x using newton's method
    f_val=f(x1); % function evalution at new point
    count=count+1;
    x=x1;
    data(count)=x1;
    %print the iteration results for x_k, f_k, df_k
    fprintf('%d\t',count);
    fprintf('x_k:%10.6e\t',x1);
    fprintf('f_k:%10.6e\t',f_val);
    fprintf('df_k:%10.6e\n',df_val);
    
end
data=data(1:count);
%print related iteration results
fprintf('x_k-x:\n')
fprintf('%10.6e\n',data-x);
fprintf('delta_k:\n');
y=[x0,data(1:end-1)];
fprintf('%10.6e\n',abs((data-x)./(y-x)));
fprintf('delta_k^2:\n');
%fprintf('%10.6e\n',abs((data-x)./(y-x).^2)); % check quadratic convergence
end