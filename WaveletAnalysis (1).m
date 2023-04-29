seg = 10;

H = imadjust(I);

%% HAAR TRANSFORM

hs = (1 / sqrt(2)) * [1; 1]; 
hd = (1 / sqrt(2)) * [-1; 1];

Cs = [];
Cd = [];
for j = 1 : 2 : c
    
    % column j
    x = H(:, j);
    
    % Scaling coefficient for column j
    cs = conv(x, hs);
    Cs = [Cs cs(1 : r)];
    
    % Detail coefficient for column j
    cd = conv(x, hd);
    Cd = [Cd cd(1 : r)];
end


Cs2 = [];
CdH = [];
CdV = [];
CdD = [];

c2 = size(Cs, 2)
for i = 1 : 2 : r
    % Row i and its transpose
    x = Cs(i, :)';
    
    % Scaling coefficients
    cs = conv(x, hs)';
    Cs2 = [Cs2; cs(1 : c2)];
    
    % Horizontal Detail coefficients
    cd = conv(x, hd)';
    CdH = [CdH; cd(1 : c2)];
    
    % Row i and its transpose
    x = Cd(i, :)';
    
    % Vertical Detail coefficients
    cd = conv(x, hs)';
    CdV = [CdV; cd(1 : c2)];
    
    % Diagonal Detail coefficients
    cd = conv(x, hd)';
    CdD = [CdD; cd(1 : c2)];
end

CD = (abs(CdH) + abs(CdV) + abs(CdD))/3;
%CD = sqrt((CdH.^2 + CdV.^2 + CdD.^2)/3);
%imshow(uint8(CD))

B = imadjust(uint8(CD));
%imshow(B)
C1 = imbinarize(B, 0.1);

%imshow(C1)
C2 = imbinarize(B, 0.035);
%figure(2)
%C2=C1;
imshow(C2)

%% Scanning detail coefficients to find centroids


% Dimensions of matrix with detail coefficients
[r2, c2] = size(C2);


C3 = [];
for i = 1 : r2
    C3 = [C3; C2(i, :); zeros(1, c2)];
end


[r2, c2] = size(C3);
C4 = [];
for j = 1 : c2
    C4 = [C4 C3(:, j) zeros(r2, 1)];
end

C4 = C4(1:r, 1:c);


% Segments in the original matrix
Hi = floor(r / seg);
Hj = floor(c / seg);


% Energy for each segment
E = [];
% Flag matrix
F = zeros(r, c);

for j = seg + 1 : seg : (Hj - 1) * seg;
    for i = seg + 1 : seg : (Hi - 1) * seg;
        
        Segment = C4(i : i + seg - 1, j : j + seg - 1);
        Energy = sum(sum(Segment .* Segment));
        
        if (Energy ~= 0)
            F(i : i + seg - 1, j : j + seg - 1) = ones(seg, seg);
        end     
    end
    
%    if (Hi * seg < r)
%        Segment = C4(Hi * seg + 1: r, j : j + seg - 1);
%        r2 = size(Segment, 1);
%        Energy = sum(sum(Segment .* Segment));
        
%        if (Energy ~= 0)
%            F(Hi * seg + 1: r, j : j + seg - 1) = ones(r2, seg);
%        end    
%    end
end
 
%if (Hj * seg < c)
%    j = Hj * seg + 1;
%    for i = 1 : seg : (Hi - 1) * seg;

%        Segment = C4(i : i + seg - 1, j : c);
%        c2 = size(Segment, 2);
%        Energy = sum(sum(Segment .* Segment));

%        if (Energy ~= 0)
%            F(i : i + seg - 1, j : c) = ones(seg, c2);
%        end     
%    end
%end

imshow(F)