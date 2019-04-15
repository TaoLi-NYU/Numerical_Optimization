function [nabla] = df_opt(x)
%This function gives the gradient of f_opt at x
%  
nabla=zeros(2,1);
nabla(1)=exp(x(1)+3*x(2)-0.1)+exp(x(1)-3*x(2)-0.1)-exp(-x(1)-0.1);
nabla(2)=3*exp(x(1)+3*x(2)-0.1)-3*exp(x(1)-3*x(2)-0.1);
end

