function [lp] = LaplacianPyramid(gp)
    num_levels = numel(gp);
    lp = cell(1,num_levels);
    % cell array: lp{i} = ...
    gauss = fspecial('gaussian');

    % construct laplacian pyramid
    lp{end} = gp{end};
    for i = num_levels - 1 : -1 : 1
        imgG = imfilter(gp{i + 1}, gauss);
        imgS = imresize(imgG, 2);
        lp{i} = gp{i} - imgS; 
    end
    
end

