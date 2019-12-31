function [  ] = guiuyihua(  )
clear
clc
%读入csv文件
fileID='D:\MY\数学建模\MATLAB程序\文件处理\数据.csv';
file=fopen(fileID,'r');
text=textscan(file,'%s',7,'delimiter',',');
data=textscan(file,'%s %d %d %d %d %d %s','delimiter',',');
fclose(file);
for i=1:5
    d(:,i)=data{i+1};
end
[B,ps]=mapminmax(double(d'),0,1);%最重要的是加上double,,,,,,,,,,,mapminmax这个就是对    行    进行归一化
B';
A2= mapminmax('reverse',B,ps);%对数据进行反归一化，恢复原来的数据


datahang=d(:)';%把所有的数据变换成一行，对所有数据进行统一归一化
[B,ps]=mapminmax(double(datahang),0,1);
d=reshape(B,size(d));%转换成原来的形式
B'
d
end

