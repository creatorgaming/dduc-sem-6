reversal([], []) :-
    !.
reversal([X], [X]) :-
    !.
reversal([H|T], L) :-
    reversal(T, R),
    append(R, [H], L).

go :-
    write('Enter List to check pallindrome : '),
    read(L),
    pallindrome(L).

pallindrome(L1) :-
    reversal(L1, L1).