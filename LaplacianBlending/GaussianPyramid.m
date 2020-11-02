function gp = GaussianPyramid(img, num_levels)
    gp = cell(1,num_levels);
    % cell array: gp{i} = ...
    % build gaussian kernel using fspecial
    gauss = fspecial('gaussian');
    
    % construct gaussian pyramid, use imfilter and imresize
    gp{1} = img;
    for i = 2 : num_levels 
        imgG = imfilter(gp{i - 1}, gauss);
        imgS = imresize(imgG, 0.5);
        gp{i} = imgS;
    end
end

