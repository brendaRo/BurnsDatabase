


% number of features
p = size(ts, 2);

% size of training set
NN = size(ts, 1);

% Computation of average value for each class
U = double(zeros(p, 6));

% number of samples for each class
n = zeros(6, 1);

for i = 1 : NN
    
    % class value for ith observation
    d = targets(i, :);
    class = find(d == 1);
    
    % feature vector for ith observation
    x = ts(i, :)';
    
    U(:, class) = U(:, class) + x;
    n(class) = n(class) + 1;
end

for i = 1 : 6
    U(:, i) = U(:, i) / double(n(i));
end


% Computation of prior probability for each class
piv = double(n) / double(NN);


% Computation of Covariance Matrix
bb = double(zeros(p, p, 6));

for i = 1 : NN
    d = targets(i, :);
    x = ts(i, :)';
    class = find(d == 1);
    bb(:, :, class) = bb(:, :, class) + (x - U(:, class)) * (x - U(:, class))';
end

aa = 0;
for i = 1 : 6
    aa = aa + bb(:, :, i);
end
CovM = aa / (NN - 6);