function [  ] = shujushaixuan(  )
clear;
clc;
tic
fileID='C:\Users\logan\Desktop\B题 航食数据\test\airplane_order_test.csv';
file=fopen(fileID,'r');
text=textscan(file,'%s',1);
data=textscan(file,'%d %s %d %s %d %d %d %d %d %d %d', 'delimiter', ',');
fclose(file);
% datenum(data{4}{1})%日期转换成数字
% datenum('2016/11/2')
dateStart=datenum('2016/11/1');
dateEnd=datenum('2016/12/31');
date=dateStart:dateEnd;
% datestr(736695,26);%数值转换成日期
HangBan=data{2};
HangBanDeal=unique(HangBan);
[m,n]=size(HangBanDeal);
out=zeros(m,3);
x=1;
y=1;
d=-1;
    for j=2:m
        x=1;
        d=d+1;
      for k=dateStart:dateEnd
                a=find(strcmp(HangBan,HangBanDeal{j}));
                data1=data{4}(a);
                 b=find(strcmp(data1,datestr(k,29)));
                 outpre1=sum(data{5}(a(b)));
                 outpre2=sum(data{6}(a(b)));
                 outpre3=sum(data{7}(a(b)));
                 y=1+d;
                out(x,y)=outpre1;
                y=y+1+d;
                out(x,y)=outpre2;
                y=y+1+d;
                out(x,y)=outpre3;
                 x=x+1;
  %              data{5}(a(b))
                 xlswrite('C:\Users\logan\Desktop\1.xls',out);
                end
    end

toc
end

