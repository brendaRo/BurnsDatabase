function f = feature_extraction(i, j, h, B, C)

            [r c p] = size(B);
            r = double(r); c = double(c);

            % pixel position
            i = uint16(i);
            j = uint16(j);
            f = [double(i)/r; double(j)/c];
            
            % color channels
            %f = [f; double(B(i, j, 1))/255; double(B(i, j, 2))/255; double(B(i, j, 3))/255];
            
            % patch extraction from image
            patch = double(B(i - h : i + h, j - h : j + h, :));
            
            % RGB mean values from patch
            [mr mg mb] = mean_patch(patch);
            f = [f; mr/255; mg/255; mb/255];
            
            % RGB second central moment from patch
            [vr vg vb] = second_CM(patch);
            f = [f; vr/(255.1 - mr)^2; vg/(255.1 - mg)^2; vb/(255.1 - mb)^2]; 
            
            % linear combination of RGB channels
            I = 0.21 * patch(:, :, 1) + 0.72 * patch(:, :, 2) + 0.07 * patch(:, :, 3);
            av = mean(mean(I));
            f = [f; av/255];
            varr = mean(mean((I - av) .* (I - av)));
          %  f = [f; varr/(255.1 - av)^2];
            
            % Ratio between red channel and green channel
            patch2 = C(i - h : i + h, j - h : j + h, :);
            av = mean(mean(patch2));
            f = [f; av/255];
            varr = mean(mean((patch2 - av) .* (patch2 - av)));
           % f = [f; varr/(255.1 - av)^2];
           
            
            % third central moment
            %[mr mg mb] = third_CM(patch);
            %f = [f; mr; mg; mb];
            % fourth central moment
            %[mr mg mb] = fourth_CM(patch);
            %f = [f; mr; mg; mb];
            % generation co-occurence matrix
            %cm = GLCM(patch, 256, 3, 1);
            % entropy
            %e1 = Entropy(patch(:, :, 1));
            %e2 = Entropy(patch(:, :, 2));
            %e3 = Entropy(patch(:, :, 3));
            %f = [f; e1; e2; e3];
            
            % generation co-occurence matrix
            %cm = GLCM(patch, 256, 3, 2);
            % entropy
            %e1 = Entropy(patch(:, :, 1));
            %e2 = Entropy(patch(:, :, 2));
            %e3 = Entropy(patch(:, :, 3));
            %f = [f; e1; e2; e3];
            
            f = double(f);
end