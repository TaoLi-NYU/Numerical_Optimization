function [y]=func_test(x)
% function to be applied in pure newton's, pure secant and fzero method
p=[1,-3,-0.25,0.75];
y=polyval(p,x);
end