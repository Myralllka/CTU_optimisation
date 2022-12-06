function x = vyhra(c, k)
    % x = linprog(f,A,b,Aeq,beq,lb,ub)
    % f - Coefficient vector represents the objective function f'*x. 
    % A - Linear inequality constraints, together with b
    % Aeq - Linear equality constraints, together with beq
    % lb - Lower bounds
    f = [0 0 0 0 0 -1];
    A = [   -c(1) -c(2) 0 0 0 1;
            0 -c(2) -c(3) -c(4) 0 1;
            0 0 0 -c(4) -c(5) 1];
    b = [0; 0; 0;];
    Aeq = [ 1 1 1 1 1 0];
    beq = [k];
    lb = [0; 0; 0; 0; 0; -inf];
    % [x,fval,exitflag,output,lambda] = linprog(___)
    x = linprog(f,A,b,Aeq,beq,lb);
    x = x(1:end-1).';
end
