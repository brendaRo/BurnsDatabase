function [r, g, b] = third_CM(patch)
    
    a = patch(:, :, 1);
    r = moment(a(:), 3);
    
    a = patch(:, :, 2);
    g = moment(a(:), 3);
    
    a = patch(:, :, 3);
    b = moment(a(:), 3);
end