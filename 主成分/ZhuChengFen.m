function [  ] = ZhuChengFen(  )
clear
clc
tic

A=xlsread('D:\���Ͽ���\������\HUAWEI\MATLAB\���ɷַ���.xls','B3:I17');
%�õ������ݾ��������������
a=size(A,1);
b=size(A,2);
%���ݵı�׼������:�õ���׼����ľ���SA
for i=1:b
    SA(:,i)=(A(:,i)-mean(A(:,i)))/std(A(:,i));
end
%����ϵ������:CM
CM=corrcoef(SA);
%����CM������ֵ����������
[V,D]=eig(CM);
%������ֵ���������е�DS��
for j=1:b
    DS(j,1)=D(b+1-j,b+1-j);
end
%���㹱����
for i=1:b
    DS(i,2)=DS(i,1)/sum(DS(:,1));%����������
    DS(i,3)=sum(DS(1:i,1))/sum(DS(:,1));%�ۼƹ�����
end
%�ٶ����ɷֵ���Ϣ������
T=0.9;
for k=1:b
    if DS(k,3) >= T
        com_num=k;
        break;
    end
end
%��ȡ���ɷֵ���������
for j=1:com_num
    PV(:,j)=V(:,b+1-j);
end
%�������ɷֵ÷�
new_score=SA*PV;
for i=1:a
    total_score(i,1)=sum(new_score(i,:));
    total_score(i,2)=i;
end
%ǿ���ɷֵ÷����ַܷŵ�ͬһ��������
result_report=[new_score,total_score];
%���ֽܷ�������
result_report=sortrows(result_report,-4);
%������
disp('����ֵ�������ʡ��ۼƹ����ʣ�')
DS
disp('��Ϣ������T��Ӧ�����ɷ���������������')
com_num
PV
disp('���ɷֵ÷ּ����򣨰���4�е��ֽܷ��н������У�ǰ3��Ϊ�����ɷֵ÷֣���5��Ϊ��ҵ��ţ�')
result_report

toc

end

