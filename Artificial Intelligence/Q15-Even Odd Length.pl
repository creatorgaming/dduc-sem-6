evenlength(L) :-
    length(L, R),
    X is R mod 2,
    X==0.
oddlength(L) :-
    length(L, R),
    X is R mod 2,
    X\=0.