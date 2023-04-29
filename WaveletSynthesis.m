

c2 = size(CdD, 2);
r2 = size(CdD, 1);

hs = (1 / sqrt(2)) * [1; 1]; 
hd = (1 / sqrt(2)) * [1; -1];

R1 = [];
R2 = [];

Cs2 = zeros(r2, c2);

for m = 1 : r2
     
    % Upscaling and convolving diagonal detail coefficients for each row
    x = CdD(m, :);
    x = upsample(x, 2);
    y = conv(x, hd');
    
    % Convolving vertical detail coefficients for each row
    x = CdV(m, :);
    x = upsample(x, 2);
    y = y + conv(x, hs');
    R1 = [R1; y(1 : c)];
    
    % Upscaling and convolving horizontal detail coefficients for each row
    x = CdH(m, :);
    x = upsample(x, 2);
    y = conv(x, hd');
    
    % Upscaling and convolving scaling coefficients for each row
    x = Cs2(m, :);
    x = upsample(x, 2);
    y = y + conv(x, hs');
    R2 = [R2; y(1 : c)];
end

R = [];

for n = 1 : c
    % Upscaling and convolving detail coefficients with each column
    x = R1(:, n);
    x = upsample(x, 2);
    y = conv(x, hd);
    
    % Upscaling and convolving scaling coefficients with each column
    x = R2(:, n);
    x = upsample(x, 2);
    y = y + conv(x, hs);
    R = [R y(1:r)];
end

imshow(R)