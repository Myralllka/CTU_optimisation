function [x y r] = GN_iter(X, x0, y0, r0)
    % [x y r] = GN_iter(X, x0, y0, r0)
    %
    % makes the Gauss-Newton iteration. 
    %
    % INPUT: 
    % X: n-by-2 matrix
    %    with data
    % x0, y0 are the coordinates of the circle center.
    % r0 is the circle radius
    %
    % OUTPUT: 
    % coordinates and radius after one step of GN method.

    gx = dist(X, x0, y0, r0);
    
    gx_d_p = grad_dist(X, x0, y0, r0);
    gx_d_p = pinv(gx_d_p);
    
    v = gx_d_p * gx.';

    x = x0 - v(1);
    y = y0 - v(2);
    r = r0 - v(3);
end

function [dx0, dy0, dr] = grad(x, x0, y, y0, r)
    dx0 = -(2*x - 2*x0)/(2*((x - x0)^2 + (y - y0)^2)^(1/2));
    dy0 = -(2*y - 2*y0)/(2*((x - x0)^2 + (y - y0)^2)^(1/2));
    dr = -1;
end

function [res] = grad_dist(X, x0, y0, r)
    res = [];
    for i=1:length(X)
        [res(i, 1), res(i, 2), res(i, 3)]  =  grad(X(i, 1), x0, X(i, 2), y0, r);
    end
end
 
