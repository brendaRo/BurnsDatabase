function cm = GLCM(patch, levels, orientation, dist)

    % size of the patch
    width = size(patch, 1);
    
    % initializing co-occurrence matrix
    cm = zeros(levels, levels);
    
    
    for i = 1 : width
        for j = 1 : width
            
            pixel = uint8(patch(i, j)) + 1;
            
            
            if (orientation == 1)
                if (j - dist >= 1)
                    neighbor = uint8(patch(i, j - dist))+ 1;
                    cm(pixel, neighbor) = cm(pixel, neighbor) + 1;
                end            
                if (j + dist <= width)
                    neighbor = uint8(patch(i, j + dist)) + 1;
                    cm(pixel, neighbor) = cm(pixel, neighbor) + 1;
                end
            end
            
            
            if (orientation == 2)
                if (i - dist >= 1)
                    neighbor = uint8(patch(i - dist, j)) + 1;
                    cm(pixel, neighbor) = cm(pixel, neighbor) + 1;
                end
                if (i + dist <= width)
                    neighbor = uint8(patch(i + dist, j)) + 1;
                    cm(pixel, neighbor) = cm(pixel, neighbor) + 1;
                end
            end
            
            
            if (orientation == 3)
                if ((i - dist >= 1) && (j - dist >= 1))
                    neighbor = uint8(patch(i - dist, j - dist)) + 1;
                    cm(pixel, neighbor) = cm(pixel, neighbor) + 1;
                end
                if ((i + dist <= width) && (j + dist <= width))
                    neighbor = uint8(patch(i + dist, j + dist)) + 1;
                    cm(pixel, neighbor) = cm(pixel, neighbor) + 1;
                end
            end
            
            
        end
    end
    
   cm = double(cm) / sum(sum(cm));
end