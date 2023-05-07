clc;clear all;close all;

%Otsu Thresholding using Function
I=imread('C:\Users\mitra\Desktop\gray images\WhatsApp Image 2022-09-20 at 3.16.41 PM.jpeg');
I=rgb2gray(I);
Id=I;
imshow(I)
T=graythresh(I);
BW=imbinarize(I,T);
J=imhist(I);
figure
plot(J)
figure
imshow(BW)
title('Global Thresholding Using Function')

%Otsu Thresholding using Algorithm
P=J/sum(J);
max=0;
sigma_bw=zeros(1,256);

for T=1:256
    P1=sum(P(1:T));
    P2=sum(P(T+1:256));
    u1=sum((1:T)'.*P(1:T))/P1;
    u2=sum((T+1:256)'.*P(T+1:256))/P2;
    sigma_bw(T)=P1*P2*((u1-u2)^2);
    if(sigma_bw(T)>max)
        max=sigma_bw(T);
        threshold=T;
    end
end
[M N]=size(I);
for i=1:M
    for j=1:N
        if(Id(i,j)>threshold)
            Td1(i,j)=1;
        else
            Td1(i,j)=0;
        end
    end
end
figure
imshow(Td1)
title('Global Thresholding Using Otsu Method')

%Multi-level Thresholding using Function
img_seg = multithresh(I,2);
i = imquantize(I,img_seg);
figure
imshow(i,[])
title('3-Level Otsu Thresholding Using Function')

%Multi-level Thresholding using Algorithm
hist=imhist(I);
Mt=0;

for i=1:256
    p(i)=J(i)/(M*N);
    Mt=Mt+(i*p(i));                    
end

opt_1=0;opt_2=0;

max_var=0;

w1 = 0;m1 = 0;c1 = 0;p1 = 0;

w2 = 0;m2 = 0;c2 = 0;p2 = 0;

tr1=0;tr2=0;

for tr1=1:256
    p1=p1+p(tr1);
    w1=w1+(tr1*p(tr1));
    m1=w1/p1;
    c1=p1*(m1-Mt)*(m1-Mt);
    
    w2 = 0;m2 = 0;c2 = 0;p2 = 0;
   
    for tr2=tr1+1:256
        p2=p2+p(tr2);
        w2=w2+tr2*p(tr2);
        m2=w2/p2;
        c2=p2*(m2-Mt)*(m2-Mt);
        
        p3=1-(p1+p2);
        w3=Mt-(w1+w2);
        m3=w3/p3;
        c3=p3*(m3-Mt)*(m3-Mt);
        
        c=c1+c2+c3;
        
        if(max_var<c)
            max_var=c;
            opt_1=tr1;
            opt_2=tr2;
        end
    end
end

for i=1:M
    for j=1:N
        if(Id(i,j)<opt_1)
            Re(i,j)=0;
        end
        if(Id(i,j)>=opt_1 && Id(i,j)<opt_2)
            Re(i,j)=0.5;
        end
        if(Id(i,j)>=opt_2)
            Re(i,j)=1;
        end
    end
end

figure
imshow(Re)
title('3-Level Otsu Thresholding Using Algorithm')

figure
plot(hist)