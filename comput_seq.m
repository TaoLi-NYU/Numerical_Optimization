% This code is for computing the four values required in part 2, exercise 1.1
func={@seqA, @seqB, @seqC, @seqD, @seqE};% define function handles
X=[0,sqrt(2),0,1,1];% the limits for five sequences
x0=[1,9,1/15,3.2,12];% the initial points for five sequences
k=10; 
data=zeros(4,k+1,5); % preallocation memory for data storage

for i=1:5
    t=seq(func{i},k,x0(i));% compute the x_1 to x_k in ith sequence with initial x0(i)
    x=[x0(i),t]; 
    e=x-X(i); %compute e_k
    y=seq(func{i},k+1,x0(i));% compute the x_1 to x_k+1 in ith sequence with initial x0(i)
    delta=abs((y-X(i))./(x-X(i))); %compute delta_k
    rho=abs((y-x)./(x-X(i))); %compute rho_k
    data(:,:,i)=[x;e;delta;rho];
    fprintf('seq %d\n',i);
    fprintf('x:\n');
    fprintf('%14.6e\n', x);
    
    fprintf('e:\n');
    fprintf('%14.6e\n', e);

    fprintf('delta:\n');
    fprintf('%14.6e\n', delta);

    fprintf('rho:\n');
    fprintf('%14.6e\n', rho);
    
   fprintf('d2:\n');
   fprintf('%14.6e\n',abs((y-X(i))./(x-X(i)).^2))
end
    