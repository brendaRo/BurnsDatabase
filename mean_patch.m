function [ur, ug, ub] = mean_patch(patch)
    [d1 d2 d3] = size(patch);
    elements = d1 * d2;
    ur = sum(sum(patch(:, :, 1))) / elements;
    ug = sum(sum(patch(:, :, 2))) / elements;
    ub = sum(sum(patch(:, :, 3))) / elements;
end