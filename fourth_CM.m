function [r, g, b] = fourth_CM(patch)
    
    a = patch(:, :, 1);
    r = moment(a(:), 4);
    
    a = patch(:, :, 2);
    g = moment(a(:), 4);
    
    a = patch(:, :, 3);
    b = moment(a(:), 4);
end