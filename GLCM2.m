function cm = GLCM2(A, r, c, orientation, dist)

    % size of the patch
    N = size(r, 1);
    
    % initializing co-occurrence matrix
    cm = zeros(256, 256);
    
    % Image dimensions
    [height, width] = size(A);
    
    for i = 1 : N
            
            pixel = uint8(A(r(i), c(i)) + 1);
            
            
            if (orientation == 1)
                if (c(i) - dist >= 1)
                    neighbor = uint8(A(r(i), c(i) - dist) + 1);
                    cm(pixel, neighbor) = cm(pixel, neighbor) + 1;
                end            
                if (c(i) + dist <= width)
                    neighbor = uint8(A(r(i), c(i) + dist) + 1);
                    cm(pixel, neighbor) = cm(pixel, neighbor) + 1;
                end
            end
            
            
            if (orientation == 2)
                if (r(i) - dist >= 1)
                    neighbor = uint8(A(r(i) - dist, c(i)) + 1);
                    cm(pixel, neighbor) = cm(pixel, neighbor) + 1;
                end
                if (r(i) + dist <= height)
                    neighbor = uint8(A(r(i) + dist, c(i)) + 1);
                    cm(pixel, neighbor) = cm(pixel, neighbor) + 1;
                end
            end
            
            
            if (orientation == 3)
                if ((r(i) - dist >= 1) && (c(i) - dist >= 1))
                    neighbor = uint8(A(r(i) - dist, c(i) - dist) + 1);
                    cm(pixel, neighbor) = cm(pixel, neighbor) + 1;
                end
                if ((r(i) + dist <= height) && (c(i) + dist <= width))
                    neighbor = uint8(A(r(i) + dist, c(i) + dist) + 1);
                    cm(pixel, neighbor) = cm(pixel, neighbor) + 1;
                end
            end
    end
    
   cm = double(cm) / sum(sum(cm));
end