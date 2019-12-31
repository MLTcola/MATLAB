function [  ] = Deal(  )
%针对数据中总数写反进行聚类分析
clear;
clc;
tic
fileID='C:\Users\logan\Desktop\airplane_order_train_tichu.csv';
file=fopen(fileID,'r');
text=textscan(file,'%s',1);
data=textscan(file,'%s %s %d %d %d %d %d %s %d %d %s %s %d %d %d %d', 'delimiter', ',');
fclose(file);
%%
TianQi=data{8};
TianQiDeal=unique(TianQi);
[m,n]=size(TianQiDeal);
for i=1:m
a=find(strcmp(TianQi,TianQiDeal(i)));
data{8}(a)=num2cell(i);
data{8}(a);
end
outnum=1:m;
xlswrite('C:\Users\logan\Desktop\zhuanhuanjieguo.xlsx',outnum','A1:A200');
xlswrite('C:\Users\logan\Desktop\zhuanhuanjieguo.xlsx',TianQiDeal,'B1:B200');
%%
Feng=data{11};
FengDeal=unique(Feng);
[m,n]=size(FengDeal);
for i=1:m
a=find(strcmp(Feng,FengDeal(i)));
data{11}(a)=num2cell(i);
data{11}(a);
end
outnum=1:m;
xlswrite('C:\Users\logan\Desktop\zhuanhuanjieguo.xlsx',outnum','C1:C200');
xlswrite('C:\Users\logan\Desktop\zhuanhuanjieguo.xlsx',FengDeal,'D1:D200');
%%
HangBan=data{2};
HangBanDeal=unique(HangBan);
[m,n]=size(HangBanDeal);
for i=1:m
a=find(strcmp(HangBan,HangBanDeal(i)));
data{2}(a)=num2cell(i);
data{2}(a);
end
outnum=1:m;
xlswrite('C:\Users\logan\Desktop\zhuanhuanjieguo.xlsx',outnum','E1:E850');
xlswrite('C:\Users\logan\Desktop\zhuanhuanjieguo.xlsx',HangBanDeal,'F1:F850');
%%
KongQi=data{12};
KongQiDeal=unique(KongQi);
[m,n]=size(KongQiDeal);
for i=1:m
a=find(strcmp(KongQi,KongQiDeal(i)));
data{12}(a)=num2cell(i);
data{12}(a);
end
outnum=1:m;
xlswrite('C:\Users\logan\Desktop\zhuanhuanjieguo.xlsx',outnum','G1:G200');
xlswrite('C:\Users\logan\Desktop\zhuanhuanjieguo.xlsx',KongQiDeal,'H1:H200');
%%
table={'A1:A33822','B1:B33822','C1:C33822','D1:D33822','E1:E33822','F1:F33822','G1:G33822','H1:H33822','I1:I33822','J1:J33822','K1:K33822',...
    'L1:L33822','M1:M33822','N1:N33822','O1:O33822','P1:P33822'};
for i=1:16
xlswrite('C:\Users\logan\Desktop\DealFina.xlsx',data{i},table{i});
end
toc
end



