function f4 = CMVariance(cm)
    levels = size(cm, 1);
    
    P = sum(cm);
    
    u = 0;
    for i = 1 : levels
        u = u + (i - 1) * P(i);
    end
    
    f4 = 0;
    
    for i = 1 : levels
        for j = 1 : levels
            f4 = f4 + cm(i, j) * (i - 1 - u)^2;
        end
    end
end