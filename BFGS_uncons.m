function [xstar,fstar,data,pnorm] = BFGS_uncons(flag,F,g_F,h_F,x,gamma,eta,ftol,maxit)
% This function performs Quasi-Newton using BFGS update method and there
% are two options in choose step size: 1) flag=0 backtracking, where
% gamma, eta should be specified; 2) flag=1 quadratuc model, where Hessian
% is needed
%   flag: to specify which method to be used
%   f, g_f, h_f: function to be tested and its gradient, hessian
%   x: initial point;
%   gamma: reduction;
%   eta: 
%   ftol: tolerance for the norm of gradient 
%   maxit: maximum number of iterations
k=0; %count iter number;
f=F(x);
g=g_F(x);%initilize gradient
H=h_F(x);%initialize hessian
N=length(g);% dimension
B=eye(N);%initilize approximation
grad_norm=norm(g);
data=zeros(N,maxit);%preallocation
pnorm=zeros(1,maxit);% measure the difference
Hstar=h_F([-0.5,-1,-10,-100]');
while(grad_norm>ftol&&k<maxit)
    % compute the search direction 
    p=B\-g;
    delta_B=(B-Hstar)*p;
    pnorm(k+1)=norm(delta_B)/norm(p);
    if (flag==0)
    %backtracking for  determining the step size
        alpha=1;
        count=0;%
        while true
            F_delta=f-F(x+alpha*p);
            Q_delta=-alpha*g'*p-0.5*alpha^2*p'*B*p;
            rho=F_delta/Q_delta;
            if (rho>=eta ||count>10)
                %Armijo condtion and alpha should not be 
                %redued more than 10 times
                break;
            else
                alpha=gamma*alpha;
            end
            count=count+1;
        end
    % quadratic function
    else
        alpha=-g'*p/(p'*H*p);
    end
    delta_x=alpha*p;% compute the s_k=x_{k+1}-x_k
    delta_g=g_F(x+alpha*p)-g; %compute the y_k=g_{k+1}-g_k
    % compute the norm of difference H-B
    norm_diff=norm(H-B);
    data(:,k+1)=x;
    %print revelent results
    fprintf("%d\t",k);
    fprintf("%8.6e\t",x);
    fprintf("%8.6e\t",f);
    fprintf("%8.6e\t",grad_norm);
    fprintf("%8.6e\t",alpha);
    fprintf("\n");
    %fprintf("%8.6e\t",B);
    fprintf("%8.6e\n",norm_diff);
    %fprintf("B%d\n",k);
    %disp(compose('%8.6e',B));
    % update B using BFGS
    if(delta_g'*delta_x>0)%positive-definiteness
        Bs=B*delta_x;
        B=B-Bs*Bs'/(delta_x'*Bs)+delta_g*delta_g'/(delta_g'*delta_x);
    end
    % update x and g
    x=x+delta_x;
    g=g+delta_g;
    % update f, norm of gradient, Hessian
    f= F(x);
    grad_norm=norm(g);
    H=h_F(x);
    k=k+1; 
    %fprintf("det=%8.6e\n",det(B));
end
data(:,k+1)=x;
data=data(:,1:(k+1));
pnorm(k+1)=norm(delta_B)/norm(p);
pnorm=pnorm(1:(k+1));
%print results
    fprintf("%d\t",k);
    fprintf("%8.6e\t",x);
    fprintf("%8.6e\t",f);
    fprintf("%8.6e\t",grad_norm);
    fprintf("%8.6e\t",alpha);
    %fprintf("%8.6e\t",B);
    fprintf("%8.6e\n",norm_diff);
    %fprintf("B%d\n",k);
    %disp(compose('%8.6e',B));
xstar=x;
fstar=f;
end

