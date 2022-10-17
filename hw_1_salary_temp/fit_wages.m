function [x] = fit_wages(t,M)
    % Implemen the function x = fit_wages(t,M) where t and M are 
    % vectors of size m with time ans salaries, and x is a vector 
    % of size 2 with parameters (x1, x2).

    A = t(:, ones(1, size(t, 2) + 1));
    A(:, size(A, 2)) = 1;

    x = A\M;
    x = [x(2), x(1)];
end