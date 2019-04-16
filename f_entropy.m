function [f] = f_entropy(x)
%This function computes the additive inverse of the entropy
%and is defined in Problem 7 HW5
f=x'*log(x);
end

