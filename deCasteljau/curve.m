clear all;
close all;

% Init control polygon
fig = figure;
axis([0 1 0 1]);
[x, y] = getpts();      % matlab helper function let user click anywhere on the figure
cPoly = [x y];      % save it to the control polygon

% Plot control polygon
plot(cPoly(:,1), cPoly(:,2),'b-s');
hold on;

while true
    % Allocate memory
    stepSize = 0.01;
    controlPoints = zeros(round(1 / stepSize) + 1, 2);

    % Iterate over curve and apply deCasteljau
    for i = 0 : stepSize : 1
        controlPoints(round(i*(1/stepSize)) + 1, :) = deCasteljau(cPoly, i);
    end

    % Plot curve
    axis([0 1 0 1]);
    %plot
    plot(controlPoints(:, 1), controlPoints(:, 2), 'r', 'LineWidth', 3);
    
    %% reposition
    % --> Select CP and reposition (modify the cPoly)
    % cPoly = reposition(cPoly);
    cPoly = repositionInsert(cPoly);
    clf(fig);       % clearing the figure
    plot(cPoly(:, 1), cPoly(:, 2), 'b-s', 'MarkerFaceColor', 'b');
    hold on;        % we want to hold on to the previous figure
    
end