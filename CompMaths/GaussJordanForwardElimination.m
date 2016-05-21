function ab = GaussJordanForwardElimination(a, b)
    len = length(a)
    % for each row
    for i = 1:len
        % pivot
        [m max_index] = max(a([i:end], i))
        max_index = max_index + i - 1
        a([i max_index], :) = a([max_index i], :)
        b([i max_index]) = b([max_index i])
        % eliminate
        for j = 1:len
            if (j ~= i)
                row_mult = a(j, i) / a(i, i)
                a(j, :) = a(j, :) - (row * row_mult)
                b(j) = b(j) - (b(i) * row_mult)
            end
        end
        % normalize
        a(i, :) = a(i, :) / a(i, i)
        b(i) = b(i) / a(i, i)
    end
    ab = [a, b]
end
