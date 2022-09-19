
function [newImg] = pointdetection_Gray(Img)
Img=double(Img);
[H ,W, L]=size(Img);
h=H;
w=W;
filter=[0 -1 0;-1 4 -1;0 -1 0];
k=1;

        
        
        filterImg=zeros(H+2*k,W+2*k);
        [H W L]=size(filterImg);
        for i=1:k
            filterImg(i,k+1:W-k)=Img(1,:);
        end
     for i=1:k
            filterImg(H-k+i,k+1:W-k)=Img(end,:);
     end
     for i=1:k
            filterImg(1:H,i)=filterImg(:,1);

     end
         for i=1:k
            filterImg(1:H,W-k+i)=filterImg(:,end);
         end
         filterImg(1+k:H-k,1+k:W-k)=Img(1:h,1:w);
        for i=1+k:H-k
            for j=1+k:W-k
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
    

 newImg=newImg(1+k:H-k,1+k:W-k);
    newImg=uint8(newImg);
end


