%CS3011 Exam Paper Solutions 2014
%Q1
%b) listSum(+List, ?Sum)
listSum(L,S) :- accLSum(L,0,S).
accLSum([],S,S).
accLSum([H|T],Acc,S) :- NewA is Acc+H, accLSum(T,NewA,S).
%c) listProd(+List, ?Prod)
listProd(L,S) :- accLProd(L,1,S).
accLProd([],S,S).
accLProd([H|T],A,S) :- NewA is A*H, accLProd(T,NewA,S).
%d) list2N(+Int, ?List)
list2N(0,[]).
list2N(X,[X|T]) :- NX is X-1, NX >= 0, list2N(NX, T).
%e) nonInc(+List)
nonInc([_]).
nonInc([H,H2|T]) :- H>=H2, nonInc([H2|T]).
%f) sumList(+Sum, ?List)
sumList(0,[]).
sumList(N, [X|L]) :- list2N(N, List), member(X, List), Nnew is N-X, sumList(Nnew, L), nonInc([X|L]).

%Q2
%a) 
subset([],_).
subset([H|T], L) :- member(H, L), subset(T,L).
%b)
setEq(L1, L2) :- subset(L1,L2), subset(L2,L1).
%c)
setEq2(L1,L2) :- setof(C, member(C, L1),S), setof(B, member(B,L2),S).
%d)
nonmember(X,L) :- \+member(X,L).
%e) setInt(List1,List2,ListBoth)
setInt(L1,L2,LB) :- append(L1,L2,L3), subset(LB, L3).
%f)
% TO DO
%g)
% TO DO
%h) maxHead(+List1, ?List2)
max(X, [X]).
max(H, [H|T]) :- max(M, T), H >= M.
max(M, [H|T]) :- max(M, T), H < M.

remMax(H, [H|T], T).
remMax(X, [H|T], [H|T2]) :- remMax(X, T, T2).

maxHead(L1, [H|T]) :- max(H, L1), remMax(H, L1, T).

%Q3
%a) 
s --> zeros(N), ones(M), twos(O), {O is N+M}.

zeros(0) --> [].
zeros(N) --> [0], zeros(N0), {N is N0+1}.

ones(0) --> [].
ones(N) --> [1], ones(N0), {N is N0+1}.

twos(0) --> [].
twos(N) --> [2], twos(N0), {N is N0+1}.
%b)
% TO DO

%d) s --> [0], s, [2].
s1(A, D) :- A=[0|B], s1(B, C), C=[2|D].
%e) 
sw --> w(A), w(A), w(B), {rev(A, [], B)}.

w([]) --> [].
w([0|T]) --> [0], w(T).
w([1|T]) --> [1], w(T).

rev([], A, A).
rev([H|T], A, R) :- rev(T, [H|A], R).