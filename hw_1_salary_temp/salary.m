%%

clear all

data = load('mzdy.txt','-ascii');

x = fit_wages(data(:, 1), data(:, 2));

figure(1);
plot(data(:, 1), data(:, 2), 'pb');
hold on;
plot(data(:, 1), data(:, 1)*x(2) + x(1), '-r');
hold off;

hold on;
plot(2009+(2-1)/4, quarter2_2009(x), 'pr');
hold off;
grid on;


function [x] = fit_wages(t,M)
    % Implemen the function x = fit_wages(t,M) where t and M are 
    % vectors of size m with time ans salaries, and x is a vector 
    % of size 2 with parameters (x1, x2).

    A = t(:, ones(1, size(t, 2) + 1));
    A(:, size(A, 2)) = 1;

    x = A\M;
    x = [x(2), x(1)];
end

function [M] = quarter2_2009(x)
    % Implement the function M = quarter2_2009(x), which for 
    % parameters x reterned by function fit_wages will compute 
    % estimate of average gross wages in the second quarter of 2009.
    % t = year+(quartal-1)/4
    t = 2009+(2-1)/4;
    M = t*x(2) + x(1);
end