function [y] = back_upper(U,x)
%This funciton solves a given upper triangular system Ux=0 using backward
%substition
%  input: U the upper traingular for its diagonal elements, only u_{n,n}=0;
%         x the last component of the solution 
%  Ouput: y the solution given by U and x
N=length(U); % the dimension of the matrix
y=zeros(N,1); %preallocation for the solution
y(N)=x;
for i=(N-1):-1:1 %from the bottom to the top
    numerator=0;
    for j=(i+1):N
        numerator=numerator+U(i,j)*y(j); %compute the numerator
    end
    fprintf('%8.6e\n',numerator);
    y(i)=-numerator/U(i,i); %i-th component of the solution 
end

end

