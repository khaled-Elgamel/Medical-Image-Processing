function [newImg] = pointdetection_sharp_Gray(Img)
Img=double(Img);
[R ,C, L]=size(Img);
h=R;
w=C;
s=2;
filter=[0 -1 0;-1 5 -1;0 -1 0];
k=1;
     
filterImg=zeros(R+2*k,C+2*k);
        [R C L]=size(filterImg);
        for i=1:k
            filterImg(i,k+1:C-k)=Img(1,:);
        end
     for i=1:k
            filterImg(R-k+i,k+1:C-k)=Img(end,:);
     end
     for i=1:k
            filterImg(1:R,i)=filterImg(:,1);

     end
         for i=1:k
            filterImg(1:R,C-k+i)=filterImg(:,end);
         end
         filterImg(1+k:R-k,1+k:C-k)=Img(1:h,1:w);
        for i=1+k:R-k
            for j=1+k:C-k
             subImg=(filterImg(i-k:i+k,j-k:j+k));
              result1=0;
            for f=1:3
                for g=1:3
                    result1=subImg(f,g)*filter(f,g)+result1;
                end
            end
            newImg(i,j)=result1;
            end
        end 
 newImg=newImg(1+k:R-k,1+k:C-k);
    newImg=uint8(newImg);
end
