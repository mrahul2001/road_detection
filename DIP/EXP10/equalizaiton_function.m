function[Equalized_Image]=equalizaiton_function(II)
[M N]=size(II);
II=II*255;
Frequency=zeros(1,256);
for i = 1:M
    for j = 1:N
        Frequency(II(i,j))=Frequency(II(i,j))+1;
    end
end
PDF=Frequency/(M*N);

CDF=zeros(1,256);
CDF(1)=PDF(1);

for i=2:256
    CDF(i)=CDF(i-1)+PDF(i);
end
CDF=round(255*CDF);

Equalized_Image=zeros(M);
for i=1:M
    for j=1:N
        T=(II(i,j)+1);
        Equalized_Image(i,j)=CDF(T);
    end
end
Equalized_Image=uint8(Equalized_Image);
end