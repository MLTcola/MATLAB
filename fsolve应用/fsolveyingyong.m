function [  ] = fsolveyingyong(  )
x0=[1372.4,6,0.78,14496.80,14592.35,14687.92,14783.49,14879.07,0.09,0.09,0.09,0.09,0.09,0.09,0.09,0.09,0.09,0.09,17.75]';
options=optimset('MaxFunEvals',1e4,'MaxIter',1e4);
format long
[x,fval,exitflag]=fsolve(@fangcheng,x0,options)%…Ë÷√≥ı÷µ
x(9:18)=x(9:18)/pi*180
end

