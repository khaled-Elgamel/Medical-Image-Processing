function [] = histogram(img)

histarr = zeros(256,1);
[H , W ] = size(img);
for i=1:H
    for j=1:W
        histarr(img(i,j)+1)=histarr(img(i,j)+1)+1;

    end
 bar(histarr);
 
end