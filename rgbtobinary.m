function [binone] = rgbtobinary(img,threshold)
%img_gray=rgbtogray(img);
img_gray=rgb2gray(img);

[h,w l]=size(img_gray);
binone=zeros(h,w);
for i=1:h
    for j=1:w
        f=img_gray(i,j);
        if f>threshold
            binone(i,j)=255;
        else
            binone(i,j)=0;
        end
    end
end

binone=uint8(binone);
imshow(binone);
end