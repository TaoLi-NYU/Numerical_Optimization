function [f] = fbar(x)
%This function evaluates f_bar at x
f=sum(x)+0.5*(2*x(1)^2+x(2)^2+0.1*x(3)^2+0.001*x(4)^2);
end

