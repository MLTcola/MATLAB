
function [ v, d, p ] = multi_driveway_with_crossroad_exit( nl,nc,dt,fp,nt,chance,chance1)

 

 

 

% ��ĳһ�ض������ܶ��µģ������ܶ��� fp ������˫������������ģ��

 

% nc:������Ŀ��2����nl:�������ȡ����������

 

% v:ƽ���ٶȣ�p:�����ܶȡ����������

 

% dt:���沽��ʱ�䣬nt:���沽����Ŀ�����������

 

% fp:������ڴ��½��복���ĸ���������2,3,5 �����������������

 

% chance:����ڴ�������Ϊ�ĸ�������(5 ������ת,3������ת�������������

 

 %����Ԫ������

 

 B=ones(nc+1+nl/2,nl+3);

 

 %�����г���

 

 B(nc/2+1,[1:nl/2 nl/2+4:nl+3])=1.2;   

 

 B(nc+2:nc+1+nl/2,[1:nl/2 nl/2+4:nl+3])=1.2;

 

 %��ʼ������Ԫ��״̬��1 Ϊ�޳���0 Ϊ�г���

 

 bb1=B([1:nc/2 nc/2+2:nc+1],:);bb2=B(:,nl/2+3);bb3=B(:,nl/2+1);

 

 bb1(bb1~=0)=1;

 

 bb2(bb2~=0)=1;

 

 bb3(bb3~=0)=1;

 

 B([1:nc/2 nc/2+2:nc+1],:)=bb1;B(:,nl/2+3)=bb2;B(:,nl/2+1)=bb3;B(1:nc+1,nl/2+1:nl/2+3)=1;

 

 B(1:nc/2,end)=0;B(nc/2+2:nc+1,1)=0;B(end,nl/2+3)=0;

 

 %��ʾ��ʼ��ͨ��ͼ

 

 figure();

 

 H=imshow(B,[]);

 

 set(gcf,'position',[241 132 560 420]) ;%241 132 560 420

 

 set(gcf,'doublebuffer','on'); %241

 

 title('cellular-automation to traffic modeling','color','b');

 

 %��ʼ�����洢Ԫ���ϳ���״̬�ľ���

 

 S(1:nc*2+2,nl/2-2) = 0;

 

 Q(1:nc*2+2,1:2) = 0;

 

 C=zeros(nc+1,3);

 

 %��ʼ������Ƶ�ʡ�ƽ���ٶȡ������ܶ���ر���

 

 ad = 0;

 

 av(1:nt) = 0;

 

 ap(1:nt) = 0;

 

 s = 1;flag= 0;flag1=0;%flag��flag1 ���ڱ�ʾС�����ڵĳ��Ƿ�Ϊ��ת����

 

 flag2=0;

 

 for n = 1:nt

 

     

 

%����·�εĳ��ȡ�

 

A=[

 

B(1:nc/2,nl/2 :-1:1);

 

B(nc/2+2:nc+1,1:nl/2);

 

B(1:nc/2,nl+3:-1:nl/2+4);

 

B(nc/2+2:nc+1,nl/2+4:nl+3);

 

B(nc+1+nl/2:-1:nc+2,nl/2+3)';

 

B(nc+2:1:nc+1+nl/2,nl/2+1)'

 

];

 

%

 

c=B(1:nc+1,nl/2+1:nl/2+3);

 

 %ȷ��ǰ n-2 ��������״̬

 

 S(:,:) = 0;

 

 S(A(:,1:end-2)==0&A(:,2:end-1)==1&A(:,3:end)==1)=2;%������ʻ�ĳ�

 

 S(A(:,1:end-2)==0&A(:,2:end-1)==0)=3;%ͣ���ĳ�

 

 S(A(:,1:end-2)==0&A(:,2:end-1)==1&A(:,3:end)==0)=1;%������ʻ�ĳ�

 

 %ȷ����� 2 ����Ԫ����״̬

 

 Q(:,:)= 0;

 

 Q(A(:,end-1)==0&A(:,end)==0) = 3;

 

 Q(A(:,end-1)==0&A(:,end)==1) = 1;

 

 

 

 if c(3,1)==0

 

     if rand<chance1



         flag2=1;



         c(3,1)=1;



     end



 end



     



 if A(1,end)==0



 Q(1,end)=1;



 end



 if A(4,end)==0



 Q(4,end)=1;



 end



 if A(6,end)==0



 Q(6,end)=1;



 end



 if rem(floor(n/50),2)==0 %��ʱ������Ϊ�̵�



 if A(2,end)==0



 if c(nc/2+2:nc+1,1)==0



 Q(2,end)=3;



 else



     Q(2,end)=1;



 end 



 end



 if A(3,end)==0



 if c(1,3)==0



 Q(3,end)=3;



 else



 Q(3,end)=1;



 end



 end



 %���ռȶ�������ʻ��5 ������ת��



 if A(5,end)==0



 if flag==0



 if rand<chance %·�ڳ���ת



 if c(nc/2+2:nc+1,:)==1



 Q(5,end)=1;  



 else



 Q(5,end)=3;



 end



 end



 else %��һ����Ϊ��ת������Ҫ�ȴ�                                  



 end



 end



 if c(1,2)==0



 if c(1,1)==1%3������ת��˼·����ܡ�



 C(1,2)=1;



 else



 C(1,2)=3;



 end



 if c(2,1)==0                



 C(1,2)=3;



 end



 end



 if c(1,3)==0



 if c(1,2)==1



 C(1,3)=1;



 else



 C(1,3)=3;



 end



 end



 if c(3,1)==0



 if c(3,2)==1



 C(3,1)=1;



 else



 C(3,1)=3;



 end



 end



 if c(3,2)==0



 if c(3,3)==1



 C(3,2)=1;



 else



 C(3,2)=3;



 end



 end



 if rem(n,20)==0&&c(3,2)==0%С�������ĳ���������·�ڣ����⴦������



 if c(2,1)==1



 C(3,2)=5; %����ĵȴ�״̬��С�������ĳ���



 else



 C(3,2)=3;



 end



 end



 if c(2,1)==0



 if A(1:nc/2,1)==0



 C(2,1)=3;



 else



 C(2,1)=1;



 end



 end



 if c(1,1)==0



 if A(1,1)==0



 C(1,1) = 3;



 else



 C(1,1) = 1;



 end



 end



 if c(3,3)==0



 if A(nc*3/2+1:2*nc,1)==0



 C(3,3) = 3;



 else



 C(3,3) = 1;



 end



 end



 else %��ʱС��������Ϊ�̵�



 Q(2,end)=3;Q(3,end)=3;



 if c(3,2)==0



 if flag1==1



 if c(2,1)==1



 C(3,2)=5;flag1=0;



 else



 C(3,2)=3;



 end



 else



 if c(3,3)==1



 C(3,2)=1;



 else



 C(3,2)=3;



 end



 end



 end



 if c(2,1)==0



 if A(1:nc/2,1)==1&&c(1,1)==1



 C(2,1)=1;



 else



 C(2,1)=3;



 end



 end



 if A(5,end)==0



 if flag==0



 if rand<chance



 if c(nc/2+2:nc+1,:)==1



 Q(5,end)=1;



 else



 Q(5,end)=3;



 end



 else



 if c(nc/2+2:nc+1,1)==1&&c(nc/2+2:nc+1,2)==1



 Q(5,end)=5;flag=0;flag1=1; %С������תǰ��������������ת����



 else



 Q(5,end)=3;flag=1;



 end



 end



 else



 if c(nc/2+2:nc+1,1)==1&&c(nc/2+2:nc+1,2)==1



 Q(5,end)=5;flag=0;flag1=1; %С������תǰ��������������ת����



 else



 Q(5,end)=3;flag=1;



 end



 end



 end



 if c(1,2)==0



 if c(1,1)==1



 C(1,2)=1;



 else



 C(1,2)=3;



 end



 end



 if c(1,3)==0



 if c(1,2)==1



 C(1,3)=1;



 else



 C(1,3)=3;



 end



 end



 if c(3,1)==0



 if c(3,2)==1



 C(3,1)=1;



 else



 C(3,1)=3;



 end



 end



 if c(1,1)==0



 if A(1:nc/2,1)==0



 C(1,1) = 3;



 else



 C(1,1) = 1;



 end



 end



 if c(3,3)==0



 if A(nc*3/2+1:2*nc,1)==0



 C(3,3) = 3;



 else



 C(3,3) = 1;



 end



 end



 end



 %�������Ԫ���ϳ�����״̬



 Acc = [ S Q ];



 %���ݵ�ǰ״̬�ı�Ԫ��λ��



 %·�ڸ����ĳ�������ʻ����



 if C(3,2)==5



 c(2,1)=0;



 c(3,2)=1;



 flag=0;



 C(3,2)=0;



 elseif C(3,2)==1



 c(3,3)=0;



 c(3,2)=1;



 C(3,2)=0;



 end



 if C(2,1)==1



 A(1,1)=0;



 c(2,1)=1;



 C(2,1)=0;



 end



 if Acc(3,end)==1



 c(1,3)=0;



 A(3,end)=1;



 Acc(3,end)=0;



 end



 if Acc(2,end)==1



 c(3,1)=0;



 A(2,end)=1;



 Acc(2,end)=0;



 end



 if C(3,1)==1



 c(3,2)=0;



 c(3,1)=1;



 C(3,1)=0;



 end



 if C(1,3)==1



 c(1,2)=0;



 c(1,3)=1;



 C(1,3)=0;



 end



 if C(1,2)==1



 c(1,1)=0;



 c(1,2)=1;



 C(1,2)=0;



 end



 if C(1,1)==1



 A(1,1)=0;



 c(1,1)=1;



 C(1,1)=0;



 end



 if C(3,3)==1



 A(4,1)=0;



 c(3,3)=1;



 C(3,3)=0;



 end



 %�������г�����ǰ�� 1 ��



 A( Acc(:,1:end)==1 )=1;



 A( [ zeros(nc*3,1) Acc(:,1:end-1)]==1 ) = 0;



 %�������г�����ǰ�� 2 ��



 A( Acc(:,1:end)==2) = 1;



 A( [ zeros(nc*3,2) Acc(:,1:end-2)]==2) = 0;



 if Acc(1,1)==1||Acc(1,1)==2



 A(1,1)=1;



 end



 if Acc(4,1)==1||Acc(4,1)==2



 A(4,1)=1;



 end



 if Acc(5,end)==5



 c(3,2)=0;flag=0;



 A(5,end)=1;



 elseif Acc(5,end)==1



 c(3,3)=0;



 A(5,end)=1;



 end



 if Acc(3,end)==1



 c(1,3)=0;



 A(3,end)=1;



 end



 if Acc(2,end)==1



 c(3,1)=0;



 A(2,end)=1;



 end



 if Acc(4,1)==1||Acc(4,1)==2



 A(4,1)=1;



 end



 if Acc(1,1)==1||Acc(1,1)==2



 A(1,1)=1;



 end



 %����ƽ���ٶȡ�����Ƶ�ʡ������ܶȵȲ���



 %��������еĳ�����Ŀ N



 matN = A<1;



 N = sum(sum(matN));



 %��������еĳ����ٶ�֮�� V



 E = S((S==1)|(S==2));



 V = sum(E);



 %�����ʱ�̵ĳ����ܶȲ�����



 ap(n) = N/( (nc*3)*(nl/2)+9 );



 %�����ʱ�̵�ƽ�����ʲ�����



 if(N~=0&&n>nl/2)

 

 av(s) = V/N;

 

 s = s+1;

 

 end

 

 %�ڳ�����ڴ���������µĳ���

 

 A([2;3;5],1)=(round(fp.*rand(3,1))&A([2;3;5],1));

 

 A(A~=0)=1;

 

 if flag2==1

 

     A(6,1)=0;

 

     flag2=0;

 

 end

 

 %���µĳ�������Ԫ��������

 

 B(1,1:nl/2)=A(1:nc/2,end:-1:1);

 

 B(3,1:nl/2)=A(nc/2+1:nc,:);

 

 B(1,nl/2+4:nl+3)=A(nc+1:nc*3/2,end:-1:1);

 

 B(3,nl/2+4:nl+3)=A(nc*3/2+1:2*nc,:);

 

 B(nc+2:nc+1+nl/2,nl/2+3)=A(2*nc+1,end:-1:1)';

 

 B(nc+2:nc+1+nl/2,nl/2+1)=A(3*nc,:)';

 

 B(1:3,nl/2+1:nl/2+3)=c(:,:);

 

 %��ʾ��ͨ��ͼ

 

 set(H,'CData',B);

 

%�������ʱ���ÿ��ʱ����ָ�꣨�ٶ��복��������

 

 d = ad;

 

 p = mean(ap);

 

 v = sum(av)/s;

 

 disp([v,p])

 

%���沽��

 

 pause(dt);

 

 end

 

end

