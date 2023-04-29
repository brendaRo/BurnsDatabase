function Class = svm_Classification(xx, SV, dv, alpha, b)

    % Number of support vectors
    N = size(SV, 1);
    
    % Number of votes for each class
    votes = zeros(6, 1);
    
    Class = svm(x, SV, dv, alpha, b)

    for class = 1 : 6
        
        yy = svm(xx, SV, dv(:, class), alpha(:, class), b(class));

        for jj = 1 : 6
            if ((yy == 1) && (jj == class))
                votes(jj) = votes(jj) + 1;
            end
            if ((yy == -1) && (jj ~= class))
                votes(jj) = votes(jj) + 1;
            end
        end
    end
    
    [value, Class] = max(votes);

end