clc
clear all
close all

%reading image%
A = imread('C:\Users\mitra\Desktop\gray images\1.gif');
figure
imshow(A)
title('Original Image');
xlabel('(a)');

%rotate image%
B = imrotate(A,25);
figure
imshow(B)
title('Rotated Image');
xlabel('(b)');

%translate image%
C = imtranslate(A,[50 30]);
figure
imshow(C)
title('Translated Image');
xlabel('(c)');

%crop image%
D = imcrop(A,[347 63 77 82]);
figure
imshow(D)
title('Cropped Image');
xlabel('(d)');

%Task:Image Translation Without Function%
[M N]=size(A);
for i=1:M
    for j=1:N
    if i+30<=M && j+50<=N
       X(i+30,j+50)=A(i,j);
    end
%     if i<=30 && j<=50
%         X(i,j)=0;
%     end
    end
end
figure
imshow(C)
title('Using Function')
xlabel('(a)')
figure
imshow(X)
title('Using Algorithm')
xlabel('(b)')

%negative image%
neg=255-A;
figure 
imshow(neg)
title('Negative Image')
