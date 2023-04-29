function class = LDA_classification(xx, U, CovM, piv)


    classes = size(U, 2);

    maxx = -1000000000;
    class = 0;
    for ii = 1 : classes
        
        delta = log(piv(ii)) + U(:, ii)' * inv(CovM) * xx - 0.5 * U(:, ii)' * inv(CovM) * U(:, ii);
        if (delta > maxx)
            maxx = delta;
            class = ii; 
        end
    end
  
end

