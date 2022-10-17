function [M] = quarter2_2009(x)
    % Implement the function M = quarter2_2009(x), which for 
    % parameters x reterned by function fit_wages will compute 
    % estimate of average gross wages in the second quarter of 2009.
    % t = year+(quartal-1)/4
    t = 2009+(2-1)/4;
    M = t*x(2) + x(1);
end