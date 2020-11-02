function cPoly = repositionInsert(cPoly)
    % Select point
    point = ginput(1);
    
    % Calculate midpoints of edges
    midpoints = zeros(size(cPoly, 1) - 1, 2);
    for i = 2:size(cPoly, 1)
       midpoints(i, :) = cPoly(i - 1, :) + 0.5 * (cPoly(i, :) - cPoly(i - 1, :));
    end
    
    % Test if mouse is near CP or edge midpoint
    [minEdge, iEdge] = min(vecnorm(midpoints - point, 2, 2));
    [minCP, iCP] = min(vecnorm(cPoly - point, 2, 2));
    
    % Display
    if (minCP < minEdge)    % Highlight CP
        plot(cPoly(iCP, 1), cPoly(iCP, 2), 'gs', 'MarkerFaceColor', 'g');
    else                    % Highlight Edge
        plot(cPoly(iEdge - 1 : iEdge, 1), cPoly(iEdge - 1 : iEdge, 2), 'g-s', 'MarkerFaceColor', 'g');
    end
    
    % Select new pos
    [x, y] = ginput(1);
    
    if (minCP < minEdge)    % Move Control Point
        cPoly(iCP) = [x, y];
    else                    % Insert new Control Point
        cPoly = [cPoly(1 : iEdge - 1, :); [x ,y]; cPoly(iEdge : end, :)];   % concatenate
    end
    
end