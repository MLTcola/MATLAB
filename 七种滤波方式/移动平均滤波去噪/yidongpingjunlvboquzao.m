function [  ] = yidongpingjunlvboquzao(  )

%****************************************************************************************
%  
%                      ���������ź�Mix_Signal_1 ���ź� Mix_Signal_2 
%
%***************************************************************************************

Fs = 1000;                                                                        %������
N  = 1000;                                                                        %��������
n  = 0:N-1;
t   = 0:1/Fs:1-1/Fs;                                                            %ʱ������ 
Signal_Original_1 =sin(2*pi*10*t)+sin(2*pi*20*t)+sin(2*pi*30*t); 
Noise_White_1    = [0.3*randn(1,500), rand(1,500)];           %ǰ500���˹�ֲ�����������500����ȷֲ�������
Mix_Signal_1   = Signal_Original_1 + Noise_White_1;        %����Ļ���ź�

Signal_Original_2  =  [zeros(1,100), 20*ones(1,20), -2*ones(1,30), 5*ones(1,80), -5*ones(1,30), 9*ones(1,140), -4*ones(1,40), 3*ones(1,220), 12*ones(1,100), 5*ones(1,20), 25*ones(1,30), 7 *ones(1,190)]; 
Noise_White_2     =  0.5*randn(1,1000);                                 %��˹������
Mix_Signal_2        =  Signal_Original_2 + Noise_White_2;      %����Ļ���ź�

%****************************************************************************************
%  
%                �ź�Mix_Signal_1 �� Mix_Signal_2  �ֱ����ƶ�ƽ���˲�
%
%***************************************************************************************
%{
Ȼ�����ʹ��smooth���
dd = smooth(cc);
hold on; plot(dd);
���ǿ��Կ����˲�Ч���Ƚϲ������ΪĬ�ϵ�smoothֻ�Ƕ�������Χ��5�����ݽ����ƶ�ƽ����Ĭ��ֵ�������ǿ��Ը���ָ��20�����ݽ����˲���
ee = smooth(cc,20);
hold on; plot(ee);
���Կ����˲�Ч�����ԽϺã�����Ҳ����˵��ֵԽ��Խ�ã�̫�ߵĻ������������ʧ��

�ƶ�ƽ���˲�Ҳ���˲�����������Ĭ�ϵķ����ǵ�ͨ�˲�
��'moving'��������������С�����˲���'lowess'������Ȩ��������С�����˲���'loess'����Savitzky-Golay �˲���'sgolay'����'rlowess'��'rloess'�ȷ�����
%}
%����ź� Mix_Signal_1  �ƶ�ƽ���˲�
figure(3);
b  =  [1 1 1 1 1 1]/6;
Signal_Filter = filter(b,1,Mix_Signal_1);
% Signal_Filter=smooth(Mix_Signal_1,20,'lowess');

subplot(4,1,1);                                          %Mix_Signal_1 ԭʼ�ź�                 
plot(Mix_Signal_1);
axis([0,1000,-4,4]);
title('ԭʼ�ź� ');

subplot(4,1,2);                                          %Mix_Signal_1 �ƶ�ƽ���˲����ź�  
plot(Signal_Filter);
axis([0,1000,-4,4]);
title('�ƶ�ƽ���˲�����ź�');

%����ź� Mix_Signal_2  �ƶ�ƽ���˲�
b  =  [1 1 1 1 1 1]/6;
Signal_Filter = filter(b,1,Mix_Signal_2);
subplot(4,1,3);                                          %Mix_Signal_2 ԭʼ�ź�                 
plot(Mix_Signal_2);
axis([0,1000,-10,30]);
title('ԭʼ�ź� ');

subplot(4,1,4);                                          %Mix_Signal_2 �ƶ�ƽ���˲����ź�  
plot(Signal_Filter);
axis([0,1000,-10,30]);
title('�ƶ�ƽ���˲�����ź�');

end

