%% TWO-CLASS MULTI-LAYER PERCEPTRON
function [W1, W2] = MLP_training(ts, targets, n, lr, Epochs)
    %% PARAMETERS - USER DEFINED
 
    % layers
    L = 2;

    % number of features
    p = size(ts, 2);
    
    % number of observations
    N = size(ts, 1);
 
    
    %% INITIALIZATION
    % Initialization of synaptic weights for each layer
    W1 = 2 * rand(n(1), p + 1) - 1;
    W2 = 2 * rand(n(2), n(1) + 1) - 1;
 
    % layer outputs
    y1 = zeros(n(1), 1);
    y2 = zeros(n(2), 1);
 
    % local gradients for each layer
    delta2 = zeros(n(2), 1);
    delta1 = zeros(n(1), 1);

    for epoch = 1 : Epochs
        for observation = 1 : N

            %% FORWARD STEP
            % feature vector extracted from the training set
            x = [1; ts(observation, :)'];
            d = targets(observation, :)';
        
            % input layer
            y1 = 1 ./ (1 + exp(- W1 * x));       
        
            % sub-sequent layers          
            y2 = 1 ./ (1 + exp(- W2 * [1; y1]));
            
        
            %% BACKWARD STEP - SYNAPTIC WEIGHT ADJUSTMENT
        
            % output layer
            delta2 = diag(y2 - d) * diag(1 - y2) * y2; 
        
            % hidden layers
            for l = L - 1 : -1 : 1
                delta1 = diag(W2(:, 2 : n(l) + 1)' * delta2) * diag(1 - y1) * y1;
            end
        
            W1 = W1 - lr * delta1 * x';
            W2 = W2 - lr * delta2 * [1; y1]';
        end
    end
end
