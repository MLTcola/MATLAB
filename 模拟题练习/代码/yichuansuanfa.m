function [chrom_best  ] = yichuansuanfa(inputnum,hiddennum,outputnum,net,inputn,outputn  )

%%��������
N = 100;  %��Ⱥ�ڸ�����Ŀ
N_chrom = inputnum*hiddennum+hiddennum+hiddennum*outputnum+outputnum; %Ⱦɫ��ڵ���
iter = 50; %��������
mut = 0.2;  %ͻ�����
acr = 0.2; %�������
best = 1;

chrom_range = [-3*ones(N_chrom,1) 3*ones(N_chrom,1)]'; %ÿ���ڵ��ֵ������
chrom = zeros(N, N_chrom);%���Ⱦɫ��ľ���
fitness = zeros(N, 1);%���Ⱦɫ�����Ӧ��
fitness_ave = zeros(1, iter);%���ÿһ����ƽ����Ӧ��
fitness_best = zeros(1, iter);%���ÿһ����������Ӧ��
chrom_best = zeros(1, N_chrom+1);%��ŵ�ǰ��������Ⱦɫ������Ӧ��

%%��ʼ��
chrom = Initialize(N, N_chrom, chrom_range); %��ʼ��Ⱦɫ��
for i=1:N
    fitness(i)= CalFitness(chrom,inputnum,hiddennum,outputnum,net,inputn,outputn); %������Ӧ��
end
chrom_best = FindBest(chrom, fitness, N_chrom); %Ѱ������Ⱦɫ��
fitness_best(1) = chrom_best(end); %����ǰ���Ŵ��������
fitness_ave(1) = CalAveFitness(fitness); %����ǰƽ����Ӧ�ȴ��������
'jinxing1'
for t = 2:iter
  
    chrom = MutChrom(chrom, mut, N, N_chrom, chrom_range, t, iter); %����
    chrom = AcrChrom(chrom, acr, N, N_chrom); %����
    for i=1:N
         fitness(i)= CalFitness(chrom,inputnum,hiddennum,outputnum,net,inputn,outputn); %������Ӧ��
    end
    chrom_best_temp = FindBest(chrom, fitness, N_chrom); %Ѱ������Ⱦɫ��
    if chrom_best_temp(end)>chrom_best(end) %�滻����ǰ���������
        chrom_best = chrom_best_temp;
    end
    %%�滻������
    [chrom, fitness] = ReplaceWorse(chrom, chrom_best, fitness);
    fitness_best(t) = chrom_best(end); %����ǰ���Ŵ��������
    fitness_ave(t) = CalAveFitness(fitness); %����ǰƽ����Ӧ�ȴ��������
    'jinxing2'

end
%%��ͼ
figure(1)
plot(1:iter, fitness_ave, 'r', 1:iter, fitness_best, 'b')
grid on
legend('ƽ����Ӧ��', '������Ӧ��')
e = PlotModel(chrom_best)

%%������
disp(['����Ⱦɫ��Ϊ', num2str(chrom_best(1:end-1))])
disp(['������Ӧ��Ϊ', num2str(chrom_best(end))])


end

