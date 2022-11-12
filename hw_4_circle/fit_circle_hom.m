function [d, e, f] = fit_circle_hom(X)
    % INPUT: 
    % X: n-by-2 vector
    %    with data
    %
    % OUTPUT: 
    % quadric coordinates of the circle
    

    % A = [x^2+y^2 | x | y | 1]
    % ADEF = [A D E F]

    [nrows,ncols]=size(X);

    A = ones(nrows, 4);
    A(:, 1) = X(:,1).*X(:, 1) + X(:,2).*X(:,2);
    A(:, 2) = X(:,1);
    A(:, 3) = X(:,2);

    [U, S, Vt] = svd(A, 0);

    ADEF = Vt(:, 4);
    d = ADEF(2)/ADEF(1);
    e = ADEF(3)/ADEF(1);
    f = ADEF(4)/ADEF(1);
return;
