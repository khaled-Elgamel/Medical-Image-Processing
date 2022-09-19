function [new_img] =noise_uniform(img,a,b)

img=double(img);
[h w l]=size(img);

num_of_pixel=round((1/(b-a))*w*h);



for i=1:255
    
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
% histogram(new_img)
end