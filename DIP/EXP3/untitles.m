%Histogram
clc
clear all
close all

I=imread('C:\Users\mitra\Desktop\gray images\39.gif');
imshow(I)
title('Original Image','FontSize',18);

x=imhist(I);
figure
plot(x)
title('Histogram of Original Image','FontSize',18)

J=histeq(I);
figure
imshow(J)
title('Equalized Image','FontSize',18);

x1=imhist(J);
figure
plot(x1)
title('Histogram of Equalized Image','FontSize',18')

x2=imadjust(I);
figure
imshow(x2)
title('Adjusted Image','FontSize',18)

en=imhist(x2);
figure
plot(en)
title('Histogram of Adjusted Image','FontSize',18)

%Histogram Creation using algorithm
[M N]=size(I);
h=zeros(1,256);
for i = 1:M
    for j = 1:N
        h(I(i,j))=h(I(i,j))+1;
    end
end

figure
plot(x)
title('Histogram using Function','FontSize',18)
figure
plot(h)
title('Histogram using Algorithm','FontSize',18)

%Histogram Equalization using Algorithm
[M N]=size(I);
Frequency=zeros(1,256);
for i = 1:M
    for j = 1:N
        Frequency(I(i,j))=Frequency(I(i,j))+1;
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
Eq=imhist(Equalized_Image);

figure
imshow(J)
title('Image after Histogram Equalization Using Function','FontSize',18)
figure
imshow(Equalized_Image)
title('Image after Histogram Equalization Using Algorithm','FontSize',18)

figure
plot(x1)
title('Histogram Equalization Using Function','FontSize',18)
figure
plot(Eq)
title('Histogram Equalization Using Algorithm','FontSize',18)