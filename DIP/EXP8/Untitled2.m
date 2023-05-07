clc
clear all
close all

%Global Thresholding Using In-Built Function
I=imread('C:\Users\mitra\Desktop\gray images\HEX_IMAGE.jpeg');
imshow(I) 
title('Original Image','Fontsize',18)        %Displaying Original Image
I=rgb2gray(I);                               %Converting into gray image
T_mt=im2bw(I,0.5);                               %Global Thresholding Using in-built function
figure
imshow(T_mt)
title('Global Thresholding Using Function','Fontsize',18)  

%Global Thresholding Using Algorithm 
[M N]=size(I);
J=imhist(I);   %Histogram of Original Image
figure
plot(J)
title('Histogram of Original Image','FontSize',18)
Id=I;          %Copying Original Image   
T=0;           %Initializing Threshold Value

%Calculating Global Mean
for i=1:256
    T=T+((i*J(i))/(M*N));                    
end

%Global Thresholding Using Calvard Method(Algorithm 1)
T_delta=0.001;
T1=T;          %Copying Global Mean for 2nd Algorithm
done = false;  %Condition for while loop

while ~done
    g = (Id > T);
    Tnext = (mean2(Id( g)) + mean2(Id(~g)))/2;
    done = abs(T - Tnext) < T_delta;
    T = Tnext;
end
%Applying Threshold to Original Image
for i=1:M
    for j=1:N
        if(Id(i,j)>T)
            Td(i,j)=1;
        else
            Td(i,j)=0;
        end
    end
end
figure
imshow(Td)
title('Global Thresholding Using Algorithm(1)','Fontsize',18)

%Global Thresholding Using Calvard Method(Algorithm 2)
done1 = false;
T_delta=0.1;
while ~done1
    T1=ceil(T1);
    mean_1=0;x1=0;
    for i=1:T1
        x1=x1+J(i);
        mean_1=mean_1+(i*J(i));
    end
    mean_1=mean_1/x1;
    mean_2=0;x2=0;
    for i=(T1+1):256
        x2=x2+J(i);
        mean_2=mean_2+(i*J(i));
    end
    mean_2=mean_2/x2;
    T_next = (mean_1+mean_2)/2;
    done1 = abs(T1 - T_next) < T_delta;
    T1 = T_next;
end

%Applying Threshold to Original Image
for i=1:M
    for j=1:N
        if(Id(i,j)>T1)
            Td1(i,j)=1;
        else
            Td1(i,j)=0;
        end
    end
end
figure
imshow(Td1)
title('Global Thresholding Using Algorithm(2)','Fontsize',18)