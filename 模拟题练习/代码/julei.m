function [  ] = julei(  )
%针对数据中总数写反进行聚类分析
clear;
clc;
tic
fileID='C:\Users\logan\Desktop\B题 航食数据\train\airplane_order_train.csv';
file=fopen(fileID,'r');
text=textscan(file,'%s',1);
data=textscan(file,'%d %s %d %s %d %d %d %d %d %d %d', 'delimiter', ',');
fclose(file);
HangBan=data{2};
HangBanDeal=unique(HangBan);
[m,n]=size(HangBanDeal);
% for i=2:size(HangBanDeal)
for i=2:m
    a=find(strcmp(HangBan,HangBanDeal(i)));
    Tou=data{8}(a);
    Gong=data{9}(a);
    Jing=data{10}(a);
    Qi=data{11}(a);
    
    b=0:max(Tou);
    c=histc(Tou,b);%数据中数的出现次数
    [max_num,max_index]=max(c);
    data{8}(a)=max_index;
    
    b=0:max(Gong);
    c=histc(Gong,b);%数据中数的出现次数
    [max_num,max_index]=max(c);
    data{9}(a)=max_index;
    
    b=0:max(Jing);
    c=histc(Jing,b);%数据中数的出现次数
    [max_num,max_index]=max(c);
    data{10}(a)=max_index;
    
    b=0:max(Qi);
    c=histc(Qi,b);%数据中数的出现次数
    [max_num,max_index]=max(c);
    data{11}(a)=max_index;
end
table={'A1:A768343','B1:B768343','C1:C768343','D1:D768343','E1:E768343','F1:F768343','G1:G768343','H1:H768343','I1:I768343','J1:J768343','K1:K768343'};
% xlswrite('C:\Users\logan\Desktop\julei.txt',data);
for i=1:11
xlswrite('C:\Users\logan\Desktop\julei.xlsx',data{i},table{i});
end
toc
end

