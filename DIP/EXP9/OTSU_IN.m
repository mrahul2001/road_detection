clc;clear all;close all;

%Otsu Thresholding using Function
I=imread('C:\Users\mitra\Desktop\gray images\HEX_IMAGE.jpeg');
I=rgb2gray(I);
Id=I;
imshow(I)
title('Original Image','FontSize',18)
T=graythresh(I);
BW=imbinarize(I,T);
J=imhist(I);
figure
plot(J)
title('Histogram of Original Image','FontSize',18)
figure
imshow(BW)
title('Binarized Image Using in-built function','FontSize',18)

%Otsu Thresholding using Algorithm
P=J/sum(J);
min=256;
sigma_bw=zeros(1,256);
sigma_in=zeros(1,256);
uT=sum((1:256)'.*P(1:256));

varT=0;
for i=1:256
    varT=varT+(P(i)*((i-uT)^2));
end

for T=1:256
    P1=sum(P(1:T));
    P2=sum(P(T+1:256));
    u1=sum((1:T)'.*P(1:T))/P1;
    u2=sum((T+1:256)'.*P(T+1:256))/P2;

    sigma_bw(T)=P1*P2*((u1-u2)^2);
    sigma_in(T)=varT - sigma_bw(T);
    if(sigma_in(T)<min)
        min=sigma_in(T);
        threshold=T;
    end
end
[M N]=size(I);
for i=1:M
    for j=1:N
        if(Id(i,j)>threshold)
            Td1(i,j)=1;
        else
            Td1(i,j)=0;
        end
    end
end
figure
imshow(Td1)
title('Global Thresholding Using Otsu Method','FontSize',18)
