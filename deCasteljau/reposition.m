function cPoly = reposition(cPoly)

    % Select point
    point = ginput(1);
    
    % first param returns minimum value, second param returns the row for min
    [~, i] = min(vecnorm(cPoly - point, 2, 2));     % [~, i]: ~ is the minimum normal vector, i is the row indicating where the min vector normal is located
    
    plot(cPoly(i, 1), cPoly(i, 2), 'gs', 'MarkerFaceColor', 'g');
    
    % Select new pos
    newPoint = ginput(1);
    cPoly(i, :) = newPoint;
end

