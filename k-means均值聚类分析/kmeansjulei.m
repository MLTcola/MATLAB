function [  ] = kmeansjulei(  )

clear
clc
data= [5.0 3.5 1.3 0.3 -1
5.5 2.6 4.4 1.2 0
6.7 3.1 5.6 2.4 1
5.0 3.3 1.4 0.2 -1
5.9 3.0 5.1 1.8 1
5.8 2.6 4.0 1.2 0];

[Idx,C,sumD,D]=kmeans(data,3,'dist','sqEuclidean','rep',4);
scatter(1:30,data(:))
figure
Idx
scatter(1:size(C(:,1)),C(:,1));


end

