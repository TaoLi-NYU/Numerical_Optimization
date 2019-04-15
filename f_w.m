function [f]=f_w(w,x)
% The original function is defined in HW5 problem 2 and here we compute its
% additive inverse, since our backtracking is for minimization
% w is the weight vector
f=w'*log(x)-1/(1-x(1)-x(2)-x(3))^2;
f=-f;% additive inverse
end
