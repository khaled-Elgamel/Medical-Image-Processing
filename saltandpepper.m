function [new_img] =saltandpepper(img,ps,pp)

[h w l]=size(img);

num_of_salt=round(ps*w*h);
num_of_pepr=round(pp*w*h);

for i=1:num_of_salt
    
    row=ceil(rand(1,1)*h);
    colom=ceil(rand(1,1)*w);
    img(row,colom,1)=255;
    img(row,colom,2)=255;
    img(row,colom,3)=255;
    
end

for i=1:num_of_pepr
    
    row=ceil(rand(1,1)*h);
    colom=ceil(rand(1,1)*w);
    img(row,colom,1)=0;
    img(row,colom,2)=0;
    img(row,colom,3)=0;
    
end

new_img=img;
new_img=uint8(new_img);
imshow(new_img)
end