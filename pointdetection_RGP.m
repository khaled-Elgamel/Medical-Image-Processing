function [newImg] = pointdetection_RGP(Img)
Img=double(Img);
[R ,C, L]=size(Img);
h=R;
w=C;
filter=[0 -1 0;-1 4 -1;0 -1 0];
k=1;
 filterImg=zeros(R+2*k,C+2*k);
 [R C L]=size(filterImg);
        for i=1:k
            filterImg(i,k+1:C-k,1)=Img(1,:,1);
            filterImg(i,k+1:C-k,2)=Img(1,:,2);
           filterImg(i,k+1:C-k,3)=Img(1,:,3);
        end
     for i=1:k
            filterImg(R-k+i,k+1:C-k,1)=Img(end,:,1);
            filterImg(R-k+i,k+1:C-k,2)=Img(end,:,2);
            filterImg(R-k+i,k+1:C-k,3)=Img(end,:,3);
     end
     for i=1:k
            filterImg(1:R,i,1)=filterImg(:,1,1);
            filterImg(1:R,i,2)=filterImg(:,1,2);
            filterImg(1:R,i,3)=filterImg(:,1,3);
     end
         for i=1:k
            filterImg(1:R,C-k+i,1)=filterImg(:,end,1);
            filterImg(1:R,C-k+i,2)=filterImg(:,end,2);
            filterImg(1:R,C-k+i,3)=filterImg(:,end,3);
         end
         filterImg(1+k:R-k,1+k:C-k,1)=Img(1:h,1:w,1);
        filterImg(1+k:R-k,1+k:C-k,2)=Img(1:h,1:w,2);
        filterImg(1+k:R-k,1+k:C-k,3)=Img(1:h,1:w,3);
        for i=1+k:R-k
            for j=1+k:C-k
              subImg(:,:,1)=(filterImg(i-k:i+k,j-k:j+k,1));
            subImg(:,:,2)=(filterImg(i-k:i+k,j-k:j+k,2));
            subImg(:,:,3)=(filterImg(i-k:i+k,j-k:j+k,3));
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
