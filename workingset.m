function [flag,work_index,act_num] = workingset(A,b,x)
% This function is to find the working set at a vertex x
%   input : A ,b are the linear constraints; x is the given point
%   output: flag: true if x is a vertex; false if not
%           act_index: an array whose elements are the index of active
%           constraints
%           act_num: the length of act_index showing the number of active
%           constraints
r=A*x-b;
if(find(r<-3e-13))% not feasible
    disp('not feasible');
    flag=false;
    return
end
work_index=find(r==0);% count the active constraints
act_num=length(work_index);
flag=true;
if(act_num>rank(A(work_index,:)))% if it is a degenerate vertex, the workingset shall be 
    disp('a degenerate vertex');% determined by users
    work_index=input('please specify the workingset:');
end
% if it is a nondegenerate, ouput the flag, workingset 
end

