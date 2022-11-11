function drawfitline(A)
    % function drawfitline(A)
    %
    % INPUT: 
    % A: m-by-2 matrix
    %    with data

    % The most time-consuming shitty function. about 1h to implement all these lines drawing etc. completely stupid and useless task.
    [U, C, x0] = fitaff(A, 1);
    C = U*C;
    C = C + x0;

    maxx = max(C, [], 2);
    x_max = maxx(1);
    y_max = maxx(2);
    minn = min(C, [], 2);
    x_min = minn(1);
    y_min = minn(2);

    p1 = [x_max; y_max];
    p2 = [x_min; y_min];

    figure(1);

    plot(A(1, :), A(2, :), "rx");
    hold on;
    % plot(C(1, :), C(2, :), "b.");
    for i=1:size(A, 2)
        plot([A(1, i), C(1, i)], [A(2, i), C(2, i)], 'r-')
    end
    plot([p1(1), p2(1)], [p1(2), p2(2)] , 'g-');
    axis equal;
    grid on;

end