clear;
cd D:\Users\12280\Desktop\Burns\

%% Original RGB Image and Generation of Image for Texture Analysis 

% Reading RGB image
RGB = imread('D:\Users\12280\Desktop\Burns\TDB\tdb6.png');
imshow(RGB);

%% Patch extraction from healthy skin to generate dictionary for healthy skin

    patch_number = 400;
    % coordinates of patches to be extracted
    [x1, y1] = ginput(patch_number);
    x1 = uint16(x1); y1 = uint16(y1);
    save('D:\Users\12280\Desktop\Burns\TDB\tdb6_1', 'x1', 'y1')
    
    
%% Patch extraction from burnt skin to generate dictionary for first-degree burnt skin

    % coordinates of patches to be extracted
    [x2, y2] = ginput(patch_number);
    x2 = uint16(x2); y2 = uint16(y2);
    save('D:\Users\12280\Desktop\Burns\TDB\tdb6_2', 'x2', 'y2')
    
%% Patch extraction from burnt skin to generate dictionary for second-degree burnt skin

    % coordinates of patches to be extracted
    [x3, y3] = ginput(patch_number);
    x3 = uint16(x3); y3 = uint16(y3);
    save('D:\Users\12280\Desktop\Burns\TDB\tdb6_3', 'x3', 'y3')
    
    %% Patch extraction from burnt skin to generate dictionary for third-degree burnt skin

    % coordinates of patches to be extracted
    [x4, y4] = ginput(patch_number);
    x4 = uint16(x4); y4 = uint16(y4);
    save('D:\Users\12280\Desktop\Burns\TDB\tdb6_4', 'x4', 'y4')
    
    %% Patch extraction from shadows to generate dictionary for shadowed skin

    % coordinates of patches to be extracted
    [x5, y5] = ginput(patch_number);
    x5 = uint16(x5); y5 = uint16(y5);
    save('D:\Users\12280\Desktop\Burns\TDB\tdb6_5', 'x5', 'y5')
    
%% Patch extraction from shadows to generate dictionary for background

    % coordinates of patches to be extracted
    [x6, y6] = ginput(patch_number);
    x6 = uint16(x6); y6 = uint16(y6);
    save('D:\Users\12280\Desktop\Burns\TDB\tdb6_6', 'x6', 'y6')
    
