function Class = MLP_classification(x, W1, W2);

    y1 = 1 ./ (1 + exp(- W1 * [1; x]));
    
    y2 = 1 ./ (1 + exp(- W2 * [1; y1]));

    Class = find(y2 == max(y2));
    
end
