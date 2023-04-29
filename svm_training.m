


N = size(ts, 1);

classes = 6;

% Parameters of all svms
alpha = zeros(N, classes);
b = zeros(classes, 1);
DV = [];

for class = 1 : classes
    targets2 = [];
    for ii = 1 : N
        dv = find(targets(ii, :) == 1);

        if (dv == class)
            targets2 = [targets2; 1];
        else
            targets2 = [targets2; -1];
        end
    end
    
    [alpha(:, class), b(class)] = svm_train(ts, targets2);
    DV = [DV targets2];
end