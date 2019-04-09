function [x_opt] = mysimplex(A,b,c,x0,method)
%Find the optimal solution for a given linear programming using simplex
%method
%   input: A,b constraints
%           x0 a vertex
%           method: choose either textrule(1) or Bland's rule (0)
[M,N]=size(A); 
[flag,act_index,~]=workingset(A,b,x0); % determine the workingset
if (flag==false)
    disp('non-feasible');
    return
end
    
W=A(act_index,:);
lambda=W'\c;
min_lambda=min(lambda);

while(min_lambda<0)% if some component of lambda is less than zero
        j=find(lambda==min_lambda,1);% find the most negative component of lambda
        e_j=zeros(N,1);
        e_j(j)=1;
        p=W\e_j;%find the feasible direction
        %print the resutls of computation
        fprintf('%8.6e\t',x0);
        fprintf('\n');
        fprintf('%8.6e\t',lambda);
        fprintf('\n');
        fprintf('%8.6e\t',p);
        fprintf('\n');
        fprintf('%d\t',act_index)
        fprintf('\n');
        fprintf('%8.6e\n',c'*x0);
        nonwork_index=setdiff((1:M),act_index);%find the complement of working constrains
        A_nonwork=A(nonwork_index,:);
        ap=A_nonwork*p;
        D=nonwork_index(ap<0);%find the decreasing idle constraints
        if(D)% if D is  not empty
            gamma=(A(D,:)*x0-b(D))./(-A(D,:)*p);
            alpha=min(gamma);% determine the stepsize
            add_index=D((gamma==alpha));%determine candidates of the new index to ba added
            if(method)%textrule to determine the new index
                ap_D=A(add_index,:)*p;
                new=add_index(find(ap_D==min(ap_D),1));
            else% bland's rule
                new=add_index(1);
            end   
            act_index(j)=new;
        else
            disp('unbouded');
        return
        end
        fprintf('%8.6e\n',alpha);
        fprintf('----------------\n')
        x0=x0+alpha*p;
        % renew working set and lambda
        W(j,:)=A(new,:);
        lambda=W'\c;
        min_lambda=min(lambda);
end
x_opt=x0;  
% print the optimal point and related information
disp('optimal:')
fprintf('%8.6e\t',x0);
fprintf('\n');
fprintf('%8.6e\t',lambda);
fprintf('\n');
fprintf('%d\t',act_index)
fprintf('\n');
fprintf('%8.6e\n',c'*x0);
end

