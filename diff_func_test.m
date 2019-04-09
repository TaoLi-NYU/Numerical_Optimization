function [y]=diff_func_test(x)
% the derivative of the function to be applied 
p=polyder([1,-3,-0.25,0.75]);
y=polyval(p,x);
end