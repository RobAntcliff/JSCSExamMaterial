% !!! This isn't Gauss Jordan. It's just Gaussian elimination with partial pivoting. !!!
% Here's a link for what's actual being looked for:
% https://people.richland.edu/james/lecture/m116/matrices/pivot.html

% Given a square matrix a of length N and a vector b also of length N
function x = Gauss(a, b)
    len = length(a)

    %%%%%%%%%%%%%%%%%%%%%%%
    % Forward Elimination %
    %%%%%%%%%%%%%%%%%%%%%%%
    
	for i = 1:len % for each row 1 to N
        sub = a([i:end], [i:end]); % consider the sub matrix
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
    % if a is a 3x3 matrix it now looks like:
    % b c d
    % 0 f g
    % 0 0 h

    %%%%%%%%%%%%%%%%%%%%%
    % Back Substitution %
    %%%%%%%%%%%%%%%%%%%%%

    % now can calculate x(3) since it only has one unknown.
    % then x(2) since we know x(3).
    % then (x1) since we know x(2) and x(3).
    elems = 0
    for i = len:-1:1 % starting at bottom row
        start = (len - elems) % position of first non-zero in row
        sum = b(i) 
        for j = (start + 1):len
            sum = sum -(a(i, j) * x(j))
        end
        x(i) = sum / a(i, start)
        elems = elems + 1;
    end
end
