function [ const_img ] = hist_stret(img)
[h, w , l]=size(img);
const_img=zeros(h,w,l);
img=im2double(img);
rmin=double(min(img(:)));
rmax=double(max(img(:)));
smin=0;
smax=255;

for i=1:h
    for j=1:w
        for k=1:l
        const_img(i,j,k)=(((smax-smin)*(img(i,j,k)-rmin))/(rmax-rmin))+smin;
        end
    end
end
const_img=uint8(const_img);
end
