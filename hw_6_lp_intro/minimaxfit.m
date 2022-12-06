function [a,b,r]=minimaxfit(x, y)
    
    A1 = [x.',ones(length(y),1),-ones(length(y),1)];
    A2 = [-x.',-ones(length(y),1),-ones(length(y),1)];

    A = [A1; A2];
    b = [y.';-y.'];
    f = [zeros(1, length(x(:, 1))) 0 1];
    % lb = [-inf -inf 0];

    res = linprog(f, A, b);

    a = res(1:end-2);
    b = res(end-1);
    r = res(end);
end