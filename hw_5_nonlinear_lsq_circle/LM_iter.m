function [x y r success] = LM_iter(X, x0, y0, r0, mu)
    % [x y r success] = LM_iter(X, x0, y0, r0, mu)
    %
    % makes the Levenberg-Marquardt iteration. 
    %
    % INPUT: 
    % X: n-by-2 matrix
    %    with data
    % x0, y0 are the coordinates of the circle center.
    % r0 is the circle radius
    % mu is the damping factor (the factor which multiplies the
    % regularizing identity matrix)

    % OUTPUT: 
    % success == 1 if the iteration is successful, i.e. 
    % value of criterion f is decreased after the update 
    % of x. 
    % success == 0 in the oposite case. 
    %
    % x,y,r are updated parameters if success == 1. 
    % x,y,r = x0,y0,r0 if success == 0.
    
    gx = dist(X, x0, y0, r0);
    
    gx_d = grad_dist(X, x0, y0, r0);
    
    gx_d_p = inv(gx_d.' * gx_d + eye(3) * mu) * gx_d.';

    v = gx_d_p * gx.';
    x = x0 - v(1);
    y = y0 - v(2);
    r = r0 - v(3);

    f_new = sum((dist(X, x, y, r)).^2);

    if f_new <= sum(gx.^2)
        success = 1;
    else
        success = 0;
    end

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
 
