function [x]=bisection(bi_func,a,b,xtol,maxit)
% zero finding program using bisection method
% a,b : the end point of the initial interval such that f(a)f(b)<0
% e: the tolerance for evaluation 
% xtol: tolerance for interval length
% maxit: maximum number of step performed

% check whether the endpoints have the same sign
fa=bi_func(a);
fb=bi_func(b);
if fa*fb>0
    disp("error: the evaluation at endpoints should have opposite signs")
    return ;
end
% check whether b is the zero point
if fb==o
    x=b;
    return;
end

%initialization
x=a;
f_val=fa;
L=b-a;
count=0;
while(f_val~=0&&L>xtol&&count<maxit)% stopping condition 
    x=(a+b)/2; % find the mid point
    f=bi_func(x); % evaluate f at the mid point
    if f*fa<0 % f(x) and f(a) have different signs, then let x be the new right end point
        b=x;
        fb=f;
    else      % let x be the new left end point
        a=x;
        fa=f;
    end
    f_val=abs(f); %update f_val
    L=b-a; %update L
    count=count+1;
    % print out the iteration results
    fprintf('%d iteration\t', count);
    fprintf('a_k=%10.6e\t', a);
    fprintf('f(a_k)=%10.6e\t',fa);
    fprintf('b_k=%10.6e\t',b);
    fprintf('f(b_k)=%10.6e\t',fb);
    fprintf('length: %10.6e\n',L);

end
   
end