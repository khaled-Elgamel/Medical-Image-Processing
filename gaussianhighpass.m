function[output_img]= gaussianhighpass(img)
[H W L]=size(img);
FT_img=fft2(img);
FT_img=fftshift(FT_img);
D0=15;
if(L==3)
    filter=zeros(H,W,3);
for i=1:H
    for j=1:W
        dis=sqrt((((H/2)-i)^2)+(((W/2)-j)^2));
        
            filter(i,j,1)=(exp(1))^(-(dis*dis)/(2*D0*D0));
            filter(i,j,2)=(exp(1))^(-(dis*dis)/(2*D0*D0));
            filter(i,j,3)=(exp(1))^(-(dis*dis)/(2*D0*D0));
    end
end
else
filter=zeros(H,W);
for i=1:H
    for j=1:W
        dis=sqrt((((H/2)-i)^2)+(((W/2)-j)^2));
        
            filter(i,j)=(exp(1))^(-(dis*dis)/(2*D0*D0));
        
    end
end
end

filter=1-filter;

G=filter.*FT_img;
output_img=fftshift(G);
output_img=ifft2(output_img);
output_img=abs(output_img);
 output_img=log(1+output_img);
output_img=mat2gray(output_img);

end
