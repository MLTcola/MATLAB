function [ ] = mubiaoguihua(  )

clc
clear
f=[-0.18 -0.1 -0.09 -0.12]';
a=[1 -1 -1 -1
    0 -1 -1 1];
b=[0 0]';
aeq=[1 1 1 1];
beq=[1];
lb=zeros(4,1);
[x,fval]=linprog(f,a,b,aeq,beq,lb)
end

