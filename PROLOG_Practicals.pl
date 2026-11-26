
% Practical 1: Family Tree

% Facts
male(john).
male(peter).
male(david).

female(mary).
female(susan).
female(lisa).

parent(john, peter).
parent(mary, peter).
parent(peter, david).
parent(susan, david).
parent(peter, lisa).
parent(susan, lisa).

% Rules
father(X, Y) :-
    male(X),
    parent(X, Y).

mother(X, Y) :-
    female(X),
    parent(X, Y).

child(X, Y) :-
    parent(Y, X).

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Queries and Outputs:

% Query: father(john, peter).
% Output: true.

% Query: mother(mary, peter).
% Output: true.

% Query: child(david, peter).
% Output: true.

% Query: sibling(david, lisa).
% Output: true.

% Query: father(john, david).
% Output: false.


% ==========================================
% PRACTICAL 2: CONCATENATION OF TWO LISTS
% ==========================================

conc([], L, L).

conc([H|T], L2, [H|R]) :-
    conc(T, L2, R).

% Query:
% ?- conc([1,2], [3,4], R).

% Output:
% R = [1,2,3,4].


% ==========================================
% PRACTICAL 3: REVERSE A LIST
% ==========================================

reverse([], []).

reverse([H|T], R) :-
    reverse(T, RT),
    conc(RT, [H], R).

% Query:
% ?- reverse([1,2,3,4], R).

% Output:
% R = [4,3,2,1].


% ==========================================
% PRACTICAL 4: SUM OF TWO NUMBERS
% ==========================================

sum_two(X, Y, S) :-
    S is X + Y.

% Query:
% ?- sum_two(10, 20, S).

% Output:
% S = 30.


% ==========================================
% PRACTICAL 5: MAXIMUM OF TWO NUMBERS
% ==========================================

max(X, Y, X) :-
    X >= Y.

max(X, Y, Y) :-
    Y > X.

% Query:
% max(10, 20, M).

% Output:
% M = 20.


% ==========================================
% PRACTICAL 6: FACTORIAL OF A NUMBER
% ==========================================

factorial(0, 1).

factorial(N, F) :-
    integer(N),
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

% Query:
% factorial(5, F).

% Output:
% F = 120.


% ==========================================
% PRACTICAL 7: FIBONACCI SERIES
% ==========================================

generate_fib(0, 0).

generate_fib(1, 1).

generate_fib(N, T) :-
    integer(N),
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    generate_fib(N1, T1),
    generate_fib(N2, T2),
    T is T1 + T2.

% Query:
% generate_fib(6, T).

% Output:
% T = 8.

% ==========================================
% PRACTICAL 8: POWER OF A NUMBER
% ==========================================

power(_, 0, 1).

power(Num, Pow, Ans) :-
    integer(Pow),
    Pow > 0,
    P1 is Pow - 1,
    power(Num, P1, A1),
    Ans is Num * A1.

% Query:
% power(2, 3, Ans).

% Output:
% Ans = 8.

% ==========================================
% PRACTICAL 9: MULTIPLICATION OF TWO NUMBERS
% ==========================================

multi(N1, N2, R) :-
    R is N1 * N2.

% Query:
% multi(5, 4, R).

% Output:
% R = 20.

% ==========================================
% PRACTICAL 10: MEMBERSHIP IN A LIST
% ==========================================

memb(X, [X|_]).

memb(X, [_|T]) :-
    memb(X, T).

% Query:
% memb(3, [1,2,3,4]).

% Output:
% true.

% ==========================================
% PRACTICAL 11: SUM OF ELEMENTS IN A LIST
% ==========================================

sumlist([], 0).

sumlist([H|T], S) :-
    sumlist(T, S1),
    S is H + S1.

% Query:
% sumlist([1,2,3,4], S).

% Output:
% S = 10.

% ==========================================
% PRACTICAL 12: EVEN AND ODD LENGTH OF LIST
% ==========================================

evenlength([]).

evenlength([_|T]) :-
    oddlength(T).

oddlength([_|T]) :-
    evenlength(T).

% Query:
% evenlength([1,2,3,4]).

% Output:
% true.

% Query:
% oddlength([1,2,3]).

% Output:
% true.

% ==========================================
% PRACTICAL 13: MAXIMUM ELEMENT IN A LIST
% ==========================================

maxlist([X], X).

maxlist([H|T], M) :-
    maxlist(T, M1),
    (H > M1 -> M = H ; M = M1).

% Query:
% maxlist([10,25,5,40,15], M).

% Output:
% M = 40.

% ==========================================
% PRACTICAL 14: INSERT AN ELEMENT INTO A LIST
% ==========================================

insert(I, 1, L, [I|L]).

insert(I, N, [H|T], [H|R]) :-
    integer(N),
    N > 1,
    N1 is N - 1,
    insert(I, N1, T, R).

% Query:
% insert(50, 2, [10,20,30], R).

% Output:
% R = [10,50,20,30].

% ==========================================
% PRACTICAL 15: DELETE AN ELEMENT FROM A LIST
% ==========================================

delete(1, [_|T], T).

delete(N, [H|T], [H|R]) :-
    integer(N),
    N > 1,
    N1 is N - 1,
    delete(N1, T, R).

% Query:
% delete(2, [10,20,30,40], R).

% Output:
% R = [10,30,40].