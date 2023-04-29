%% Patch extraction from healthy skin to generate dictionary for healthy skin

% dictionary initialization
X1 = [];

% patch size
width = 23;
w = floor(width / 2);

    % coordinates of patches to be extracted
    load('D:\Users\12280\Desktop\Burns\FDB\fdb2_6', 'x6', 'y6')

    % number of patches to extract from each region
    patch_number = size(x6, 1);
    
    for i = 1 : patch_number  
        a = [];
        if ((y6(i) - w > 0) && (y6(i) + w <= r) && (x6(i) - w > 0) && (x6(i) + w <= c))       
            gray_patch = Gray(y6(i) - w : y6(i) + w, x6(i) - w : x6(i) + w);
            color_patch1 = RGB(y6(i) - w : y6(i) + w, x6(i) - w : x6(i) + w, 2);
            color_patch2 = RGB(y6(i) - w : y6(i) + w, x6(i) - w : x6(i) + w, 3);
            v = double(gray_patch(:));
            v1 = double(color_patch1(:));
            v2 = double(color_patch2(:));
            cm = GLCM(gray_patch, 256, 1, 1);
            a = [mean(v); var(v); kurtosis(v); mean(v1); var(v1); kurtosis(v1); mean(v2); var(v2); kurtosis(v2); ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 1);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 1);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 1, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 1, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            
            a = a / norm(a);
            X1 = [X1 a];     
       end   
    end



%% Patch extraction from burnt skin to generate dictionary for first-degree burnt skin

% dictionary initialization
X2 = [];

    % coordinates of patches to be extracted
    load('D:\Users\12280\Desktop\Burns\FDB\fdb2_7', 'x7', 'y7')

    for i = 1 : patch_number 
        a = [];
        if ((y7(i) - w > 0) && (y7(i) + w <= r) && (x7(i) - w > 0) && (x7(i) + w <= c))
            gray_patch = Gray(y7(i) - w : y7(i) + w, x7(i) - w : x7(i) + w);
            color_patch1 = RGB(y7(i) - w : y7(i) + w, x7(i) - w : x7(i) + w, 2);
            color_patch2 = RGB(y7(i) - w : y7(i) + w, x7(i) - w : x7(i) + w, 3);
            v = double(gray_patch(:));
            v1 = double(color_patch1(:));
            v2 = double(color_patch2(:));
            cm = GLCM(gray_patch, 256, 1, 1);
            a = [mean(v); var(v); kurtosis(v); mean(v1); var(v1); kurtosis(v1); mean(v2); var(v2); kurtosis(v2); ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 1);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 1);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 1, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 1, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            
            a = a / norm(a);
            X2 = [X2 a];
       end
    end
    
    
    
%% Patch extraction from burnt skin to generate dictionary for second-degree burnt skin

% dictionary initialization
X3 = [];

    % coordinates of patches to be extracted
    load('D:\Users\12280\Desktop\Burns\FDB\fdb2_8', 'x8', 'y8')

    for i = 1 : patch_number 
        a = [];
        if ((y8(i) - w > 0) && (y8(i) + w <= r) && (x8(i) - w > 0) && (x8(i) + w <= c))
            gray_patch = Gray(y8(i) - w : y8(i) + w, x8(i) - w : x8(i) + w);
            color_patch1 = RGB(y8(i) - w : y8(i) + w, x8(i) - w : x8(i) + w, 2);
            color_patch2 = RGB(y8(i) - w : y8(i) + w, x8(i) - w : x8(i) + w, 3);
            v = double(gray_patch(:));
            v1 = double(color_patch1(:));
            v2 = double(color_patch2(:));
            cm = GLCM(gray_patch, 256, 1, 1);
            a = [mean(v); var(v); kurtosis(v); mean(v1); var(v1); kurtosis(v1); mean(v2); var(v2); kurtosis(v2); ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 1);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 1);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 1, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 1, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            
            a = a / norm(a);
            X3 = [X3 a];
       end
    end

    
%% Patch extraction from shadows to generate dictionary for shadows

% dictionary initialization
X4 = [];

    % coordinates of patches to be extracted
    load('D:\Users\12280\Desktop\Burns\FDB\fdb2_9', 'x9', 'y9')

    for i = 1 : patch_number 
        a = [];
        if ((y9(i) - w > 0) && (y9(i) + w <= r) && (x9(i) - w > 0) && (x9(i) + w <= c))
            gray_patch = Gray(y9(i) - w : y9(i) + w, x9(i) - w : x9(i) + w);
            color_patch1 = RGB(y9(i) - w : y9(i) + w, x9(i) - w : x9(i) + w, 2);
            color_patch2 = RGB(y9(i) - w : y9(i) + w, x9(i) - w : x9(i) + w, 3);
            v = double(gray_patch(:));
            v1 = double(color_patch1(:));
            v2 = double(color_patch2(:));
            cm = GLCM(gray_patch, 256, 1, 1);
            a = [mean(v); var(v); kurtosis(v); mean(v1); var(v1); kurtosis(v1); mean(v2); var(v2); kurtosis(v2); ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 1);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 1);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 1, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 1, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            
            a = a / norm(a);
            X4 = [X4 a];
       end
    end


    %% Patch extraction from background to generate dictionary for background

% dictionary initialization
X5 = [];

    % coordinates of patches to be extracted
    load('D:\Users\12280\Desktop\Burns\FDB\fdb2_10', 'x10', 'y10')

    for i = 1 : patch_number 
        a = [];
        if ((y10(i) - w > 0) && (y10(i) + w <= r) && (x10(i) - w > 0) && (x10(i) + w <= c))
            gray_patch = Gray(y10(i) - w : y10(i) + w, x10(i) - w : x10(i) + w);
            color_patch1 = RGB(y10(i) - w : y10(i) + w, x10(i) - w : x10(i) + w, 2);
            color_patch2 = RGB(y10(i) - w : y10(i) + w, x10(i) - w : x10(i) + w, 3);
            v = double(gray_patch(:));
            v1 = double(color_patch1(:));
            v2 = double(color_patch2(:));
            cm = GLCM(gray_patch, 256, 1, 1);
            a = [mean(v); var(v); kurtosis(v); mean(v1); var(v1); kurtosis(v1); mean(v2); var(v2); kurtosis(v2); ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 1);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 1);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 1, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 2);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 1, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 2, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            cm = GLCM(gray_patch, 256, 3, 3);
            a = [a; ASM(cm); CONT(cm); IDF(cm); Correlation(cm); CMVariance(cm)];
            
            a = a / norm(a);
            X5 = [X5 a];
       end
    end

