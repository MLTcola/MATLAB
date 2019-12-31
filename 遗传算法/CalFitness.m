function fitness = CalFitness(chrom, N, N_chrom)
fitness = zeros(N, 1);
%��ʼ������Ӧ��
for i = 1:N
    x = chrom(i, 1);
    y = chrom(i, 2);
    fitness(i) = sin(x)+cos(y)+0.1*x+0.1*y;
end

