clc
clear 
tic
%% 网络结构建立
%读取数据
% load data input output
%节点个数
inputnum=5;
hiddennum=10;
outputnum=1;
%训练数据和预测数据
fileID='C:\Users\logan\Desktop\lalala.csv';
file=fopen(fileID,'r');
text=textscan(file,'%s %s %s %s %s %s %s %s %s %s %s %s %s',1);
data=textscan(file,'%f %f %f %f %f %f %f %f %f %f %f %f %f %f', 'delimiter', ',');
fclose(file);
trainnum=1000;
testnum=trainnum+10;

input_train=[data{9}(1:trainnum) data{10}(1:trainnum) data{11}(1:trainnum) data{12}(1:trainnum) data{13}(1:trainnum)]';
input_test=[data{9}(trainnum+1:testnum) data{10}(trainnum+1:testnum) data{11}(trainnum+1:testnum) data{12}(trainnum+1:testnum) data{13}(trainnum+1:testnum)]';
output_train=data{14}(1:trainnum)';
output_test=data{14}(trainnum+1:testnum)';
%选连样本输入输出数据归一化
inputn=input_train;
outputn=output_train;
%构建网络
net=newff([-5 5;-5 5;-5 5;-5 5;-5 5;],[hiddennum 1],{'purelin','purelin'},'traingdx');
x=yichuansuanfa(inputnum,hiddennum,outputnum,net,inputn,outputn);

%% 把最优初始阀值权值赋予网络预测
% %用遗传算法优化的BP网络进行值预测
w1=x(1:inputnum*hiddennum);
B1=x(inputnum*hiddennum+1:inputnum*hiddennum+hiddennum);
w2=x(inputnum*hiddennum+hiddennum+1:inputnum*hiddennum+hiddennum+hiddennum*outputnum);
B2=x(inputnum*hiddennum+hiddennum+hiddennum*outputnum+1:inputnum*hiddennum+hiddennum+hiddennum*outputnum+outputnum);
net.iw{1,1}=reshape(w1,hiddennum,inputnum);
net.lw{2,1}=reshape(w2,outputnum,hiddennum);
net.b{1}=reshape(B1,hiddennum,1);
net.b{2}=B2;

%% BP网络训练
%网络进化参数
net.trainParam.epochs=25000;
net.trainParam.lr=0.1;
net.trainParam.goal=0.00001;
net.trainParam.showWindow=1;
%网络训练
[net,per2]=train(net,inputn,outputn);
save E53net net;
toc
%% BP网络预测
%数据归一化
% inputn_test=mapminmax('apply',input_test,inputps);
an=sim(net,input_test);
test_simu=mapminmax('reverse',an,outputps);
error=test_simu-output_test;
