clear;

A = imread('D:\Users\12280\Desktop\Burns\FDB\fdb2.jpg');
I = 0.21 * A(:, :, 1) + 0.72 * A(:, :, 2) + 0.07 * A(:, :, 3);
[r, c, ch] = size(I);


%% INITIALIZATION OF CLUSTER CENTROIDS
K = 12;
% coordinates of click positions
imshow(I);
[x, y] = ginput(K);
x = int16(x); y = int16(y);
Centroids = zeros(3, K);
for k = 1 : K
    Centroids(1, k) = x(k);
    Centroids(2, k) = y(k);
    Centroids(3, k) = I(uint16(y(k)), uint16(x(k)));
end



%% ITERATIVE PROCESS FOR CLUSTERING
Clusters = zeros(r, c);


for it = 1 : 2
    
    %% Each pixel is assigned a cluster
    for i = 1 : r
        for j = 1 : c
            features = double([i; j; I(i, j)]);
            features = features / norm(features);
            
            %dmin = 10000;
            dmax = -2;
            ind = 0;
            
            for k = 1 : K
                
                %d = norm(Centroids(:, k) - features);
                Centroids = Centrois / norm(Centroids);
                d = features' * Centroids;
                
                if (d > dmax)
                    dmax = d;
                    ind = k;
                end
            end
                    
            Clusters(i, j) = ind;
        end
    end
    

    %% Computation of new Centroids 
    Centroids = zeros(3, K);
    count = zeros(1, K);
    for i = 1 : r
        for j = 1 : c
            ind = Clusters(i, j);
            Centroids(:, ind) = Centroids(:, ind) + double([i; j; I(i, j)]);
            count(ind) = count(ind) + 1;
        end
    end
    
    for k = 1 : K
        Centroids(:, k) = Centroids(:, k) / count(k);
    end
    
end


imshow(uint8(Clusters*255/K), [0 255])







