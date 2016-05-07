function x = GaussJordan(a, b)
    len = length(a)
	% forward elimation
	for i = 1:len
        sub = a([i:end], [i:end]); % sub matrix
        [pivot p_row] = max(sub(:, 1)); % pivot index in sub matrix
        p_row = p_row + i - 1; % pivot index in full matrix
        a([i p_row], :) = a([p_row i], :); % swap rows of a
        b([i p_row]) = b([p_row i]); % swap rows of b
        for j = (i+1):len % for rows below i
            times =  a(j, i) / a(i, i); % multiplier for row
            a(j, :) = a(j, :) - a(i, :) * times; % mul row in a
            b(j) = b(j) - b(i) * times; % mul row in b
        end
    end
    % back substitution
    elems = 0 % last row has 1 elem, next has 2 ...
    for i = len:-1:1 % starting at bottom row
        start = (len - elems) % position of first non-zero in row of a
        sum = b(i) 
        for j = (start + 1):len
            sum = sum -(a(i, j) * x(j))
        end
        x(i) = sum / a(i, start)
        elems = elems + 1;
    end
end
