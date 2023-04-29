%% KNN CLASSIFIER
function class = kNN(x, ts, targets)

    % K must be an odd number
    KK = 3;
    
    % Size of the training set
    NN = size(ts, 1);
    
    % indexes of the k nearest neigbors
    indexes = [];
    % classes of the k nearest neighbors
    classes = [];
    
    for kk = 1 : KK
        
        dmin = 1000000000;
        for ii = 1 : NN
            % observation i
            xi = double(ts(ii, :))';
            
            % distance between x and xi
            dist = norm(x - xi, 2);
            
            if ((dist < dmin) && (~ismember(ii, indexes)))
               dmin = dist;
               index = ii;
               class = targets(ii, :);
               
               class = find(class == 1);
            end
        end
        
        indexes = [indexes; index];
        classes = [classes; class];
    end
    
    d = 0;
    for c = 1 : 6
        a = find(classes == c);
        b = length(a);
        if (b > d)
            d = b;
            vote = c;
        end
    end
    class = vote;
end