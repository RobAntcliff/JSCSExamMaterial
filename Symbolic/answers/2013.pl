%q1

numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(-X) :- numeral(X).

add(0, X, X).
add(s(X), p(Y), Z) :- add(X, Y, Z).
add(s(X), Y, s(Z)) :- add(X, Y, Z), \+Y = p(_).
add(p(X), Y, p(Z)) :- add(X, Y, Z).

add2(X,-Y,Z) :- minus(Y,A), add2(X,A,Z).
add2(-X, Y, Z) :- minus(X, A), add2(A,Y,Z).
add2(X,Y,Z) :- getS(X, X1), getS(Y, Y1), add(X1, Y1, ZS), getP(X,X2), getP(Y,Y2), add(X2,Y2,ZP), add(ZS, ZP,Z).

getS(0,0).
getS(s(X), s(Y)) :- getS(X, Y).
getS(p(X), Y) :- getS(X, Y).
getS(X+Y, Z) :- getS(X, X1), getS(Y, Y1), add(X1, Y1, Z).

getP(0,0).
getP(p(X), p(Y)) :- getP(X, Y).
getP(s(X), Y) :- getP(X, Y).
getP(X+Y, Z) :- getP(X, X1), getP(Y, Y1), add(X1, Y1, Z).

subtract(X, Y, Z) :- minus(Y, A), add2(X, A, Z).

minus(X,Y) :- add2(X,0,A), negate(A,Y).

negate(0,0).
negate(p(X),s(Y)) :- negate(X,Y).
negate(s(X),p(Y)) :- negate(X,Y).

%q2
%a)
ifThenElse(A,B,C) :- A, !, B ; C.
%b)
no_duplicates([X],[X]).
no_duplicates([H|T1], [H|T2]) :- \+member(H, T1), no_duplicates(T1,T2).
no_duplicates([H|T], L2) :- member(H, T), no_duplicates(T, L2).
%c)
minus(L,[],L).
minus([],_,[]).
minus([H|T], L, [H|T2]) :- \+member(H,L), minus(T,L,T2).
minus([H|T], L, L3) :- member(H,L), minus(T, L, L3).
%d)
%TODO

%q3
%b)
s --> t(a, A), t(b, B), t(c, C), {B is A + C}.
t(_, 0) --> [].
t(E, Count) --> [E], t(E, SubCount), {Count is SubCount + 1}.

%d)
flatten(List,Flattened) :- fl(List,Flattened,[]).

fl([]) --> [].
fl([H|T]) --> fl(H), fl(T).
fl(H) --> [H].
