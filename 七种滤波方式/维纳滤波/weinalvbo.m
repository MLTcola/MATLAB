function [  ] = weinalvbo(  )
clear;
close all;
clc;
sita=0:pi/249.5:2*pi;
xnoise=sqrt(0.05)*randn(1,500);%����X�᷽������
ynoise=sqrt(0.06)*randn(1,500);%����Y��������
x=cos(sita)+xnoise;%����X�᷽��۲��ź�
y=sin(sita)+ynoise;%����Y�᷽��۲��ź�
figure
plot(y);
%����ά���˲���x�����ϵĹ۲��źŵ�����ؾ���
rxx=xcorr(x);
for i=1:100
    for j=1:100
        mrxx(i,j)=rxx(500-i+j);
    end
end
xd=cos(sita);
%����ά���˲���X�����Ϲ۲��ź��������źŵĻ���ؾ���
rxd=xcorr(x,xd);
for i=1:100
    mrxd(i)=rxd(499+i);
end
hoptx=inv(mrxx)*mrxd';%��ά�ɡ����򷽳̵õ���X�����ϵ��˲������Ž�
fx=conv(x,hoptx);%�˲���X�����ϵ����
nx=sum(abs(xd).^2);
eminx=nx-mrxd*hoptx;%x��������С�������

%����ά���˲���Y�����Ϲ۲��źŵ�����ؾ���
ryy=xcorr(y);
for i=1:100
    for j=1:100
        mryy(i,j)=ryy(500-i+j);
    end
end
yd=sin(sita);
%����ά���˲���Y�����Ϲ۲��ź��������źŵĻ���ؾ���
ryd=xcorr(y,yd);
for i=1:100
    mryd(i)=ryd(499+i);
end
hopty=inv(mryy)*mryd';%��ά�ɡ����򷽳̵ĵõ���Y�����ϵ��˲������Ž�
fy=conv(y,hopty);%�˲���Y�����ϵ����
ny=sum(abs(yd).^2);
eminy=ny-mryd*hopty;%y��������С�������
figure
plot(fx,fy);
figure
subplot(2,4,1);
plot(xd);
title('x�����������ź�');
subplot(2,4,2);
plot(xnoise);
title('x���������ź�');
subplot(2,4,3);
plot(x);
title('x����۲��ź�');
subplot(2,4,4);
n=0:500;
plot(n,eminx);
title('x������С�������');
subplot(2,4,5);
plot(yd);
title('y���������ź�');
subplot(2,4,6);
plot(ynoise);
title('y���������ź�');
subplot(2,4,7);
plot(y);
title('y����۲��ź�');
subplot(2,4,8);
plot(n,eminy);
title('y������С�������');
figure;
plot(xd,yd,'k');
hold on;
plot(x,y,'b:');
hold on;
plot(fx,fy,'g-');
title('���ս��');
end




