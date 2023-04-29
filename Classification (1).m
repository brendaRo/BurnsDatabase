


%% TRAINING
Training;

%% INPUT IMAGE
cd D:\Users\12280\Desktop\Burns
A = imread('D:\Users\12280\Desktop\Burns\FDB\fdb2.jpg');
imshow(A)

%% PREPROCESSING
% Luminosity Model
I = 0.21 * A(:, :, 1) + 0.72 * A(:, :, 2) + 0.07 * A(:, :, 3);
[r, c, ch] = size(I);
%imshow(I)

% Contrast stretching
B1 = A;
B1(:, :, 1) = imadjust(A(:, :, 1));
B1(:, :, 2) = imadjust(A(:, :, 2));
B1(:, :, 3) = imadjust(A(:, :, 3));
%imshow(uint8(B1))

% Ratio between green and red channels
B2 = 0.21 * B1(:, :, 1) + 0.72 * B1(:, :, 2) + 0.07 * B1(:, :, 3);
B3 = double(A(:,:,2)) ./ double(A(:, :, 1));
Bmax = max(max(B3));
Bmin = min(min(B3));
B3 = 255 * (B3 - Bmin) / (Bmax - Bmin); 
%imshow(uint8(B3))

%% WAVELET ANALYSIS
figure(2)
WaveletAnalysis;
%WaveletSynthesis;
figure(3)
cputime
KMEANS;
cputime
% Image dimensions
[R, C, P] = size(A);

% Output Image
Output = zeros(R, C, P);
Output = A;

% K is the total number of clusters

for k = 1 : K
    
    % Extraction of positions (row and column) of pixels belonging to cluster k
    [i, j] = find(Clusters == k);
    pixels = size(i, 1);
    
    % Feature extraction from cluster k
    if (pixels > 100)
        xx = RegionalFeatureExtraction(i, j, B1, B2);
     
        % Classification of Feature Vector
        %Class = MLP_classification(xx, W1, W2);
        Class = kNN(xx, ts, targets);
        %Class = LDA_classification(xx, U, CovM, piv);
    
        if (Class <= 2)
            for p = 1 : pixels
              %if ((Clusters2(i(p), j(p))~=123)&&(Clusters2(i(p), j(p))~=93)&&(Clusters2(i(p), j(p))~=109)&&(Clusters2(i(p), j(p))~=94)&&(Clusters2(i(p), j(p))~=150)&&(Clusters2(i(p), j(p))~=134))
                Output(i(p), j(p), 1) = 0;
                Output(i(p), j(p), 2) = 0;
                Output(i(p), j(p), 3) = 0;
                Output(i(p), j(p), Class) = 255;
              %end
            end
        end

    end
end


vv = [];
%vv = [125; 135; 136; 137; 139; 153; 154; 155];
ss = size(vv, 1);
for jj = 1 : ss
    [i, j] = find(Clusters2 == vv(jj));
    pixels = size(i, 1);
        
    for p = 1 : pixels
        Output(i(p), j(p), 1) = 255;
        Output(i(p), j(p), 2) = 0;
        Output(i(p), j(p), 3) = 0;
    end
end


figure(4)
imshow(Output)
cputime