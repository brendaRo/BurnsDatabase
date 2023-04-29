
[r, c] = size(F);

%% PREPROCESSING OF IMAGE
Aad = A;
Aad(:, :, 1) = imadjust(A(:, :, 1));
Aad(:, :, 2) = imadjust(A(:, :, 2));
Aad(:, :, 3) = imadjust(A(:, :, 3));

B = double(A(:,:,2)) ./ double(A(:, :, 1));
Bmax = max(max(B));
Bmin = min(min(B));
B = 255 * (B - Bmin) / (Bmax - Bmin);
%imshow(uint8(B))


%% INITIALIZATION OF CLUSTER CENTROIDS


% coordinates of click positions
%imshow(I);
%[x, y] = ginput(K);
%x = uint16(x); y = uint16(y);

%% Automatic placing of Cluster positions
n = 9;

x = []; y = [];
deltax = c / n; deltay = r / n;
x1 = deltax / 2; y1 = deltay / 2;

x = x1 * ones(n, 1);
x2 = x1;
for j = 2 : n
    x2 = x2 + deltax;
    vector = x2 * ones(n, 1);
    x = [x; x2 * ones(n, 1)];
end
x = uint16(x);


for i = 1 : n
    y2 = y1;
    for j = 1 : n
        y = [y; y2];
        y2 = y2 + deltay;
    end
end
y = uint16(y);



%% Cluster Initialization

% number of clusters
K = n * n;

% patch size
w = 21;
h = floor(w / 2);

Centroids = []; 
for k = 1 : K
    Centroid = feature_extraction(y(k), x(k), h, Aad, B);
    Centroids = [Centroids Centroid];
end

% number of features
p = size(Centroids, 1);
% reduced number of features
%reduced = 6;



%% ITERATIVE PROCESS FOR CLUSTERING

Clusters = zeros(r, c);
w2 = 1;
h2 = floor(w2 / 2);
for it = 1 : 1
    it
    %% Each pixel is assigned a cluster
    for i = h2 + 1 : w2 : r - h2
        for j = h2 + 1 : w2 : c - h2
            
            if ((F(i, j) == 1) && (i - h > 0) && (j - h > 0) && (i + h <= r) && (j + h <= c))    
            
                % pixel position
                features = feature_extraction(i, j, h, Aad, B);
            
            
                dmin = 100000000000;
                ind = 0;
            
                for k = 1 : K
                
                    d = norm(double(Centroids(:, k)) - double(features));
                
                    if (d < dmin)
                        dmin = d;
                        ind = k;
                    end
       
                    Clusters(i - h2 : i + h2, j - h2 : j + h2) = ind * ones(w2, w2);
                end
            end            
        end
    end
    
    Clusters2 = uint8(Clusters*255/K);
    imshow(Clusters2);
    


    %% Computation of new Centroids 
    Centroids = zeros(size(Centroids, 1), K);
    Centroids = double(Centroids);
    count = zeros(1, K);
    for i = h2 + 1 : w2 : r - h2
        for j = h2 + 1 : w2 : c - h2
            ind = Clusters(i, j);
            if (ind ~= 0)
                Centroids(:, ind) = Centroids(:, ind) + double(feature_extraction(i, j, h, Aad, B));
                count(ind) = count(ind) + 1;
            end
        end
    end
    
    for k = 1 : K
        if (count(k) > 0)
            Centroids(:, k) = Centroids(:, k) / count(k);
        end
    end
    
    
       
    
    %% Stopping Criteria
%    delta = 0;
%    for k = 1 : K
%        if (count(k) > 0)
%            d = double(Centroids2(:, k)) - double(Centroids(:, k));
%            delta = delta + sum(d .* d);
%        end
%    end
%    delta = sqrt(delta)
    
%    T = 10;
%    if (delta < T)
%        break;
%    else
%        Centroids = Centroids2;
%    end
    
end


%% Cluster Merging

%Clusters3 = Clusters2;
%count2 = count;
%for k = 1 : K - 1
%    k
%    if (count2(k) > 0)
        % Centroid position of Cluster k
%        i = Centroids(1, k); j = Centroids(2, k);
%        label = Clusters2(i, j);
    
%        for l = k + 1 : K
%            l
%            if (count2(l) > 0)
%                d = double(Centroids(3 : p, k)) - double(Centroids(3 : p, l));
%                delta = sqrt(sum(d .* d))
            
                % Centroid position of Cluster l
%                i = Centroids(1, l); j = Centroids(2, l);
%                label2 = Clusters2(i, j);
            
%                if (delta < 300)
%                    [i, j, v] = find(Clusters2 == label2);
%                    s = size(i, 1);
%                    for m = 1 : s
%                        Clusters3(i(m), j(m)) = label;
%                    end
%                    count2(l) = 0;
%                end
            
%            end
%        end
%    end
%end

%imshow(Clusters3)