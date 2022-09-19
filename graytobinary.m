function [bw] = graytobinary(img,threshold)
[h, w , ~]=size(img);
bw=zeros(h,w);
img=double(img);

for i=1:h
    for j=1:w
        if img(i,j)>threshold
            bw(i,j)=25;
        end
    end
    bw=uint8(bw);
    imshow(bw);
end