function [x, r] = MP(D, y, L, err)

% Matching Pursuit for Sparse Signal Reconstruction based on the Algorithm
% proposed by Mallat and Zhang

% Input
% D = N X K dimensional measurment matrix
% y = N dimensional observation vector
% L = sparsity of the underlying signal

% Output
% x = estimated sparse signal
% r = residual 

if nargin < 4
     err = 1e-5;
end

% Number of atoms in dictionary D
[row, col] = size(D);
K = col;

% Initializing sparse representation
x = double(zeros(K, 1));

% Initializing number of iterations
iter = 10;

% Initializing residual and approximation
r = y;

% Initializing set of indexes of atoms for sparse representation of y
indexes = [];

% Set of atoms that is the basis for the sparse representation of y
DL = [];

% Initializing variable for number of atoms that are part of the sparse
% representation of the signal
l = 0;

for i = 1 : iter 
    
    coeff_max = 0;
    n = 0;
    
    % Computing all the inner products between current residual and each
    % dictionary element to find the one with the highest inner product
   
    if (l < L)
        % If sparsity high limit is not met the search for the maximum
        % inner product takes place in the entire dictionary
        for k = 1 : K
        
            % kth element of dictionary
            d = D(:, k);
        
            % inner prodcut between current residual and kth atom
            coeff = r' * d;
             
            % testing if inner product is the maximum so far
            if (coeff > coeff_max)
                coeff_max = coeff;
                
                % updating index of atom with highest projection
                n = k;
            end;
        end;
    else
        % If sparsity high limit is met the search for the maximum inner
        % product takes place in the set of L atoms that form the basis for
        % sparse representation of the signal
        for k = 1 : L
            % kth element of dictionary
            d = DL(:, k);
        
            % inner prodcut between current residual and kth atom
            coeff = r' * d;
        
            % testing if current product is the maximum so far
            if (coeff > coeff_max)
                coeff_max = coeff;
                
                % index of atom with highest projection
                n = indexes(k);
            end;
            
        end;
    end;
    
    % The optimal representation has been found
    if (n == 0)
        break;
    end;
    
    % Updating residual
    r = r - coeff_max * D(:, n);
    % Updating coefficient
    x(n) = x(n) + coeff_max;
    
    % verifying if atom with the highest inner product is already part of
    % the sparse representation of the signal
    flag = find(indexes == n);
        
    if (flag ~= 0)
    elseif (l < L)
    % atom with highest inner product is not part of sparse
    % representation and the sparsity high limit is not met yet
        
        % set of indexes corresponding to atoms that are part of the sparse
        % representation of the signal
        indexes = [indexes n];
        
        % sparsity so far
        l = length(indexes);
        
        % set atoms that are part of the sparse representation so far
        DL = [DL D(:, n)];
    end;    
    
    % verifying stopping rule
    r_norm = norm(r);
    if (r_norm < err)
        break;
    end;
    
end;