function feature3 = Correlation(cm)
    levels = size(cm, 1);

    P = sum(cm);
    
    u = 0;
    for i = 1 : levels
        u = u + (i - 1) * P(i);
    end
    
    sigma = 0;
    for i = 1 : levels
        sigma = sigma + (i - 1 - u)^2 * P(i);
    end
    
    feature3 = 0;
    for i = 1 : levels
        for j = 1 : levels
            feature3 = feature3 + (i - 1) * (j - 1) * cm(i, j);
        end
    end
    feature3 = feature3 - u^2;
    feature3 = feature3 / sigma^2;
end