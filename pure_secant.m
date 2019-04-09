function [x]=pure_secant(f,a,b,ftol,maxit)
% zero finding using pure secant
% f: function to be applied
% a,b: the two initial points
% stopping condition: abs(f)<ftol or the number of iter exceeds maxit
f0=f(a);
f1=f(b);
x0=a;
x1=b;
% check whether a or b is the zero point 
if f0==0
    x=a;
elseif f1==0
    x=b;
else
    f2=1;
    count=0;
    data=ones(1,maxit); % preallcoation
    while(f2~=0&&abs(f2)>ftol&&count<maxit)
        x2=x1-f1*(x1-x0)/(f1-f0); % update using secant method
        f2=f(x2);
        count=count+1;
        fprintf('%d\t',count);
        fprintf('x_k:%10.6e\t',x2);
        fprintf('f_k:%10.6e\t',f2);
        fprintf('x_k:%10.6e\t',x1);
        fprintf('f_k:%10.6e\n',f1);
        if(f2==f1) % check whether the two function evaluations have the same sign
            return 
        end
        x0=x1;
        x1=x2;
        f0=f1;
        f1=f2;
        data(count)=x2;
    end
    x=x2;
    y=data(1:count);
    %find the limit in case of no convergence 
    % generally, if the sequence converges, the last update: data(count) is the limit point
    % but if not, we shall find the limit point the sequence tends to converge
    % i.e. the root that is most close to the last update. 
    limit=[-0.5,0.5,3];
    dist=abs(limit-y(end));
    index=find(dist==min(dist));
    xlim=limit(index);
    % print related iteration results
    z=[b,y(1:end-1)];
    fprintf('x_k-x:\n');
    fprintf('%10.6e\n',y-xlim);
    fprintf('delta_k:\n');
    fprintf('%10.6e\n',abs((y-xlim)./(z-xlim)));
end
end

