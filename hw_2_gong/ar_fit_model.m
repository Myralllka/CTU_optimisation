function [a] = ar_fit_model(y, p)
    % function [a] = ar_fit_model(y,p)
    %
    % INPUT:
    % y : N-by-1 vector, sound signal
    %
    % p : required order of AR model
    %
    % OUTPUT:
    % a: (p+1)-by-1 vector, estimated parameters of AR model 
    % 
    % ordering of vector *a* is such that: 
    %   a(1) = a_0 [ from Eq. (2) in this Task description ]
    %   a(2) = a_1 [ from Eq. (2) in this Task description ]
    %   .
    %   .
    %   a(p+1) = a_p [ from Eq. (2) in this Task description ]
    %
    % M, b: matrix and vector as in the Task description, 
    %       M*a = b (in LSQ sense) 
    y = y.';
    N = length(y);
    M = ones(N - p, p + 1);
    for n = 1 : N - p
        M(n, 2 : p + 1) = flip(y(n:n + p - 1));
    end
    b = y(p + 1 : N).';
    a = M\b;
end
