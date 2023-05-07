clc
clear all
close all

%Histogram Equalization using Function
I=imread('peppers.png');
imshow(I)
title('Original Image','FontSize',18)
R=I(:,:,1);
R_eq=histeq(R);
G=I(:,:,2);
G_eq=histeq(G);
B=I(:,:,3);
B_eq=histeq(B);
A_RGB=(0.2989*R_eq)+(0.5870*G_eq)+(0.1140*B_eq);
figure,imshow(A_RGB)

%Histogram Equalization using Algorithm
HSV=rgb2hsv(I);
[M N]=size(HSV(:,:,3));
II=(HSV(:,:,3))*255;
Frequency=zeros(1,256);
for i = 1:M
    for j = 1:N
        Frequency(II(i,j))=Frequency(II(i,j))+1;
    end
end
PDF=Frequency/(M*N);

CDF=zeros(1,256);
CDF(1)=PDF(1);

for i=2:256
    CDF(i)=CDF(i-1)+PDF(i);
end
CDF=round(255*CDF);

Equalized_Image=zeros(M);
for i=1:M
    for j=1:N
        T=(II(i,j)+1);
        Equalized_Image(i,j)=CDF(T);
    end
end
Equalized_Image=uint8(Equalized_Image);
% I2=I(:,:,2);
% [G]=equalizaiton_function(I2);
% I3=I(:,:,3);
% [B]=equalizaiton_function(I3);
% A_RGB=(0.2989*R)+(0.5870*G)+(0.1140*B);

HSV(:,:,3) = Equalized_Image;
A_RGB=hsv2rgb(HSV);
figure
imshow(uint8(A_RGB))
title('Image after Histogram Equalization Using Algorithm','FontSize',18)