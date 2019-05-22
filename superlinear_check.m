%this is to check the superlinear convergence
[~,N]=size(data);
%x=[1,1]';
x=[-0.5,-1,-10,-1000]';
%x=[-1,-2,-1]';
diff_data=data-x;
disp('k         x_k-x*       err   ' )
for i=1:N-1
    fprintf("%d\t",i-1);
    fprintf("%8.6e\t",norm(diff_data(:,i)));
    fprintf("%8.6e\n",norm(diff_data(:,i+1))/norm(diff_data(:,i)));
end
fprintf("%d\t",N-1);
fprintf("%8.6e\t",norm(diff_data(:,N)));