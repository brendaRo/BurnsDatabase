




%% TWO-CLASS MULTI-LAYER PERCEPTRON

% size of the training set
%N = 3000;

%% PARAMETERS OF THE MLP
% number of layer
L = 2;

% number of features
p = 2;

% number of neurons per layer
n = [13, 1];
inputs_per_layer = n' + 1;
inputs_per_layer = [p + 1; inputs_per_layer(1:L-1)];


% Matrices of synaptic weights
W = rand(max(n), max(inputs_per_layer), L);

% Outputs at each layer
f = zeros(max(n), L);
y = zeros(max(n), L);


for epoch = 1 : 10
    for i = 1 : N
        
        %% FEEDFORWARD PROCESSING
        
        % feature vector
        x = [1; ts(i, :)'];
        
        % feedforward processing step at the first layer
        f(1 : n(1), 1) = W(1 : n(1), 1 : p + 1, 1) * x;
        y(1 : n(1), 1) = 1 ./ (1 + exp(-f(1 : n(1), 1)));
        
        % feedforward processing step at subsequent layers
        for l = 2 : L
            % evaluating layer l
            f(1 : n(l), l) = W(1 : n(l), 1 : n(l - 1) + 1, l) * [1; y(1 : n(l - 1), l - 1)];
            y(1 : n(l), l) = 1 ./ (1 + exp(-f(1 : n(l), l)));
        end
        
        
        %% BACKWARD PROCESSING
        % output layer
        delta2 = diag(y2 - d) * diag(1 - y2) * y2; 
        
        % hidden layers
        for l = L - 1 : -1 : 1
            delta1 = diag(W2(:, 2 : n(1) + 1)' * delta2) * diag(1 - y1) * y1;
        end
        
        W1 = W1 - lr * delta1 * x';
        W2 = W2 - lr * delta2 * [1; y1]';

    end
end



