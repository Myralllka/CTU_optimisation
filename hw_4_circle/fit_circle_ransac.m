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

    [N, ~] = size(X);
    n_best = 0;
    x0_best = 0;
    y0_best = 0; 
    r_best = 0; 

    for i = 1:num_iter
        rand_coors = randperm(N, 3);
        X_current = X(rand_coors, :);
        [d, e, f] = fit_circle_nhom(X_current);
        [x0, y0, r] = quad_to_center(d,e,f);
		n = sum(abs(dist(X, x0, y0, r))<threshold);
		if n > n_best
            n_best = n;
			x0_best = x0;
			y0_best = y0;
			r_best = r;
		end
    end
	x0 = x0_best;
	y0 = y0_best;
	r = r_best;
end
