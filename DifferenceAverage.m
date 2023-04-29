function [DA, DV] = DifferenceAverage(cm)

% Computation of Difference average, difference variance and difference
% entropy
    levels = size(cm, 1);
    
    Pk = zeros(levels);
    for k = 1 : levels
        
        for i = 1 : levels
            j = i + (k - 1);
            if (j <= levels)
                Pk(k) = Pk(k) + cm(i, j);
            end
            
            j = i - (k - 1);
            if (j >= 1)
                Pk(k) = Pk(k) + cm(i, j);
            end
        end
        
    end
    
    
    DA = 0;
    DV = 0;
    for i = 1 : levels
        DA = DA + Pk(i) * (i - 1);
    end
    for i = 1 : levels
        DV = DV + Pk(i) * (i - 1 - DA)^2; 
    end
    
    
end