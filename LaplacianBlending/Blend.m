function [imgBlend] = Blend(lp1, lp2, gpM)
    lpBlend = cell(1, numel(lp1));
    num_levels = numel(lp1);
    
    % blend pyramids
    for i = 1 : num_levels
        lpBlend{i} = (1 - gpM{i}) .* lp1{i} + gpM{i} .* lp2{i}; 
    end
    
    % reconstruct image using blended laplacian pyramid
    imgBlend = LaplacianReconstruct(lpBlend);
end

