function [newImg] = linedetection(Img,t,u)
Img=double(Img);
[R ,C, L]=size(Img);
h=R;
w=C;
n=2;
if(t==1)
%     sobel mask
    if(u==1)
%         horizontal
filter=[-1 -2 -1;0 0 0;1 2 1];
    elseif(u==2)
%         vertical
filter=[-1 0 1;-2 0 2;-1 0 1];
    elseif(u==3)
        filter=[2 1 0;1 0 -1; 0 -1 -2];
%         left diagonal
    else
%         right diagonal 
filter=[0 -1 -2;1 0 -1;2 1 0];
    end
k=1;
if(L==3)
    if(n==1)
        Img=padarray(Img,[k,k]);
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
    elseif(n==2)
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
        else
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
    end
%     GRAY
else
     if(n==1)
        Img=padarray(Img,[k,k]);
        [R ,C, L]=size(Img);
        newImg=zeros(R, C);
    for i=1+k:R-k
        for j=1+k:C-k
             subImg=(Img(i-k:i+k,j-k:j+k));
             result1=0;
            for f=1:3
                for g=1:3
                    result1=subImg(f,g)*filter(f,g)+result1;
                end
            end
            newImg(i,j)=result1;
            
        end
    end
    elseif(n==2)
        [R ,C, L]=size(Img);
        newImg=zeros(R, C);
        for i=1+k:R-k
            for j=1+k:C-k
             subImg=(Img(i-k:i+k,j-k:j+k));
              result1=0;
            for f=1:3
                for g=1:3
                    result1=subImg(f,g)*filter(f,g)+result1;
                end
            end
            newImg(i,j)=result1;
            end
        end
        else
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
    end
end
% ///////////////////
else
%     robert mask
    if(u==1)
%         horizontal
filter=[0 1 0;0 0 0;0 -1 0];
    elseif(u==2)
%         vertical
filter=[0 0 0;1 0 -1 ;0 0 0];
    elseif(u==3)
%         left diagonal
        filter=[1 0 0 ;0 0 0;0 0 -1];

    else
%         right diagonal 
filter=[0 0 1;0 0 0;-1 0 0];
    end

k=1;
if(L==3)
    if(n==1)
        Img=padarray(Img,[k,k]);
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
    elseif(n==2)
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
        else
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
    end
%     GRAY
else
     if(n==1)
        Img=padarray(Img,[k,k]);
        [R ,C, L]=size(Img);
        newImg=zeros(R, C);
    for i=1+k:R-k
        for j=1+k:C-k
             subImg=(Img(i-k:i+k,j-k:j+k));
             result1=0;
            for f=1:3
                for g=1:3
                    result1=subImg(f,g)*filter(f,g)+result1;
                end
            end
            newImg(i,j)=result1;
            
        end
    end
    elseif(n==2)
        [R ,C, L]=size(Img);
        newImg=zeros(R, C);
        for i=1+k:R-k
            for j=1+k:C-k
             subImg=(Img(i-k:i+k,j-k:j+k));
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
        else
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
        
    end
end
end
 newImg=newImg(1+k:R-k,1+k:C-k)+Img(1+k:R-k,1+k:C-k);    
 newImg=uint8(newImg); 
end
