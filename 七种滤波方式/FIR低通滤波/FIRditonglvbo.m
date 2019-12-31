function [  ] = FIRditonglvbo(  )

%****************************************************************************************
%  
%                      创建两个信号Mix_Signal_1 和信号 Mix_Signal_2 
%
%***************************************************************************************

Fs = 1000;                                                                        %采样率
N  = 1000;                                                                        %采样点数
n  = 0:N-1;
t   = 0:1/Fs:1-1/Fs;                                                            %时间序列 
Signal_Original_1 =sin(2*pi*10*t)+sin(2*pi*20*t)+sin(2*pi*30*t); 
Noise_White_1    = [0.3*randn(1,500), rand(1,500)];           %前500点高斯分部白噪声，后500点均匀分布白噪声
Mix_Signal_1   = Signal_Original_1 + Noise_White_1;        %构造的混合信号

Signal_Original_2  =  [zeros(1,100), 20*ones(1,20), -2*ones(1,30), 5*ones(1,80), -5*ones(1,30), 9*ones(1,140), -4*ones(1,40), 3*ones(1,220), 12*ones(1,100), 5*ones(1,20), 25*ones(1,30), 7 *ones(1,190)]; 
Noise_White_2     =  0.5*randn(1,1000);                                 %高斯白噪声
Mix_Signal_2        =  Signal_Original_2 + Noise_White_2;      %构造的混合信号


%****************************************************************************************
%  
%                信号Mix_Signal_1 和 Mix_Signal_2  分别作FIR低通滤波。
%
%***************************************************************************************
%{
窗函数法,b=fir1(n,Wn,WIN)b为得到的滤波器系数，n为阶数，Wn是0到1的数，表示归一化截止频率，WIN为窗口系数，默认为海明窗。窗函数设计有rectwin，chebwin等。
多带设计法，针对不同频带有不同的衰减要求设计。又有：
函数b=fir2(n,f,m,npt,lap)f和m是描述频域特性曲线的向量，npt是插值点数，lap是重叠带点数。
函数b=firls(n,f,m,w)w为各频段的权值
函数b=remez(n,f,m)
约束最小二乘法设计，使用户在设计FIR滤波器的时无需定义幅值响应中的过渡带。H=fircls(n,f,a,up,lo)up和lo长度和a相等时分别描述各频带上限和下限的向量。a的长度和f不必相等。
任意响应滤波器设计，频域上响应不对称b=crmez(n,f,{‘fresp’,p1,p2,…})其中，fresp为声明目标频率响应特性的名称函数，p1等为fresp的相关函数。
%}
%混合信号 Mix_Signal_1  FIR低通滤波
figure(2);
F   =  [0:0.05:0.95]; %F和A有相同的长度
A  =  [1    1      0     0     0    0      0     0     0    0     0     0     0     0     0     0    0   0   0   0] ;
b  =  firls(20,F,A);
Signal_Filter = filter(b,1,Mix_Signal_1);

subplot(4,1,1);                                          %Mix_Signal_1 原始信号                 
plot(Mix_Signal_1);
axis([0,1000,-4,4]);
title('原始信号 ');

subplot(4,1,2);                                          %Mix_Signal_1 FIR低通滤波滤波后信号  
plot(Signal_Filter);
axis([0,1000,-5,5]);
title('FIR低通滤波后的信号');

%混合信号 Mix_Signal_2  FIR低通滤波
F   =  [0:0.05:0.95]; 
A  =  [1    1      1     1     1    0      0    0     0    0     0     0     0     0     0     0    0   0   0   0] ;
b  =  firls(20,F,A);
Signal_Filter = filter(b,1,Mix_Signal_2);
subplot(4,1,3);                                          %Mix_Signal_2 原始信号                 
plot(Mix_Signal_2);
axis([0,1000,-10,30]);
title('原始信号 ');

subplot(4,1,4);                                          %Mix_Signal_2 FIR低通滤波滤波后信号  
plot(Signal_Filter);
axis([0,1000,-10,30]);
title('FIR低通滤波后的信号');



end

