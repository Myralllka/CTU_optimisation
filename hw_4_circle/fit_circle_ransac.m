function [x0 y0 r] = fit_circle_ransac(X, num_iter, threshold)
% function [x0 y0 r] = fit_circle_ransac(X, num_iter, threshold)
%
% INPUT: 
% X: n-by-2 vector
%    with data
% num_iter: number of RANSAC iterations
% threshold: maximal  distance of an inlier from the circumference
%
% OUTPUT: 
% cartesian coordinates of the circle
 
  [d e f] = fit_circle_nhom(X);
  [x0 y0 r] = quad_to_center(d, e, f);
end
