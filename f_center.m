function [y] = f_center(A,x)
%This function is defined in Problem 4 HW5
% the rows of A consist of the normal vector of lienar equalities
y=-sum(log(1-A*x)) - sum(log(1+x)) - sum(log(1-x));
end

