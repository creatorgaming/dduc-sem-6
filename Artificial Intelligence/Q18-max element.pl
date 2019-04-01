go :-
    write('Enter List : '),
    read(L),
    write('Maximum element is : '),
    maxList(L, R),
    write(R),
    nl.

maxList([H|[]], H) :- !.
maxList([H1|T1], R) :-
    maxList(T1, R1),
    (H1 > R1,(R is H1);(R is R1)).