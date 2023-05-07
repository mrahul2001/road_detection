clc
clear all
close all

I=imread('C:\Users\mitra\Desktop\hexagone.jpg');
[M,N,S]=size(I);
if(S>1)
    imshow(I);
else
    X=1
end