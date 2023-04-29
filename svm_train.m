function [alpha, b] = svm_train(tset, dv)

    % size of training set
    N = size(tset, 1);


    % Parameters
    % parameter within Kernel function
    sigma = 0.1;
    % intercept
    b = 2 * rand - 1;
    % Constraint for Lagrange multipliers
    H = 4;
    L = 0.2;


    
    % Initializing Lagrange Multipliers
    alpha = (H - L) * rand([N, 1]) + L;


    % Computation of Kernel Matrix
    Ke = zeros(N, N);
    for i = 1 : N
        for j = 1 : N
            d = tset(i, :)' - tset(j, :)';
            d2 = d' * d;
            Ke(i, j) = exp(-d2/2);
        end
    end


    for it = 1:4000


        %% Computation of w
        w = sum((alpha' .* dv' .* tset')')';

        %% Computation of the Intercept
        Product = sum(alpha .* dv .* Ke')';

        i = find(dv == 1);
        P1 = min(Product(i));

        i = find(dv == -1);
        P2 = max(Product(i));

        b = -(P1 + P2) / 2;

        %% Selecting two Lagrange Multipliers to Update

        d = abs(sum(alpha .* dv .* Ke')' + b  * ones(N, 1));

        % index of the first Lagrange multiplier - k
        k = find(d == min(d));
        s = size(k);
        if (s(1) > 1)
            k = k(1);
        end

        % index of the second Lagrange multiplier - l
        d2 = d;
        d2(k) = 10000;
        l = find(d2 == min(d2));
        s = size(l);
        if (s(1) > 1)
            l = l(1);
        end


        %% Re-optimizing dual function in terms of the two Lagrange Multipliers
        % Epsilon
        Epsilon = - sum(alpha .* dv) + alpha(k) * dv(k) + alpha(l) * dv(l);

        % first Lagrange multiplier
        alpha(k) = (1 - dv(k) * (sum(alpha .* dv .* Ke(:, k)) - alpha(k) * dv(k) * Ke(k, k))) / (dv(k)^2 * Ke(k, k));

        % second Lagrange multiplier
        alpha(l) = dv(l) * (Epsilon - alpha(k) * dv(k));

        % Satisfying Lagrange multipliers constraints: 0 < alpha < C
        if (alpha(k) < L)
            alpha(k) = L;
        end

        if (alpha(l) < L)
            alpha(l) = L;
        end

        if (alpha(k) > H)
            alpha(k) = H;
        end

        if (alpha(l) > H)
            alpha(l) = H;
        end

    end

end

