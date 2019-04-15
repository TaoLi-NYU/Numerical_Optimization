function [y] = f_opt(x)
%This function is defined in HW5 problem 1
%   
y=exp(x(1)+3*x(2)-0.1)+exp(x(1)-3*x(2)-0.1)+exp(-x(1)-0.1);
end

