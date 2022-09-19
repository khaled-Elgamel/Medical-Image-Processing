function [ x ] = lntransaction( img )
[H W L]=size(img);
img=im2double(img);
x=zeros(H,W,L);
C=3;
Q=0.6;
for i=1:H
    for j=1:W
        for k=1:L
        x(i,j,k)=C *(((1+Q) .^ img(i,j,k))-1);
        end
    end
end

 %figure,imshow(img); 
 %figure,imshow(x);
end