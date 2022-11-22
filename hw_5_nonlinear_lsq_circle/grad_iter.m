function [x, y, r] = grad_iter(X, x0, y0, r0, a)
    % [x y r] = grad_iter(X, x0, y0, r0, a)
    %
    % makes the gradient method iteration. 
    %
    % INPUT: 
    % X: n-by-2 matrix
    %    with data
    % x0, y0 are the coordinates of the circle center.
    % r0 is the circle radius
    % a is the stepsize
    %
    % OUTPUT: 
    % coordinates and radius after one step of gradient method.

    [dxg, dyg, drg] = grad_dist(X, x0, y0, r0);
    x = x0 - a*dxg;
    y = y0 - a*dyg;
    r = r0 - a*drg;

end

function [dx0, dy0, dr] = grad(x, x0, y, y0, r)
    dx0 = ((2*x - 2*x0)*(r - ((x - x0)^2 + (y - y0)^2)^(1/2)))/((x - x0)^2 + (y - y0)^2)^(1/2);
    dy0 = ((r - ((x - x0)^2 + (y - y0)^2)^(1/2))*(2*y - 2*y0))/((x - x0)^2 + (y - y0)^2)^(1/2);
    dr = 2*r - 2*((x - x0)^2 + (y - y0)^2)^(1/2);
end

function [dX0, dY0, dR] = grad_dist(X, x0, y0, r)
    dX0 = 0;
    dY0 = 0;
    dR = 0;
    for i=1:length(X)
        [dxx, dyy, drr] = grad(X(i, 1), x0, X(i, 2), y0, r);
        dX0 = dX0 + dxx;
        dY0 = dY0 + dyy;
        dR = dR + drr;
    end
end