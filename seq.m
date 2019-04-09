function [y] = seq(f,k,x0)
%To compute x_k of a given sequence whose iterative scheme is f , given the initial x0
%   f: function handle decsribing the iterative scheme
%   k: the index of kth member in {x_k}
%   x0: initial point
if k==0
    y=x0;
else
    x_iter=x0;
    y=zeros(1,k);
    for i=1:k
        y(i)=f(x_iter,i);
        x_iter=y(i);
    end

end

end

