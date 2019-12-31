function [  ] = duoyuanxianxinghuigui(  )
clear
clc

x1=[7 1 11 11 7 11 3 1 2 21 1 11 10];
x2=[26 29 56 31 52 55 71 31 54 47 40 66 68];
x3=[6 15 8 8 6 9 17 22 18 4 23 9 8];
x4=[60 52 20 47 33 22 6 44 22 26 34 12 12];
y=[78.5 74.3 104.3 87.6 95.9 109.2 102.7 72.5 93.1 115.9 83.8 113.3 109.4];
X=[ones(length(y),1),x1',x2',x3',x4'];%��������ת����������    ��һ���ǳ����������Ϊɶ��1
Y=y';%��������ת����������

%{
B���ع�ϵ�����Ǹ���������the vector B of regression coefficients in the  linear model Y = X*B������
BINT���ع�ϵ����������ƣ���a matrix BINT of 95% confidence intervals for B������
R���в ��a vector R of residuals������
RINT���������䣨��a matrix RINT of intervals that can be used to diagnose outliers������
STATS�����ڼ���ع�ģ�͵�ͳ��������4����ֵ���ж�ϵ��R^2��Fͳ�����۲�ֵ�������p��ֵ������Ĺ��ơ�
ALPHA��������ˮƽ��ȱ��ʱΪĬ��ֵ0.05����
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

