clc;
clear all;
close all;

% Prompt user to select an image file
[filename, filepath] = uigetfile({'*.jpg;*.png;*.bmp;*.tif','Image Files (*.jpg,*.png,*.bmp,*.tif)'},'Select an image file');
if isequal(filename,0)
   disp('User selected Cancel');
   return;
else
   disp(['User selected ', fullfile(filepath, filename)]);
end

% Reading the selected image
I = imread(fullfile(filepath, filename));
figure, imshow(I);
title('ORIGINAL IMAGE');

% Convert to grayscale
J = rgb2gray(I);
figure, imshow(J);
title('GRAYSCALED IMAGE');

% Histogram of grayscale image
img_hist = imhist(J);
figure, plot(img_hist)
title('HISTOGRAM OF GRAYSCALE IMAGE')

% Image adjusting
img_ad = imadjust(J,[0.5 0.9],[]);
figure, imshow(img_ad)
title('ADJUSTED IMAGE')

% Histogram of adjusted image
hist = imhist(img_ad);
figure, plot(hist)
title('HISTOGRAM OF ADJUSTED IMAGE')

% Binarization of image
level = graythresh(J);
I_med = imbinarize(J, level);
figure, imshow(I_med);
title('BINARY IMAGE AFTER THRESHOLDING');

% Median filtering
B = medfilt2(I_med);
figure, imshow(B);
title('MEDIAN FILTERED IMAGE');

% Morphological processing
img = bwareaopen(B, 1000);   
figure, imshow(img), title('IMAGE AFTER bwreaopen()')
im3 = bwmorph(img, 'majority');
figure, imshow(im3), title('IMAGE AFTER bwmorpgh(majority)')

BW = bwmorph(im3, 'remove');
figure, imshow(BW);
title('IMAGE AFTER bwmorph(remove)');

% Edge detection
BW1 = edge(BW, 'sobel');
figure, imshow(BW1);
title('SOBEL EDGE DETECTION ON IMAGE');

se = strel('square', 2);
closeBW = imclose(BW1, se);
figure, imshow(closeBW), title('IMAGE AFTER CLOSING OPERATION');

% Image overlaying
Y = imoverlay(J, BW1, 'r');
figure, imshow(Y), title('ROAD DETECTION');
