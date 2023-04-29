function x = RegionalFeatureExtraction(r, c, A1, A2)

    % Number of region pixels
    N = size(r, 1);
    
    % Initialization of feature vector
    x = [];
    
    B = double(A1);
    
    %% Avegare channel values
    mean_red = 0;
    mean_green = 0;
    mean_blue = 0;
    for i = 1 : N
        mean_red = mean_red + B(r(i), c(i), 1);
        mean_green = mean_green + B(r(i), c(i), 2);
        mean_blue = mean_blue + B(r(i), c(i), 3);
    end
    mean_red = mean_red / N;
    mean_green = mean_green / N;
    mean_blue = mean_blue / N;
    x2 = [mean_red; mean_green; mean_blue];
    x = [x; double(x2)/double(255)];
    
    
    %% Channel variances
    var_red = 0;
    var_green = 0;
    var_blue = 0;
    for i = 1 : N
        var_red = var_red + (B(r(i), c(i), 1) - mean_red)^2;
        var_green = var_green + (B(r(i), c(i), 2) - mean_green)^2;
        var_blue = var_blue + (B(r(i), c(i), 2) - mean_blue)^2;
    end
    var_red = var_red / double(N);
    var_green = var_green / double(N);
    var_blue = var_blue / double(N);
    x2 = [var_red/(255.1 - mean_red)^2; var_green/(255.1 - mean_green)^2; var_blue/(255.1 - mean_blue)^2];
    x = [x; x2];
    
    
    
    %% Channel skewness
    skew_red = 0;
    skew_green = 0;
    skew_blue = 0;
    for i = 1 : N
        skew_red = skew_red + (B(r(i), c(i), 1) - mean_red)^3;
        skew_green = skew_green + (B(r(i), c(i), 2) - mean_green)^3;
        skew_blue = skew_blue + (B(r(i), c(i), 2) - mean_blue)^3;
    end
    skew_red = skew_red / double(N);
    skew_green = skew_green / double(N);
    skew_blue = skew_blue / double(N);
    x = [x; skew_red/(255.1 - mean_red)^3; skew_green/(255.1 - mean_green)^3; skew_blue/(255.1 - mean_red)^3];
    
    %% Avegare luminosity value
    
    mean_luminosity = 0;
    for i = 1 : N
        mean_luminosity = mean_luminosity + A2(r(i), c(i), 1);
    end
    
    mean_luminosity = mean_luminosity / N;

    %x = [x; double(mean_luminosity)/double(255)];
    
    
    
    %% Channel kurtosis
    kurt_red = 0;
    kurt_green = 0;
    kurt_blue = 0;
    %for i = 1 : N
    %    kurt_red = kurt_red + (B(r(i), c(i), 1) - mean_red)^4;
    %    kurt_green = kurt_green + (B(r(i), c(i), 2) - mean_green)^4;
    %    kurt_blue = kurt_blue + (B(r(i), c(i), 2) - mean_blue)^4;
    %end
    %kurt_red = kurt_red / N;
    %kurt_green = kurt_green / N;
    %kurt_blue = kurt_blue / N;
%    x = [x; kurt_red; kurt_green; kurt_blue];
    
    %% Entropy
    %C = 0.21 * B(:, :, 1) + 0.72 * B(:, :, 2) + 0.07 * B(:, :, 3);
    %glcm = GLCM2(C, r, c, 1, 3);
    %E1 = Entropy(glcm);
    %glcm = GLCM2(C, r, c, 2, 3);
    %E2 = Entropy(glcm);
    %glcm = GLCM2(C, r, c, 3, 3);
    %E3 = Entropy(glcm);
    %x = [x; E1; E2; E3];
    
    
    %% Normalization
    %x = x / norm(x);
end