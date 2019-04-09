C=combnk((1:8),4); %combination: choose 4 out of 8 rows
L=length(C);
c=[175 225 -200 450];
P=[-78 -240 -60 -800;55 2 15 34;12 14 32 45;7 12 210 7;1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
h=[-3000;65;25;700;0;0;0;0];% the linear system
data_vert=zeros(4,L);%preallocation
data_nonvert=zeros(4,L);
obj=zeros(1,L);
for i=1:L
    index=C(i,:);
    p=P(index,:);
    if rank(p)==4 % check linear independence
        x=linsolve(p,h(index));% solve the linear system 
        res=P*x-h;% compute the residual 
        if(find(res<0))%to check the feasibility
            data_nonvert(:,i)=x;% non vertex
        else
           data_vert(:,i)=x;% vertex
           obj(i)= c*x; %compute the objective
        end
            
    end
end
            
