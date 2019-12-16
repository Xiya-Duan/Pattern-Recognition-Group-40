function [accumulator_array] = myhough(edge_map)
    [rows, cols] = size(edge_map);

    theta_maximum = 90;
    rho_maximum = floor(norm([cols rows])) - 1;
    theta_range = -theta_maximum:theta_maximum - 1;
    rho_range = -rho_maximum :rho_maximum;

    accumulator_array = zeros(length(rho_range), length(theta_range));
    
    for row = 1:rows
        for col = 1:cols
            if edge_map(row, col) > 0
                x = col - 1;
                y = row - 1;
                for theta = theta_range
                    rho = round((x * cosd(theta)) + (y * sind(theta)));                   
                    rho_index = rho + rho_maximum + 1;
                    theta_index = theta + theta_maximum + 1;
                    accumulator_array(rho_index, theta_index) = accumulator_array(rho_index, theta_index) + 1;
                end
            end
        end
    end
end