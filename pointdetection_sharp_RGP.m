function [newImg] = pointdetection_sharp_RGP(Img)
Img=double(Img);
[R ,C, L]=size(Img);
h=R;
w=C;
s=2;
filter=[0 -1 0;-1 5 -1;0 -1 0];
k=1;
     
[R ,C, L]=size(Img);
newImg=zeros(R, C);
        for i=1+k:R-k
            for j=1+k:C-k
             subImg(:,:,1)=(Img(i-k:i+k,j-k:j+k,1));
            subImg(:,:,2)=(Img(i-k:i+k,j-k:j+k,2));
            subImg(:,:,3)=(Img(i-k:i+k,j-k:j+k,3));
            result1=0;result2=0;result3=0;
            for f=1:3
                for g=1:3
                    result1=subImg(f,g,1)*filter(f,g)+result1;
                    result2=subImg(f,g,2)*filter(f,g)+result2;
                    result3=subImg(f,g,3)*filter(f,g)+result3;
                end
            end
            newImg(i,j,1)=result1;newImg(i,j,2)=result2;newImg(i,j,3)=result3;
 
            end
        end 
        
newImg=newImg(1+k:R-k,1+k:C-k);
newImg=uint8(newImg);
end
    
  
