function F=fangcheng(x)
Fwind=x(1);%风力
unuse=x(2);
alph1=0;%弧度<0.2793
d=x(3);%吃水深度 0.5
F1=x(4);F2=x(5);F3=x(6);F4=x(7);F5=x(8);theta1=x(9);theta2=x(10);theta3=x(11);theta4=x(12);
beta=x(13);gama1=x(14);gama2=x(15);gama3=x(16);gama4=x(17);gama5=x(18);
x1=x(19);%锚链末端横坐标
%%
Vwind=24;%风速
H=18;%水深
p=1025;%海水密度
sigma=7;
g=9.8;%重力加速度
Mball=1200*0.869426751592357;%重物球质量
maolian=22.05;%锚链长度
maolian=maolian-x(2);%减去沉在海底的长度
floatage_bucket=0.15*0.15*pi*p;%钢桶浮力
floatage_pipe=0.025*0.025*pi*p;%钢管浮力
F=ones(19,1);
%%
y=@(t)(Fwind/sigma/g*cosh(sigma*g*t/Fwind+asinh(tan(alph1)))-Fwind/sigma/g*cosh(asinh(tan(alph1))));
Dy=@(t)(sqrt(1+(sinh(sigma*g*t/Fwind+asinh(tan(alph1)))).^2));
xx=0:0.001:x1;
yy=y(xx);
xx=[0:0.001:unuse,xx+unuse+0.001];
u=length(0:0.001:unuse);
yy=[zeros(1,u),yy];
plot(xx,yy,'LineWidth',3,'markersize',8)
set(gca,'xtick',[0:x1+unuse+1],'ytick',[0:yy(end)+1])
title('锚链形状')
xlabel('锚链投影长度/m')
ylabel('距离海底高度/m')
grid on
R=sin(beta)+sin(theta1)+sin(theta2)+sin(theta3)+sin(theta4)+xx(end)-0.001
F(1)=quad(Dy,0,x1)-maolian;%锚链长度
alph2=atan(sinh(sigma*g*x1/Fwind+asinh(tan(alph1))));
y1=y(x1)
%钢桶
F(2)=F1*sin(gama1-beta)+Fwind/cos(alph2)*sin(pi/2-alph2-beta)-Mball*g*sin(beta);
%力矩平衡
F(3)=F1*cos(gama1)+floatage_bucket-100*g-Mball*g-Fwind*tan(alph2);% 竖 直 受力平衡
F(4)=F1*sin(gama1)-Fwind;%水平受力平衡
%4 个钢管力矩平衡
F(5)=F1*sin(gama1-theta1)-F2*sin(theta1-gama2);
F(6)=F2*sin(gama2-theta2)-F3*sin(theta2-gama3);
F(7)=F3*sin(gama3-theta3)-F4*sin(theta3-gama4);
F(8)=F4*sin(gama4-theta4)-F5*sin(theta4-gama5);
%4 个钢管水平受力平衡
F(9)=F2*sin(gama2)-Fwind;
F(10)=F3*sin(gama3)-Fwind;
F(11)=F4*sin(gama4)-Fwind;
F(12)=F5*sin(gama5)-Fwind;
%4 个钢管竖直受力平衡
F(13)=F1*cos(gama1)+10*g-F2*cos(gama2)-floatage_pipe;
F(14)=F2*cos(gama2)+10*g-F3*cos(gama3)-floatage_pipe;
F(15)=F3*cos(gama3)+10*g-F4*cos(gama4)-floatage_pipe;
F(16)=F4*cos(gama4)+10*g-F5*cos(gama5)-floatage_pipe;
F(17)=F5*cos(gama5)+1000*g-pi*d*p*g;%浮标竖直受力
F(18)=y1+cos(beta)+cos(theta1)+cos(theta2)+cos(theta3)+cos(theta4)+d-H;%水深
F(19)=2*(2-d)*0.625*Vwind*Vwind-Fwind;%风力

end

