function [x] = fit_temps(t, T, omega)
    % Implemen the function x = fit_temps(t, T, omega) where t and T are 
    % vectors of size m with time and temperatures, omega is a scalar 
    % and x is a vector of size 4 with parameters (x1, x2, x3, x4).
    % T(t) = x1 + x2(t) + x3*sin(omaga t) + x4*cos(omega t)
    A = ones(size(T, 1), 4);
    A(:, 2) = t(:);
    A(:, 3) = sin(omega * t(:));
    A(:, 4) = cos(omega * t(:));
    x = A\T;
end