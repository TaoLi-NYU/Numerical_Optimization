function [center]=grad_bt_center(f,df,m,n,alpha,beta,gtol,maxit)
% This function emploies gradient backtracking to compute the analytic cernter 
%of a given set of linear inequalities
% f,df : fucntion to be minized and its gradient
% m: the number of linear inequalities a_ix<=1
% n: the number of linear ineqaulities |x_i|<=1
% alpha: backtracking parameter
% beat: discounting factor
% x: current point
% gtol : tolerance for the norm of gradient
% maxit: maximum iteration numbers
A=randi(10,[m,n]); % each row of A is a_i corresponding to linear inequalities
x=zeros(n,1);% initial point

e=1;
data=zeros(2,maxit);%preallocation
k=1;%iteration counts
data(1,k)=f(A,x);
data(2,k)=1;
while(e>gtol&&k<=maxit)
    t=1;
    p=-df(A,x);%descent direction
    f_t=f(A,x+t*p); %
    f_a=f(A,x)+alpha*t*df(A,x)'*p;% upperline
    % keep feasibility
    while ((max(A*(x+t*p)) >= 1) || (max(abs(x+t*p)) >= 1))
    t = beta*t;
    end
    %f_t has to be below the upper line, otherwise cut off the stepsize
    while(f_t>f_a)
        t=beta*t;
        f_t=f(A,x+t*p);
        f_a=f(A,x)+alpha*t*df(A,x)'*p;
    end
    k=k+1;
    % keep record of each iteration 
    data(1,k)=f_t;
    data(2,k)=t;
    e=abs(f_t-f(A,x));
    x=x+t*p;
end
center=x;
data=data(:,1:k);
figure(1);
plot(1:k,data(2,:));
figure(2);
plot(1:k,abs(data(1,:)-f_t));
end