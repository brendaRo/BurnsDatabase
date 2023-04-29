function f = feature_extraction_2(i, j, h, A)

            [r c p] = size(A);
            
            i = uint16(i);
            j = uint16(j);

            % pixel position
            f = [i; j];
            % color channels
            f = [f; A(i, j, 1); A(i, j, 2); A(i, j, 3)];
            
            % patch extraction
            patch = A(i - h : i + h, j - h : j + h, :);
            patch = double(patch);
            
            % linear combination of RGB channels
            I = 0.21 * A(:, :, 1) + 0.72 * A(:, :, 2) + 0.07 * A(:, :, 3);
            f = [f; I(i, j)];
            
            % mean values
            [mr mg mb] = mean_patch(patch);
            f = [f; mr; mg; mb];
            % second central moment
            [mr mg mb] = second_CM(patch);
            f = [f; mr; mg; mb];
            % third central moment
            %[mr mg mb] = third_CM(patch);
            %f = [f; mr; mg; mb];
            % fourth central moment
            %[mr mg mb] = fourth_CM(patch);
            %f = [f; mr; mg; mb];

            % entropy
            cm = GLCM(patch, 256, 1, 5);
            e1 = Entropy(cm);
            cm = GLCM(patch, 256, 2, 5);
            e2 = Entropy(cm);
            cm = GLCM(patch, 256, 3, 5);
            e3 = Entropy(cm);
            f = [f; e1; e2; e3];
            
            f = double(f);
end