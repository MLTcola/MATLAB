function [  ] = shizilukou(  )

V=1;%�����ٶ�
N=6;%������
L=20;%��������
cl=2;%��������
cd=1;%�������
leftrand=0.3;%��ת����
rightrand=0.3;%��ת����
strghtrand=0.7;%ֱ�и���
carstate=0;%����״̬ 1��ת��2��ת��3ֱ��
xia3x=L+N+1;xia3y=L+3;
B=ones(2*L+N);
image(B);
hold on
B(L+1:L+N,:)=30;%��
B(:,L+1:L+N)=30;%��
% B(L+N+1:end,L+1:L+N)=30;%��
% B(L+1:L+N,L+N+1:end)=30;%��
j=1;
for i=L+N+1:L*2+N
    if rem(j,cl+cd)==0
        B(i,L+3:L+N)=30;
    else
    B(i,L+3:L+N)=90;
    end
    j=j+1;
end
j=0;
while(1)
    if xia3x>L+2
         B(xia3x-1,xia3y)=90;B(xia3x+1,xia3y)=30;xia3x=xia3x-1;xia3y=xia3y;
    else     
        if j==0
            B(xia3x+1,xia3y)=30;B(xia3x,xia3y-1)=90;xia3x=xia3x;xia3y=xia3y-1;
            j=j+1;
        else
            B(xia3x,xia3y+1)=30;B(xia3x,xia3y-1)=90;xia3x=xia3x;xia3y=xia3y-1;
        end
    end
    if B(L+N+1,L+3)+B(L+N+2,L+3)==60
        B(L+N+1,L+3)=90;
        B(L+N+2,L+3)=90;
    end
pause(V);
image(B);
end
end

