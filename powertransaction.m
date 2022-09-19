function [ x ] = powertransaction( img )
[H W L]=size(img);
img=im2double(img);
x=zeros(H,W,L);
C=3;
Y=3;
for i=1:H
    for j=1:W
        for k=1:L
        x(i,j,k)=C *img(i,j,k) ^ Y;
        end
    end
end

 %figure,imshow(img); 
 %figure,imshow(x);
end