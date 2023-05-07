clc;clear all;close all;
 
%Median Filter
A=imread('C:\Users\mitra\Desktop\gray images\2.gif');
Inoise=imnoise(A,'salt & pepper',0.45);
n=3;
Ifilt=medfilt2(Inoise,[n n]);
 
%plotting
imshow(A)
title('Original Image','FontSize',18)
figure
imshow(Inoise)
title('Adding Impulse Noise','FontSize',18)
figure
imshow(Ifilt)
title('Median Filtering','FontSize',18)

%Improved Median Filerting Algorithm
[M N]=size(A);
for i=1:M
    for j=1:N
        n=3;
        Inoise(i,j)
        [med,max,min]=calc_median(Inoise,Inoise(i,j),M,N,n);
        A1=med-min;
        A2med-max;
        if(A1>0 && A2<0)
            
        else
            n=n+2;
            [med,max,min]=calc_median(Inoise,M,N,n);

