function point = deCasteljau(cPoly, t)

    % Init Ps
    nrCPs = size(cPoly, 1);

    % P = (CPs, coordinate, levels)
    P = zeros(nrCPs, 2, nrCPs);
    P(:, :, 1) = cPoly;

    for i = 1 : nrCPs
        for j = 1 : nrCPs - i
            P(j, :, i+1) = t*P(j, :, i) + (1-t)*P(j+1, :, i);
        end
    end

    point = P(1, :, nrCPs);
    % point = P;
    % Iterate over cps and levels

end

