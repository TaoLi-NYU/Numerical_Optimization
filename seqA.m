function [y]=seqA(~,k)
% iterivative scheme for sequence A
% input k: index for x_k; output y: x_{k+1}
y = 0.95^(k^2);
end