x=[0 1 0]';
eta=0.01;
beta=0.5;
k=1;
disp('iter       q(1)            q(2)             q(3)            |q|            Q');
while true
    H=Hessian_curv(x);
    [V,D]=eig(H);%eigendecomposition
    eigv=diag(D);
    m=min(eigv);
    if(m>=0)% all eigenvalues are non-negative
        break;
    else
        index=find(eigv==m);% find the most negative eignvlaue
        p=V(:,index(1));% negative curvture is chosen as corresponding eigenvector
    end
    g=grad_curv(x);
    d=p'*g;% compute g transpose p
    if(d>0)
        p=-p;% descent direction
    end
    %backtracking
    alpha=1;
    while true
        F_delta=F_curv(x)-F_curv(x+alpha*p);
        Q_delta=alpha*g'*p+0.5*alpha^2*p'*H*p;
        rho=F_delta/-Q_delta;
        if (rho>=eta)
            break;
        else
            alpha=beta*alpha;
        end
    end
    q=p'*H*p;
    fprintf("%d\t",k)
    fprintf("%8.6e\t",p);
    fprintf("%8.6e\t",norm(p));
    fprintf("%8.6e\n",q);
    x=x+alpha*p;
    k=k+1;
end

