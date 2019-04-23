%%   initialization
m=30;
n=100;
A=randi(50,[m,n]);
while(rank(A)<30)% make A a full rank
    A=randi(50,[m,n]);
end
x=rand(n,1);% initialize x0
b=A*x;
alpha=0.01;
beta=0.5;
gtol=1e-7;
maxit=100;
%% implementation 
%[sol,lambda]=newton_equ(@f_entropy,@df_entropy,@hf_entropy,A,x,alpha,beta,gtol,maxit);
%[sol2,lambda2]=infeasi_newton(@df_entropy,@hf_entropy,A,b,x,alpha,beta,gtol,maxit);
[sol3,lambda3]=infeasi_newton(@df_entropy,@hf_entropy,A,b,ones(n,1),alpha,beta,gtol,maxit);
%[sol4]=dual_newton(@f_dual,@df_dual,@hf_dual,A,b,alpha,beta,gtol,maxit);