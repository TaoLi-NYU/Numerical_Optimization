A=[1 3 4 5; -1 -2 -3 -1;-1 -1 -2 -3; 0 0 1 0;0 0 0 1];
C=combnk((1:5),4);
c=[-5 -6 -9 -8]';
for i=1:5
   index= C(i,:);
   W=A(index,:);
   if(rank(W)==4)
    lam=W'\c;
    fprintf('%d',index);
    fprintf('\n')
    fprintf('%8.6e\t',lam);
    fprintf('\n')
   end
end