function [H] = houghTransform(I, threshold, rhoResolution, thetaResolution)

[m, n] = size(I);

% Calculate scale bins of H for theta and rho
diagonalizeSize = sqrt(m^2+n^2);
rhoScale = 0 : rhoResolution : diagonalizeSize;
thetaScale = 0 : thetaResolution : pi;

% Allocate memory for H
H = zeros(size(thetaScale, 2), size(rhoScale, 2));

% Iterate over image and calculate rho for all theta per pixel
% Perform voting

[X, Y] = find(I >= threshold);
for i = 1 : length(X)
    x = X(i); 
    y = Y(i);
    if (I(x, y) >= threshold)
        for theta_j = 1 : numel(thetaScale)
            theta = thetaScale(theta_j);
            rho = x * cos(theta) + y * sin(theta);
            [~, rho] = min(abs(rhoScale - rho), [], 2);
            H(theta_j, rho) = H(theta_j, rho) + 1;
        end
    end
    
end
