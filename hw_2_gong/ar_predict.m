function [y] = ar_predict(a, y0, N)
% function [y] = ar_predict(a, y0, N)
%
% INPUT:
% a: (p+1)-by-1 vector, estimated parameters of AR model 
%    [ p = length(y0), see below]
% ordering of vector *a* is such that: 
%   a(1) = a_0 [ from Eq. (2) in this Task description ]
%   a(2) = a_1 [ from Eq. (2) in this Task description ]
%   .
%   .
%   a(p+1) = a_p [ from Eq. (2) in this Task description ]
%
% y0: p-by-1 vector, beginning of sequence to be predicted 
%
% N: required length of predicted sequence, including the 
%    beginning represented by y0.
%
% OUTPUT: 
% y: N-by-1 vector, the predicted sequence y.
 
p = length(a) - 1;
 
% computes the rest of elements of y, starting from (p+1)-th
% one up to N-th one. 
%
% discard the code from here and implement the functionality. 
y(1:p) = y0;
for t = 1 : N - p
    fliped_y = flip(y(t:p+t-1));
    y(p + t) = a(1) + a(2 : p + 1).' * fliped_y.';
end
y = y.';



