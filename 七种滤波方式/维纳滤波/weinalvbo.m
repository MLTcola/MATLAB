function [  ] = weinalvbo(  )
clear;
close all;
clc;
sita=0:pi/249.5:2*pi;
xnoise=sqrt(0.05)*randn(1,500);%产生X轴方向噪声
ynoise=sqrt(0.06)*randn(1,500);%产生Y方向噪声
x=cos(sita)+xnoise;%产生X轴方向观测信号
y=sin(sita)+ynoise;%产生Y轴方向观测信号
figure
plot(y);
%产生维纳滤波中x放向上的观测信号的自相关矩阵
rxx=xcorr(x);
for i=1:100
    for j=1:100
        mrxx(i,j)=rxx(500-i+j);
    end
end
xd=cos(sita);
%产生维纳滤波中X方向上观测信号与期望信号的互相关矩阵
rxd=xcorr(x,xd);
for i=1:100
    mrxd(i)=rxd(499+i);
end
hoptx=inv(mrxx)*mrxd';%由维纳—霍夫方程得到的X方向上的滤波器最优解
fx=conv(x,hoptx);%滤波后X方向上的输出
nx=sum(abs(xd).^2);
eminx=nx-mrxd*hoptx;%x方向上最小均方误差

%产生维纳滤波中Y方向上观测信号的自相关矩阵
ryy=xcorr(y);
for i=1:100
    for j=1:100
        mryy(i,j)=ryy(500-i+j);
    end
end
yd=sin(sita);
%产生维纳滤波中Y方向上观测信号与期望信号的互相关矩阵
ryd=xcorr(y,yd);
for i=1:100
    mryd(i)=ryd(499+i);
end
hopty=inv(mryy)*mryd';%由维纳—霍夫方程的得到的Y方向上的滤波器最优解
fy=conv(y,hopty);%滤波后Y方向上的输出
ny=sum(abs(yd).^2);
eminy=ny-mryd*hopty;%y方向上最小均方误差
figure
plot(fx,fy);
figure
subplot(2,4,1);
plot(xd);
title('x方向上期望信号');
subplot(2,4,2);
plot(xnoise);
title('x方向噪声信号');
subplot(2,4,3);
plot(x);
title('x方向观测信号');
subplot(2,4,4);
n=0:500;
plot(n,eminx);
title('x方向最小均方误差');
subplot(2,4,5);
plot(yd);
title('y方向期望信号');
subplot(2,4,6);
plot(ynoise);
title('y方向噪声信号');
subplot(2,4,7);
plot(y);
title('y方向观测信号');
subplot(2,4,8);
plot(n,eminy);
title('y方向最小均方误差');
figure;
plot(xd,yd,'k');
hold on;
plot(x,y,'b:');
hold on;
plot(fx,fy,'g-');
title('最终结果');
end




