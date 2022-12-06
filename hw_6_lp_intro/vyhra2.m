function x = vyhra2(c, k, m)
    f = [ 0 0 0 -1 ];
    A = [   -c(1) 0 0 1;
            0 -c(2) 0 1;
            0 0 -c(3) 1;
            -1 -1 0 0;
            0 -1 -1 0;
            -1 0 -1 0;
            -1 0 0 0;
            0 -1 0 0;
            0 0 -1 0];
    b = [ 0; 0; 0; -m; -m; -m; -m; -m; -m];
    Aeq = [ 1 1 1 0 ];
    beq = [k];
    lb = [ 0; 0; 0; -inf ];
    % [x,fval,exitflag,output,lambda] = linprog(___)
    x = linprog(f, A, b, Aeq, beq, lb);
    x = x(1:end-1).';
end