function [  ] = duoyuanxianxinghuigui(  )
clear
clc

x1=[7 1 11 11 7 11 3 1 2 21 1 11 10];
x2=[26 29 56 31 52 55 71 31 54 47 40 66 68];
x3=[6 15 8 8 6 9 17 22 18 4 23 9 8];
x4=[60 52 20 47 33 22 6 44 22 26 34 12 12];
y=[78.5 74.3 104.3 87.6 95.9 109.2 102.7 72.5 93.1 115.9 83.8 113.3 109.4];
X=[ones(length(y),1),x1',x2',x3',x4'];%把行向量转换成列向量    第一列是常数项，不明白为啥是1
Y=y';%把行向量转换成列向量

%{
B：回归系数，是个向量（“the vector B of regression coefficients in the  linear model Y = X*B”）。
BINT：回归系数的区间估计（“a matrix BINT of 95% confidence intervals for B”）。
R：残差（ “a vector R of residuals”）。
RINT：置信区间（“a matrix RINT of intervals that can be used to diagnose outliers”）。
STATS：用于检验回归模型的统计量。有4个数值：判定系数R^2，F统计量观测值，检验的p的值，误差方差的估计。
ALPHA：显著性水平（缺少时为默认值0.05）。
%}
[b,bint,r,rint,stats]=regress(Y,X);
b
r
rint
figure
rcoplot(r,rint);
z=b(1)+b(2)*x1+b(3)*x2+b(4)*x3+b(5)*x4;
figure
plot(X,Y,'k+',X,z,'r');
end

