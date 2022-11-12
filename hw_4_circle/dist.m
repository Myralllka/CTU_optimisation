function d = dist(X,x0,y0,r)
    % function d = dist(X,x0,y0,r)
    %
    % INPUT: 
    % X: n-by-2 vector
    %    with data
    % x0, y0 are the coordinates of the circle center.
    % r is the circle radius
    %
    % OUTPUT: 
    % d: 1-by-N vector of *signed* distances of all points 
    %    from the circumference. 
    
    [N ~] = size(X);
    X = X - [x0, y0];
    d = (sqrt(sum(X.*X, 2)) - r).';
end
