function [d, e, f] = fit_circle_nhom(X)
    %
    % INPUT: 
    % X: n-by-2 vector
    %    with data
    %
    %
    % OUTPUT: 
    % quadric coordinates of the circle

    [nrows,ncols]=size(X);

    A = ones(nrows,3);

    A(:, 1) = X(:,1);
    A(:, 2) = X(:,2);

    B = -(X(:,1).*X(:, 1) + X(:,2).*X(:,2));

    DEF = inv(A.'*A)*A.' * B;

    d = DEF(1);
    e = DEF(2);
    f = DEF(3);
end
