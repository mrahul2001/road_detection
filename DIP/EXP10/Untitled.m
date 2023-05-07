clc
clear all
close all

%Histogram Equalization using Function
I=imread('football.jpg');
imshow(I)
HSV = rgb2hsv(I);
Heq = histeq(HSV(:,:,3));
HSV(:,:,3) = Heq;
RGB = hsv2rgb(HSV);
figure
imshow(RGB)

%Histogram Equalization using Algorithm
I1=I(:,:,1);
I2=I(:,:,1);
I3=I(:,:,1);
I1=I1*255;
[M N]=size(I1);
Frequency=zeros(1,256);
for i = 1:M
    for j = 1:N
        Frequency(I1(i,j))=Frequency(I1(i,j))+1;
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
        T=(I(i,j)+1);
        Equalized_Image(i,j)=CDF(T);
    end
end
Equalized_Image=uint8(Equalized_Image);


figure
imshow(A_RGB)
title('Image after Histogram Equalization Using Algorithm','FontSize',18)