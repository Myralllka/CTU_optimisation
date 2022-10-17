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