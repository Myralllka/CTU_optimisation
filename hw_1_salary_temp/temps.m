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
