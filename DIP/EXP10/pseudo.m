clc
clear all
close all

%READ AN INPUT IMAGE
A = imread('C:\Users\mitra\Desktop\gray images\11.gif');
imshow(A);
title('Original Image','FontSize',18);
%PRE-ALLOCATE A MATRIX
Output = zeros([size(A,1) size(A,2) 3]);
%Define a colormap
map = colormap(jet(256));
%Assign the columns to 1-D RED,GREEN and BLUE
Red = map(:,1);
Green = map(:,2);
Blue = map(:,3);
%MAP THE COLORS BASED ON THE INTENSITY OF THE IMAGE
Output(:,:,1) = Red(A);
Output(:,:,2) = Green(A);
Output(:,:,3) = Blue(A);
Output = im2uint8(Output);
%DISPLAY THE IMAGE
figure
imshow(Output);
title('Pseudo-coloured Image');
