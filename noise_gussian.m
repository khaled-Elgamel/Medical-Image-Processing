function [new_img] =noise_gussian(img,v,m)

img=double(img);
[h w l]=size(img);

for i=1:255
    
    num_of_pixel=round(((exp(-((i-m)^2/(2*v*v))))/(sqrt(2*3.14*v*v)))*w*h);
    for j=1:num_of_pixel
           row=ceil(rand(1,1)*h);
           colom=ceil(rand(1,1)*w);
           img(row,colom,1)=img(row,colom,1)+i;
           img(row,colom,2)=img(row,colom,2)+i;
           img(row,colom,3)=img(row,colom,3)+i;
    end       
    
end
for k=1:l
    mn=min(min(img(:,:,k)));
    mx=max(max(img(:,:,k)));
    new_img(:,:,k)=((img(:,:,k)-mn)/(mx-mn))*255;
end
new_img=uint8(new_img);
imshow(new_img)
end