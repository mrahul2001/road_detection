clc
close all
clear all

a=imread('C:\Users\mitra\Desktop\gray images\48.gif');
figure
imshow(a)
title('Original Image','FontSize',16)

%power law%
ad=im2double(a);
output1=(ad.^0.2);
figure
imshow(output1)
title('gamma=0.2','FontSize',16)
output2=(ad.^1.0);
figure
imshow(output2)
title('gamma=1.0','FontSize',16)
output3=(ad.^2.5);
figure
imshow(output3)
title('gamma=2.5','FontSize',16)

%logarithmic transfer%
a1=imread('C:\Users\mitra\Desktop\gray images\32.gif');
figure
imshow(a1)
title('Original Image','FontSize',16)
F=fft2(a1);
s=abs(F);
figure
imshow(s,[])
title('Fourier Transform','FontSize',16)
%Get the center spectrum%
FSH=fftshift(F);
figure
imshow(abs(FSH),[])
title('Center Fourier Transform of Image','FontSize',16)
%Apply Log Transfers
s2=log(1+abs(FSH));
figure
imshow(s2,[])
title('Log Transform of Image','FontSize',16)
%reconstruct
F=ifftshift(FSH);
f=ifft2(F);
figure
x=imshow(f,[])
title('Reconstructed Image','FontSize',16)

%gray level sclicing
g=imread('C:\Users\mitra\Desktop\gray images\8.gif')
%g=rgb2gray(g);
[M N]=size(g);
for i=1:M
    for j=1:N
        if((g(i,j)>100) && (g(i,j)<150))
            gray(i,j)=(1.25*(gray(i,j)));
        else
            gray(i,j)=50 ;
        end
    end
end
[m1 n1]=size(g);
for i=1:m1
     for j=1:n1
         if((g(i,j)>100) && (g(i,j)<150))
             gray1(i,j)=1.5*(gray1(i,j));
         else
            gray1(i,j)=g(i,j);
         end
     end
end
figure
imshow(g)
title('Original Image','FontSize',16)
figure
plot(imhist(g))
figure
imshow(uint8(gray))
title('Gray Level Slicing Without Background','FontSize',16)
figure
plot(imhist(uint8(gray)))
figure
gray2=uint8(gray1)
imshow(gray2)
title('Gray Level Slicing With Background','FontSize',16)
figure
plot(imhist(gray2))

% bit plane slicing of an image
b=imread('C:\Users\mitra\Desktop\gray images\27.gif');
[m,n] = size(b);
 
b1=double(bitget(b,1));
b2=double(bitget(b,2));
b3=double(bitget(b,3));
b4=double(bitget(b,4));
b5=double(bitget(b,5));
b6=double(bitget(b,6));
b7=double(bitget(b,7));
b8=double(bitget(b,8));
figure; imshow(b); title('Original Image','FontSize',16);
figure; imshow(b1); title('Bit Plane 1','FontSize',16);
figure; imshow(b2); title('Bit Plane 2','FontSize',16);
figure; imshow(b3); title('Bit Plane 3','FontSize',16);
figure; imshow(b4); title('Bit Plane 4','FontSize',16);
figure; imshow(b5); title('Bit Plane 5','FontSize',16);
figure; imshow(b6); title('Bit Plane 6','FontSize',16);
figure; imshow(b7); title('Bit Plane 7','FontSize',16);
figure; imshow(b8); title('Bit Plane 8','FontSize',16);