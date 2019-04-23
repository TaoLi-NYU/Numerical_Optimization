%%
%Problem 1
alpha1=0.1;
beta1=0.7;
x1=[0,0]';
ftol=1e-8;
[y1] = gradient_backtracking(@f_opt,@df_opt,alpha1,beta1,x1,ftol);
%%
%Problem 2
x2=[0.25 0.25 0.25]';
w1=[1 1 1]';
w2=[1 2 3]';
[y2] = gradient_backtracking_w(@f_w,@df_w,alpha1,beta1,x2,w1,ftol);
[y3] = gradient_backtracking_w(@f_w,@df_w,alpha1,beta1,x2,w2,ftol);
%%
%Problem 6
alpha2=0.01;
beta2=0.5;
maxit=1000;
gtol=1e-8;
m=300;
n=200;
%[center] = damped_newton_center(@f_center,@df_center,@hf_center,m,n,alpha2,beta2,gtol,maxit);
[center2]=grad_bt_center(@f_center,@df_center,m,n,alpha2,beta2,gtol,maxit);



