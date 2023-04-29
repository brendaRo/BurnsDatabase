function [r, g, b] = second_CM(patch)
    
  
    a = patch(:, :, 1);
    r = moment(a(:), 2);
    
    a = patch(:, :, 2);
    g = moment(a(:), 2);
    
    a = patch(:, :, 3);
    b = moment(a(:), 2);
end