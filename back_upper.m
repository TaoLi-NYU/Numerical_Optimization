function [y] = back_upper(U,x)
%The is a funciton solves a given upper triangular system Ux=0 using backward
%substition
%  input: U the upper traingular for its diagonal elements, only u_{n,n}=0;
%         x the last component of the solution 
%  Ouput: y the solution given by U and x
N=length(U);
y=zeros(N,1);
y(N)=x;
for i=(N-1):-1:1
    numerator=0;
    for j=(i+1):N
        numerator=numerator+U(i,j)*y(j);
    end
    y(i)=-numerator/U(i,i);
end

end

