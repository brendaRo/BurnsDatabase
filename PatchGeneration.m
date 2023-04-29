
A = imread('D:\Users\12280\Desktop\Burns\FDB\fdb1.jpg');


imshow(A)

[x, y] = ginput(2);

r = uint16(y);

c = uint16(x);

A(:, :, 1) = imadjust(A(:, :, 1));
A(:, :, 2) = imadjust(A(:, :, 2));
A(:, :, 3) = imadjust(A(:, :, 3));
PATCH = A(r(1) : r(2), c(1) : c(2), :);
imshow(PATCH)
imwrite(PATCH, 'D:\Users\12280\Desktop\Burns\TrainingSet6\19.jpg')









B = double(A(:,:,2)) ./ double(A(:, :, 1));
Bmax = max(max(B));
Bmin = min(min(B));
B = 255 * (B - Bmin) / (Bmax - Bmin);
imshow(uint8(B))


    B = double(A(:,:,2)) ./ double(A(:, :, 1));
    Bmax = max(max(B));
    Bmin = min(min(B));
    B = 255 * (B - Bmin) / (Bmax - Bmin);
    %imshow(uint8(B))

    C = A;
    C(:, :, 1) = imadjust(A(:, :, 1));
    C(:, :, 2) = imadjust(A(:, :, 2));
    C(:, :, 3) = imadjust(A(:, :, 3));
    C = double(A);



