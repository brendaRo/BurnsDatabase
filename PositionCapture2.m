clear;
cd D:\Users\12280\Desktop\Burns\

%% Original RGB Image and Generation of Image for Texture Analysis 

% Reading RGB image
RGB = imread('D:\Users\12280\Desktop\Burns\FDB\fdb1.jpg');
imshow(RGB);

%% Patch extraction from healthy skin to generate dictionary for healthy skin

    patch_number = 50;
    % coordinates of patches to be extracted
    [x6, y6] = ginput(patch_number);
    x6 = uint16(x6); y6 = uint16(y6);
    save('D:\Users\12280\Desktop\Burns\FDB\fdb1_6', 'x6', 'y6')
    
    
%% Patch extraction from burnt skin to generate dictionary for first-degree burnt skin

    % coordinates of patches to be extracted
    [x7, y7] = ginput(patch_number);
    x7 = uint16(x7); y7 = uint16(y7);
    save('D:\Users\12280\Desktop\Burns\FDB\fdb1_7', 'x7', 'y7')
    
%% Patch extraction from burnt skin to generate dictionary for second-degree burnt skin

    % coordinates of patches to be extracted
    [x8, y8] = ginput(patch_number);
    x8 = uint16(x8); y8 = uint16(y8);
    save('D:\Users\12280\Desktop\Burns\FDB\fdb1_8', 'x8', 'y8')
    
%% Patch extraction from shadows to generate dictionary for background

    % coordinates of patches to be extracted
    [x9, y9] = ginput(patch_number);
    x9 = uint16(x9); y9 = uint16(y9);
    save('D:\Users\12280\Desktop\Burns\FDB\fdb1_9', 'x9', 'y9')
    
%% Patch extraction from shadows to generate dictionary for shadows

    % coordinates of patches to be extracted
    [x10, y10] = ginput(patch_number);
    x10 = uint16(x10); y5 = uint16(y10);
    save('D:\Users\12280\Desktop\Burns\FDB\fdb1_10', 'x10', 'y10')