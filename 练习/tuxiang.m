function [  ] = tuxiang(  )
% a=magic(5);
% x=[19.5 23.5];
% y=[8.0 12.0];
% image(a,'xdata',x,'ydata',y);
% axis image
% colormap jet(25)

% RGB=reshape(ones(64,1)*reshape(jet(64),1,192),[64,64,3]);
% R=RGB(:,:,1);
% G=RGB(:,:,2);
% B=RGB(:,:,3);
% subplot(1,4,1);imshow(R);
% subplot(1,4,2);imshow(G);
% subplot(1,4,3);imshow(B);
% subplot(1,4,4);imshow(RGB);
figure
a=imread('C:\Users\logan\Desktop\À¯±Ê.png');
 b=imread('C:\Users\logan\Desktop\À¯±Ê.png');
 a=decorrstretch(b);
 imshow(a);
%  a=rgb2gray(a);
%  [j,t]=histeq(a,3);
%  imshow(j);
%  bw2=edge(a,'canny');
%  imshow(bw2);
 figure
 b=imadjust(a);
 bw=edge(b,'canny');
 imshow(b);
%  bw=edge(a,'prewitt');
%  imshow(bw);
%  a=rgb2gray(a);
%  imhist(a,1024);
%  imshow(a);
%  a=im2bw(a);
%  figure
%  imcontour(a,3);
%  a=imrotate(a,50);
%  imshow(a);
%  figure
%  b=imcrop(b,[646 213 396 270]);
%  imshow(b);
%  [y,x]=size(a)
%  ab=imresize(a,1/9);
%  imshow(ab);
%  b(23:56,:,:)=0;
%  imshow(abs(a-b));
%  a=im2bw(a,0.5);
%  figure
%  imshow(a);
%  a=1-a;
%  figure
%  imshow(a);
%  figure
%  b=im2bw(b,0.5);
%  b=imcomplement(b);
%  imshow(b);
%  if a==b
%      'ËûÁ©Ò»Ñù'
%  end
% if a==b
%     imshow(a);
% end
% subplot(1,2,1);
% subimage(a);
% subplot(1,2,2);
% subimage(b);
% a=rgb2gray(a);
% imshow(a);
% colorbar
% figure(2);
% a_gray=rgb2gray(a);
% imshow(a_gray);

% [x,y,z]=sphere;
% i=imread('C:\Users\logan\Desktop\À¯±Ê.png');
% warp(x,y,z,i);
end

