%%

clear all

data = load('teplota.txt','-ascii');
omega = 2 * pi / 365;


x = fit_temps(data(:, 1), data(:, 2), omega);
figure(1);
plot(data(:, 1), data(:, 2), 'pb');
hold on;
plot(data(:, 1), x(1) + data(:, 1) * x(2) + x(3) * sin(omega * data(:, 1)) + x(4) * cos(omega * data(:, 1)));
hold off;
grid on;


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