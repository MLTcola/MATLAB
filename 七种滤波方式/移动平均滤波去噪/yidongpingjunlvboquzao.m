function [  ] = yidongpingjunlvboquzao(  )

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
%                信号Mix_Signal_1 和 Mix_Signal_2  分别作移动平均滤波
%
%***************************************************************************************
%{
然后可以使用smooth命令：
dd = smooth(cc);
hold on; plot(dd);
但是可以看到滤波效果比较差，这是因为默认的smooth只是对数据周围的5个数据进行移动平均（默认值），我们可以给他指定20个数据进行滤波。
ee = smooth(cc,20);
hold on; plot(ee);
可以看到滤波效果明显较好，但是也不是说数值越高越好，太高的话容易造成数据失真

移动平均滤波也有滤波方法，比如默认的方法是低通滤波
（'moving'），还有线性最小二乘滤波（'lowess'），加权的线性最小二乘滤波（'loess'），Savitzky-Golay 滤波（'sgolay'），'rlowess'，'rloess'等方法。
%}
%混合信号 Mix_Signal_1  移动平均滤波
figure(3);
b  =  [1 1 1 1 1 1]/6;
Signal_Filter = filter(b,1,Mix_Signal_1);
% Signal_Filter=smooth(Mix_Signal_1,20,'lowess');

subplot(4,1,1);                                          %Mix_Signal_1 原始信号                 
plot(Mix_Signal_1);
axis([0,1000,-4,4]);
title('原始信号 ');

subplot(4,1,2);                                          %Mix_Signal_1 移动平均滤波后信号  
plot(Signal_Filter);
axis([0,1000,-4,4]);
title('移动平均滤波后的信号');

%混合信号 Mix_Signal_2  移动平均滤波
b  =  [1 1 1 1 1 1]/6;
Signal_Filter = filter(b,1,Mix_Signal_2);
subplot(4,1,3);                                          %Mix_Signal_2 原始信号                 
plot(Mix_Signal_2);
axis([0,1000,-10,30]);
title('原始信号 ');

subplot(4,1,4);                                          %Mix_Signal_2 移动平均滤波后信号  
plot(Signal_Filter);
axis([0,1000,-10,30]);
title('移动平均滤波后的信号');

end

