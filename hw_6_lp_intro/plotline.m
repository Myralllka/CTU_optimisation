function plotline(x, y, a, b, r)
    
    scatter(x, y)
    
    figure(1);
    hold on;

    x = linspace(-10,10, 1000); % Adapt n for resolution of graph
    y = a*x + b;
    plot(x, y, color='b');
    y = a*x + b + a*r;
    plot(x, y, color='g');
    y = a*x + b - a*r;
    plot(x, y, color='g');

    axis equal;
    grid on;

    axis tight equal;
end