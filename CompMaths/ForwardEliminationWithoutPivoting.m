function ab = ForwardEliminationWithoutPivoting(a, b)
    len = length(a)
    % for each row
    for i = 1:len
        % for each row below
        for j = (i+1):len
            row_mult = a(j, i) / a(i, i)
            a(j, :) = a(j, :) - (a(i, :) * row_mult)
            b(j) = b(j) - (b(i) * row_mult)
        end
    end
    ab = [a, b]
end
