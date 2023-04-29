function feature5 = IDF(cm)
    levels = size(cm, 1);
    
    feature5 = 0;
    for i = 1 : levels
        for j = 1 : levels
            feature5 = feature5 + cm(i, j) / (1 + (i - j)^2);
        end
    end
end