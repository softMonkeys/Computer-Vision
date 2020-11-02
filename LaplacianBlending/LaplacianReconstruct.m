function [img] = LaplacianReconstruct(lp)
    % reconstruct
    num_levels = numel(lp);
    img = lp{end}; 
    
    for i = num_levels - 1 : -1 : 1
        imgExp = imresize(img, 2);
        img = imgExp + lp{i};
    end
end

