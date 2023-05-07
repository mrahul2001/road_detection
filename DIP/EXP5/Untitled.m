clc;clear all;close all
 
%Mean Filter
A=imread('C:\Users\mitra\Desktop\gray images\2.gif');
m1=input('Enter the filter window size m1:');
n1=input('Enter the filter window size n1:');
Inoise=imnoise(A,'salt & pepper',0.45);
H=fspecial('average',[m1 n1]);
Mfilt=imfilter(Inoise,H,'replicate');
 
%Median Filter
m2=input('Enter the filter window size m2:');
n2=input('Enter the filter window size n2:');
Ifilt=medfilt2(Inoise,[m2 n2]);
 
%plotting
imshow(A)
title('Original Image','FontSize',18)
figure
imshow(Inoise)
title('Adding Gaussian Noise','FontSize',18)

%Mean without using Function
[M N]=size(A);
m=(m1-1)/2;
B=Inoise;
for i = (1+m):(M-m)
    for j = (1+m):(N-m)
        sum=0;
        for k = -m : m
            for l = -m : m
                sum = sum + (Inoise(i+k,j+l)/(m1*m1));
            end
        end
        B(i,j)=sum;
    end
end
 
%plotting
figure
imshow(Mfilt)
title('Applying Mean Filter using Function','FontSize',18)
figure
imshow(B)
title('Applying Mean Filter using Algorithm','FontSize',18)
 
%Median without using Function
[M N]=size(A);
mm=(m2-1)/2;
C=Inoise;
mid_element = ceil((m2*m2)/2);
MID=zeros(m2);
for i = (1+mm):(M-mm)
    for j = (1+mm):(N-mm)
        flag = 1;
        for k = -mm : mm
            for l = -mm : mm
                MID(flag) = Inoise(i+k,j+l);
			   flag=flag+1;
            end
        end
        A2=sort(MID);
        C(i,j)=A2(mid_element);
    end
end
%plotting
figure
imshow(Ifilt)
title('Applying Median Filter using Function','FontSize',18)
figure
imshow(C)
title('Applying Median Filter using Algorithm','FontSize',18)

