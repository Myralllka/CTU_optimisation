x = [1 2 3 3 2 ; 4 1 2 5 6; 7 8 9 -5 7];
y = [7 4 1 2 5];
% x = [2 4 5];
% y = [2 4 6];
[a, b, r] = minimaxfit(x, y)
 
plotline(x, y, a, b, r);
% a = [-2.776 0.194 -0.030]
% b = 9.403
% r = 0.194>