function result = MidpointFilter(im)
    
M=3;
k = (M-1) / 2;
    im = padarray(im, [k, k]);
    
    [H, W] = size(im);
    result = zeros(H, W);
    
    for i = 1+k:H-k
        for j = 1+k:W-k
            subimg = im(i-k:i+k, j-k:j+k);
            result(i, j) = 0.5*(min(min((subimg))) + max(max((subimg))));
        end
    end
    
    result = result(1+k:H-k, 1+k:W-k);
    result = uint8(result);
end

