% 2b ii
fibAcc(N, F) :- fibAcc_(N, 0, 1, F).
fibAcc_(0, A, _, A) :- !. % cut prevents infinite loop on forced backtracking
fibAcc_(N, A, B, F) :- NewN is N - 1, Sum is A + B, fibAcc_(NewN, B, Sum, F).
