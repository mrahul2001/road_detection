clc 
clear all
close all

%Reading an Image%
A = imread('cameraman.tif');
figure
%Displaying Image%
subplot(1,3,1)
imshow(A)
title('Original image');
xlabel('(a)')

%increase the intensity%
F=A+100;
subplot(1,3,2)
imshow(F)
title('Increased Intensity')
xlabel('(b)')

%resize of image%
b=imresize(A,[100 100]);
subplot(1,3,3)
imshow(b)
title('Resized Image')
xlabel('(c)')

%RGB to Gray Image%
B=imread('pears.png');
C=rgb2gray(B);
figure
imshowpair(B,C,'montage')
title('RGB to Gray Image')

%splitting into R,G,B%
subplot(2,2,1)
imshow(B)
title('Original Image')
r=B(:,:,1);
subplot(2,2,2)
imshow(r)
title('Red Component')

%splitting into R,G,B%
g=B(:,:,2);
subplot(2,2,3)
imshow(g)
title('Blue Component')

%splitting into R,G,B%
b=B(:,:,3);
subplot(2,2,4)
imshow(b)
title('Green Component')

%The Difference%
sum=(r*(1/3)+g*(1/3)+b*(1/3));
figure
imshow(sum)
title('Summing the 3 components')
sub=B-sum;
figure
imshow(sub)
title('Comparing the images')

%read image%
x=imread('cameraman.tif')
[r c]=size(x);
B=imresize(x,[r c]);
imwrite(x,strcat('C:\Users\mitra\Desktop\DIP\EXP1\','Camera_Guy.jpg'));

