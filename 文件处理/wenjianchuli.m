function [  ] = wenjianchuli(  )
clear
clc
%����txt�ļ�
%cell2matת����ͬ���͵�
fid=fopen('D:\MY\��ѧ��ģ\MATLAB����\�ļ�����\����.txt');
D.name=textscan(fid,'%s',7);
D.data=textscan(fid,'%s %d %d %d %d %d %s');%delimiter�Ƿָ���  collectoutputͬ�����ݷ���ͬһ��ϸ��������
fclose(fid);
D.data{7}{1};
D.data{4}(2);
D.name{1}{1};

%����csv�ļ�
fileID='D:\MY\��ѧ��ģ\MATLAB����\�ļ�����\����.csv';
file=fopen(fileID,'r');
text=textscan(file,'%s',7,'delimiter',',');
data=textscan(file,'%s %d %d %d %d %d %s','delimiter',',');
fclose(file);
for i=1:5
    d(:,i)=data{i+1};
end
text{1};
data{1};

%����xlsx�ļ�
fileID='D:\MY\��ѧ��ģ\MATLAB����\�ļ�����\����.xlsx';
xlRange = 'A1:G20';
[A,B] = xlsread(fileID, 'Sheet1', xlRange);%A����ֵB���ַ���
A;
B(:,1);
xlswrite('D:\MY\��ѧ��ģ\MATLAB����\�ļ�����\1.xlsx',B,1,xlRange);
xlswrite('D:\MY\��ѧ��ģ\MATLAB����\�ļ�����\1.xlsx',A,1,'B2:F20');
end

