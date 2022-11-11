function d = erraff(A)
    % function d = erraff(A)
    %
    % INPUT: 
    % A: m-by-n matrix
    %    with data
    %
    % OUTPUT:
    % d: m-by-1 matrix
    %
    b0 = sum(A, 2) / size(A, 2);
    [U, ~] = eig(A*A' - b0);
    d = zeros(size(U, 1), 1);
    size(d)
    for k = 1:size(U, 1) - 1
        U_k = U(:, end-k+1:end);
        C_k = U_k * U_k.' * A + b0;
        d(k) = sum(vecnorm(C_k - A));
    end

end



