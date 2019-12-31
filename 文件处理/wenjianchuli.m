function [  ] = wenjianchuli(  )
clear
clc
%读入txt文件
%cell2mat转换相同类型的
fid=fopen('D:\MY\数学建模\MATLAB程序\文件处理\数据.txt');
D.name=textscan(fid,'%s',7);
D.data=textscan(fid,'%s %d %d %d %d %d %s');%delimiter是分隔符  collectoutput同类数据放在同一个细胞数组下
fclose(fid);
D.data{7}{1};
D.data{4}(2);
D.name{1}{1};

%读入csv文件
fileID='D:\MY\数学建模\MATLAB程序\文件处理\数据.csv';
file=fopen(fileID,'r');
text=textscan(file,'%s',7,'delimiter',',');
data=textscan(file,'%s %d %d %d %d %d %s','delimiter',',');
fclose(file);
for i=1:5
    d(:,i)=data{i+1};
end
text{1};
data{1};

%读入xlsx文件
fileID='D:\MY\数学建模\MATLAB程序\文件处理\数据.xlsx';
xlRange = 'A1:G20';
[A,B] = xlsread(fileID, 'Sheet1', xlRange);%A是数值B是字符串
A;
B(:,1);
xlswrite('D:\MY\数学建模\MATLAB程序\文件处理\1.xlsx',B,1,xlRange);
xlswrite('D:\MY\数学建模\MATLAB程序\文件处理\1.xlsx',A,1,'B2:F20');
end

