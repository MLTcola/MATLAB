function [  ] = guiuyihua(  )
clear
clc
%����csv�ļ�
fileID='D:\MY\��ѧ��ģ\MATLAB����\�ļ�����\����.csv';
file=fopen(fileID,'r');
text=textscan(file,'%s',7,'delimiter',',');
data=textscan(file,'%s %d %d %d %d %d %s','delimiter',',');
fclose(file);
for i=1:5
    d(:,i)=data{i+1};
end
[B,ps]=mapminmax(double(d'),0,1);%����Ҫ���Ǽ���double,,,,,,,,,,,mapminmax������Ƕ�    ��    ���й�һ��
B';
A2= mapminmax('reverse',B,ps);%�����ݽ��з���һ�����ָ�ԭ��������


datahang=d(:)';%�����е����ݱ任��һ�У����������ݽ���ͳһ��һ��
[B,ps]=mapminmax(double(datahang),0,1);
d=reshape(B,size(d));%ת����ԭ������ʽ
B'
d
end

