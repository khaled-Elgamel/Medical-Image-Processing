function [ gray ] = rgbtogray( img )
[H,W l]=size(img);
gray=zeros(H,W);
img=double(img);

for i=1:H
    for j=1:W
        
        gray(i,j)=(img(i,j,1)+img(i,j,2)+img(i,j,3))/3;
        
    end
end
gray=uint8(gray);
imshow(gray);

end

