
%% Patch extraction for generation of collage

    % patch size
    width = 27;
    w = floor(width / 2);
    number_of_patches = 10;
    image_size = number_of_patches * width;
    Collage = uint8(zeros(image_size, image_size, 3));

    RGB = imread('D:\Users\12280\Desktop\Burns\SDB\sdb10.png');
    imshow(RGB);
    
    % coordinates of patches to be extracted
    samples_per_image = 10;
    [x, y] = ginput(samples_per_image);
    x = uint16(x); y = uint16(y);
    
    index1 = 1:10;
    index2 = [5 7 7 6 5 2 6 7 4 2];

    % patch extraction and addition to collage
    for i = 1 : samples_per_image
        patch = RGB(y(i) - w : y(i) + w, x(i) - w : x(i) + w, :);
        
        x1 = (index1(i) - 1) * width + 1;
        x2 = x1 + width - 1;
        
        y1 = (index2(i) - 1) * width + 1;
        y2 = y1 + width - 1;
        
        Collage(y1 : y2, x1 : x2, :) = patch;
    end
    
    imshow(Collage)