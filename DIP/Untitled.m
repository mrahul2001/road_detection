
clc
clear all
close all
% read an image
a=imread('Cameraman.tif');
%display image
figure
imshow(a)
title('Original Image')
%resize an image
[r c]=size(a);
b=imresize(a,[50,50]);
%display resized image
figure
imshow(b)
title('Resized Image')
% Intensity of an image
E=a+128;
figure
imshow(E)
title('Increased Brightness')
%read colour image
D=imread('peppers.png');
%display colour image
figure
imshow(D)
title('Original Colour Image')
%RGB to gray
F=rgb2gray(D);
figure
%display rgb to gray
imshow(F)
title('Gray Image')
%compare image
figure
imshowpair(D,F,'montage')
title('Colour Image vs Gray Image')
%r component
r=D(:,:,1);
figure
% display r component
imshow(r)
title('Red Component')
%g component
g=D(:,:,2);
figure
% display g component
imshow(g)
title('Green Component')
%b component
b=D(:,:,3);
figure
% display b component
imshow(b)
title('Blue Component')
%add r,g,b component and divide by 3
X=(r+g+b)/3;
figure
%display X
imshow(X)
title('Addition of three components')
%subtraction
Y=X-F;
figure
%display Y
imshow(Y)
title('Compared Image')
