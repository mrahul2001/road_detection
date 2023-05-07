clc
clear all
close all

%Edge Detection Using Functions
I=imread('cameraman.tif');
% I=rgb2gray(I);
I=im2double(I);
figure
imshow(I)
title('Original Image')

I1=edge(I,'canny');
figure
imshow(I1)
title('Canny Edge Detection')

%Edge Detection Using Algorithm
gauss1 = imgaussfilt(I, 2);

%Display  the smooth image
figure
imshow(gauss1)
title('sigma = 2')

%Finding Gradients
kx=[-1 0 1; -2 0 2; -1 0 1];
ky=[-1 -2 -1; 0 0 0; 1 2 1];
gx=imfilter(gauss1, kx);
gy=imfilter(gauss1, ky);
g_magnitude=sqrt(gx.^2+gy.^2);
g_direction=atan2(gy,gx)*(180/pi);

%plotting Gradient values
figure
imshow(gx)
title('Gx')
figure
imshow(gy)
title('Gy')
figure
imshow(g_magnitude)
title('Magnitude')
figure
imshow(g_direction)
title('Direction')

%Non-Maxima Suppression
[rows cols] = size(gauss1);
    local_max = zeros(rows,cols);
    for row = 2:rows-1
        for col = 2:cols-1
            if((g_direction(row,col) > -22.5 && g_direction(row,col) < 22.5) || (g_direction(row,col) > 157.5 && g_direction(row,col) < -157.5))
                if(g_magnitude(row,col) > g_magnitude(row, col+1) && g_magnitude(row,col) > g_magnitude(row, col-1))
                    local_max(row,col)=g_magnitude(row,col);
                else
                    local_max(row,col)=0;
                end
            end
            if((g_direction(row,col) > 22.5 && g_direction(row,col) < 67.5) || (g_direction(row,col) > -157.5 && g_direction(row,col) < -112.5))
                if(g_magnitude(row,col) > g_magnitude(row+1, col+1) && g_magnitude(row,col) > g_magnitude(row-1, col-1))
                    local_max(row,col)=g_magnitude(row,col);
                else
                    local_max(row,col)=0;
                end
            end
            if((g_direction(row,col) > 67.5 && g_direction(row,col) < 112.5) || (g_direction(row,col) > -112.5 && g_direction(row,col) < -67.5))
                if(g_magnitude(row,col) > g_magnitude(row+1, col) && g_magnitude(row,col) > g_magnitude(row-1, col))
                    local_max(row,col)=g_magnitude(row,col);
                else
                    local_max(row,col)=0;
                end
            end
            if((g_direction(row,col) > 112.5 && g_direction(row,col) < 157.5) || (g_direction(row,col) > -67.5 && g_direction(row,col) < -22.5))
                if(g_magnitude(row,col) > g_magnitude(row-1, col+1) && g_magnitude(row,col) > g_magnitude(row+1, col-1))
                    local_max(row,col)=g_magnitude(row,col);
                else
                    local_max(row,col)=0;
                end
            end
        end
    end
figure
imshow(local_max)
title('Non-Maximum Suppression')

%Double Thresholding
threshold=local_max;
tH=0.035;
tL=0.015;
for i=1:row
    for j=1:col
        if(local_max(i,j)<=tL)
            threshold(i,j)=0;
        elseif(local_max(i,j)>=tH)
            threshold(i,j)=1;
        end
    end
end
figure
imshow(threshold)
title('Double Thresholding')

figure
imshow(threshold)
title('Canny Edge Detection using Algorithm')