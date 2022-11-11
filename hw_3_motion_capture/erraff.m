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
    A = A - b0;
    [U, ~] = eig(A*A.');
    d = zeros(size(U, 1), 1);
    size(d)
    for k = 1:size(U, 1)
        U_k = U(:, end-k+1:end);
        C_k = U_k * U_k.' * A;
        C_k = C_k - A;
        d(k) = sum(sum(C_k .* C_k));
    end
    disp(d(end))
end



