function plottraj2(C)
    % function plottraj2(C)
    %
    % INPUT: 
    % C: 2-by-m matrix
    %    with data
    %

    if (size(C, 1) == 2)
        plot(C(1, :), C(2, :))
    elseif (size(C, 1) == 3)
        plot3(C(1, :), C(2, :), C(3, :))
    else
        return
    end
    