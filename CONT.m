function feature2 = CONT(cm)
    levels = size(cm, 1);

    feature2 = 0;
    for n = 0 : levels - 1
        
        % computation of double sum
        ds = 0;
        for i = 1 : levels
            
            j = i + n;
            if (j <= levels)
                ds = ds + cm(i, j);
            end
            
            j = i - n;
            if (j >= 1)
                ds = ds + cm(i, j);
            end
        end
        
        % adjustment of contrast
        feature2 = feature2 + ds * n^2;
    end
end