function result = MedianFilter(im)
   
M=3;
k = (M-1) / 2;
    im = padarray(im, [k, k]);
    
    [H, W] = size(im);
    result = zeros(H, W);
    
    for i = 1+k:H-k
        for j = 1+k:W-k
            subimg = im(i-k:i+k, j-k:j+k);
            sorted = sort(reshape(subimg, [1, M.*M]));
            result(i, j) = median(sorted);
        end
    end
    
    result = result(1+k:H-k, 1+k:W-k);
    result = uint8(result);
end

