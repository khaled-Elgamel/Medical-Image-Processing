function result = HistEq(im)
    [H, W , l] = size(im);
    count = zeros(256, 1);
    cdf = zeros(256, 1);
    for i=1:H
        for j=1:W
            count(im(i, j) + 1) = count(im(i, j) + 1) + 1;
        end
    end
    p = count / (H*W);
    for i=1:256
        cdf(i) = p(i);
        if i ~= 1
            cdf(i) = cdf(i) + cdf(i - 1);
        end
    end
    s = round(255*cdf);
    result = zeros(H, W , l);
    for i=1:H
        for j=1:W
            for k=1: l
            result(i, j , k) = s(im(i, j , k) + 1);
            end
        end
    end
    
    result = uint8(result);
end

