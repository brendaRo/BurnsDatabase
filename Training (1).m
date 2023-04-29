clear;
cd D:\Users\12280\Desktop\Burns;

% File path
str1 = 'D:\Users\12280\Desktop\Burns\TrainingSet3\';

% Patch size
l = 11;

% Training set initialization
ts = [];
targets = [];

for i = 1 : 12000
    
    % Generation of the name of the image file
    j = randi(30, 1);
    str2 = int2str(j);
    str3 = strcat(str1, str2, '.jpg');
    
    % Image reading
    A = imread(str3);
    [rows, columns, ~] = size(A);
    
    
    % PREPROCESSING OF IMAGE
%    B = double(A(:,:,2)) ./ double(A(:, :, 1));
%    Bmax = max(max(B));
%    Bmin = min(min(B));
%    B = 255 * (B - Bmin) / (Bmax - Bmin);   
    
    
    % Random generation of an image patch
        
    % Patch extraction
    while(1)
        % Patch center
        index_r = randi(rows, 1);
        index_c = randi(columns, 1);
        if ( (index_r - l >= 1) && (index_r + l <= rows) && (index_c - l >= 1) && (index_c + l <= columns))
            patch = double(A(index_r - l : index_r + l, index_c - l : index_c + l, :));
            patch2 = 0.21 * patch(:, :, 1) + 0.72 * patch(:, :, 2) + 0.07 * patch(:, :, 3);
            break;
        end
    end
    
    % Desired Value
    if (j <= 11)
        label = [1 0 0 0 0 0];
    else
        if (j <= 17)
            label = [0 1 0 0 0 0];
        else
            if (j <= 19)
                label = [0 0 1 0 0 0];
            else
                if (j <= 30)
                    label = [0 0 0 1 0 0];
                else
                    if (j <= 40)
                        label = [0 0 0 0 1 0];
                    else
                        label = [0 0 0 0 0 1];
                    end
                end
            end
        end    
    end
    
        
    %% FEATURE EXTRACTION FROM PATCH
    % patch dimension
    [rows, columns, planes] = size(patch);
    % patch positions
    [C, R] = meshgrid(1:columns, 1:rows);
    
    % Feature vector extraction
    x = RegionalFeatureExtraction(R(:), C(:), double(patch), patch2);
        
    % Concatenation of feature vector 
    ts = [ts; x'];
    
    % Concatenation of labels
    targets = [targets; label];
    
end








%% MLP TRAINING
% learning rate
lr = 0.15;

% number of neurons per layer
n = [80 6]; 

% number of Epochs
Epochs = 200;

[W1, W2] = MLP_training(ts, targets, n, lr, Epochs);







%% TRAINING LINEAR DISCRIMINANT ANALYSIS
LDA_training;


%% TRAINING SUPPORT VECTOR MACHINE
%svm_training;


