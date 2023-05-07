clc;clear all;close all;
%Edge Detection Using Functions
I=imread('C:\Users\mitra\Desktop\gray images\13.gif');
imshow(I)
title('Original Image','FontSize',18)
I2=edge(I,'prewitt');%Prewitt Operator
figure
imshow(I2)
title('Prewitt Edge Detection','FontSize',18)
I3=edge(I,'sobel'); %Sobel Operator
figure
imshow(I3)
title('Sobel Edge Detection','FontSize',18)
%Edge Detection Without Using Functions Sobel
%Pre-allocate filtered_img with zeros
filtered_img=zeros(size(I));
%Mask for Sobel Operator
Mx=[-1 0 1;-2 0 2;-1 0 1];
My=[-1 -2 -1;0 0 0;1 2 1];
%Converting Image to double precision
I=double(I);
[M N]=size(I);
% Edge Detection Process
% When i = 1 and j = 1, then filtered_img pixel  
% position will be filtered_img(2, 2)
% The mask is of 3x3, so we need to traverse 
% to filtered_image(size(I, 1) - 2
%, size(I, 2) - 2)
% Thus we are not considering the borders.
for i=1:M-2
    for j=1:N-2
        % Gradient approximations
        Gx=sum(sum(Mx.*I(i:i+2,j:j+2)));
        Gy=sum(sum(My.*I(i:i+2,j:j+2)));
        % Magnitude of vector
        filtered_img(i+1,j+1)=sqrt(Gx.^2+Gy.^2);
    end
end
% Displaying Filtered Image
filtered_img=uint8(filtered_img);
figure
imshow(filtered_img)
title('Filtered Image for Sobel','FontSize',18)
% Define a threshold value
thresHold=150; % varies between [0 255]
output_img=max(filtered_img,thresHold);
output_img(output_img==round(thresHold))=0;
output_img=im2bw(output_img);
% Displaying Output Image
figure
imshow(output_img)
title('Edge Detected Image for Sobel','FontSize',18)
%Edge Detection Without Using Functions Prewitt
%Pre-allocate filtered_img with zeros
filtered_img=zeros(size(I));
%Mask for Prewitt Operator
Mx=[-1 0 1;-1 0 1;-1 0 1];
My=[-1 -1 -1;0 0 0;1 1 1];
%Converting Image to double precision
I=double(I);
[M N]=size(I);
% Edge Detection Process
% When i = 1 and j = 1, then filtered_img pixel  
% position will be filtered_img(2, 2)
% The mask is of 3x3, so we need to traverse 
% to filtered_image(size(I, 1) - 2
%, size(I, 2) - 2)
% Thus we are not considering the borders.
for i=1:M-2
    for j=1:N-2
        % Gradient approximations
        Gx=sum(sum(Mx.*I(i:i+2,j:j+2)));
        Gy=sum(sum(My.*I(i:i+2,j:j+2)));
        % Magnitude of vector
        filtered_img(i+1,j+1)=sqrt(Gx.^2+Gy.^2);
    end
end
% Displaying Filtered Image
filtered_img=uint8(filtered_img);
figure
imshow(filtered_img)
title('Filtered Image for Prewitt','FontSize',18)
% Define a threshold value
thresHold=50; % varies between [0 255]
output_img=max(filtered_img,thresHold);
output_img(output_img==round(thresHold))=0;
output_img=im2bw(output_img);
% Displaying Output Image
figure
imshow(output_img)
title('Edge Detected Image for Prewitt','FontSize',18)