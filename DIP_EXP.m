clc;
clear all;
close all;
%READING IMAGE%
I=imread('C:\Users\mitra\Desktop\Screenshot (79).png');
figure,imshow(I);
title('ORGINAL IMAGE');
%GRAYSCALE IMAGE%
J=rgb2gray(I);
figure,imshow(J);
title('GRAYSCALED IMAGE');
img_hist=imhist(J);
figure,plot(img_hist)
title('HISTOGRAM OF GRAYSCALE IMAGE')
%IMAGE ADJUSTING%
img_ad=imadjust(J,[0.5 0.9],[]);
figure,imshow(img_ad)
title('ADJUSTED IMAGE')
%HISTOGRAM
hist=imhist(img_ad);
figure,plot(hist)
title('HISTOGRAM OF ADJUSTED IMAGE')
%BINARIZATION OF IMAGE%
level=graythresh(J)
I_med = imbinarize(J,level);
figure,imshow(I_med);
title('BINARY IMAGE AFTER THRESHOLDING');
%MEDIAN FILTERING%
B = medfilt2(I_med);
figure,imshow(B);
title('MEDIAN FILTERED IMAGE');
%MORPHOLOGICAL PROCESSING%
img = bwareaopen(B,1000);   
figure,imshow(img),title('IMAGE AFTER bwreaopen()')
im3 = bwmorph(img,'majority');
figure,imshow(im3),title('IMAGE  AFTER bwmorpgh(majority)')
% x=img-im3;
% figure,imshow(x)
% img=im3;
% se=strel('square',2);
% im1=imclose(img,se);
% figure,imshow(im1);
% xx=img-im1;
% figure,imshow(xx)
BW = bwmorph(im3,'remove');
figure,imshow(BW);
title('IMAGE AFTER bwmorph(remove)');
%EDGE DETECTION%
BW1 = edge(BW,'sobel');
figure,imshow(BW1);
title('SOBEL EDGE DETECTION ON IMAGE');
se=strel('square',2);
closeBW=imclose(BW1,se);
figure, imshow(closeBW), title('IMAGE AFTER CLOSING OPERATION');
BW1=closeBW;
%IMAGE OVERLAPPING%
% H = vision.AlphaBlender;
% J = im2single(J);
% BW1 = im2single(BW1);
Y = imoverlay(J,BW1,'r');
figure,imshow(Y),title('ROAD DETECTION')