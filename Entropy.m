function texture_feature = Entropy(cm)
    levels = size(cm, 1);
    
    texture_feature = 0;
    for i = 1 : levels
        for j = 1 : levels
            if (cm(i, j) > 0)
                texture_feature = texture_feature - cm(i, j) * log(cm(i, j)) / log(10);
            end
        end
    end
end