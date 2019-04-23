x=[0 1 0]';
eta=0.01;
beta=0.5;
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
    while true
        alpha=1;
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
    fprintf("%8.6e\t",p);
    fprintf("%8.6e\t",d);
    fprintf("%8.6e\n",q);
    x=x+alpha*p;
end

