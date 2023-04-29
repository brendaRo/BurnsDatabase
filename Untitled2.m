
% synaptic weights
w = [-1; 0; 0; 3; 1; 0];

% Random generation of 100 feature vectors
hold on
for i = 1 : 1000
    % Features
    x1 = 8 * rand - 4;
    x2 = 8 * rand - 4;

    % Discriminant function
    x = [1; x1; x2; x1^2; x2^2; x1*x2];
    f  = w' * x;
    
    if (f > 0)
        plot(x1, x2, 'ro')
    end
    if (f < 0)
        plot(x1, x2, 'go')
    end
end




x = [0 0 0 0 2 1 -2 1 -1 0];
n = [-5 -4 -3 -2 -1 0 1 2 3 4];
plot(n, x)

% Scaling operation
y1 = 2 * x;
hold on
plot(n, y1)


% time-advance version by three samples
y2 = 2 * [0 2 1 -2 1 -1 0 0 0 0];
n = [-5 -4 -3 -2 -1 0 1 2 3 4];
plot(n, y2)



y = [];
for f = -5: 0.01 :5
    if (f > 0)
        y = [y 1];
    else
        y = [y 0];
    end    
end

plot(y)



