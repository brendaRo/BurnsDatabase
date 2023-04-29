function Class = svm(x, SV, dv, alpha, b)

    % Number of support vectors
    N = size(SV, 1);

    f = 0;
    for i = 1 : N
        d = x - SV(i, :)';
        d2 = d' * d;
        f = f + alpha(i) * dv(i) * exp(-d2 / 2);
    end
    f = f + b;

    if (f > 0)
        Class = 1;
    else
        Calss = -1;
    end
end

