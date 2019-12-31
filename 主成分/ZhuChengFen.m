function [  ] = ZhuChengFen(  )
clear
clc
tic

A=xlsread('D:\资料库区\大三上\HUAWEI\MATLAB\主成分分析.xls','B3:I17');
%得到的数据矩阵的行数和列数
a=size(A,1);
b=size(A,2);
%数据的标准化处理:得到标准化后的矩阵SA
for i=1:b
    SA(:,i)=(A(:,i)-mean(A(:,i)))/std(A(:,i));
end
%计算系数矩阵:CM
CM=corrcoef(SA);
%计算CM的特征值和特征向量
[V,D]=eig(CM);
%将特征值按降序排列到DS中
for j=1:b
    DS(j,1)=D(b+1-j,b+1-j);
end
%计算贡献率
for i=1:b
    DS(i,2)=DS(i,1)/sum(DS(:,1));%单个贡献率
    DS(i,3)=sum(DS(1:i,1))/sum(DS(:,1));%累计贡献率
end
%假定主成分的信息保留率
T=0.9;
for k=1:b
    if DS(k,3) >= T
        com_num=k;
        break;
    end
end
%提取主成分的特征向量
for j=1:com_num
    PV(:,j)=V(:,b+1-j);
end
%计算主成分得分
new_score=SA*PV;
for i=1:a
    total_score(i,1)=sum(new_score(i,:));
    total_score(i,2)=i;
end
%强主成分得分与总分放到同一个矩阵中
result_report=[new_score,total_score];
%按总分降序排列
result_report=sortrows(result_report,-4);
%输出结果
disp('特征值、贡献率、累计贡献率：')
DS
disp('信息保留率T对应的主成分数与特征向量：')
com_num
PV
disp('主成分得分及排序（按第4列的总分进行降序排列，前3列为个各成分得分，第5列为企业编号）')
result_report

toc

end

