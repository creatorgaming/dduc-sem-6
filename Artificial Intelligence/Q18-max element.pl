go :-
    write('Enter List : '),
    read(L),
    write('Maximum element is : '),
    maxList(L, R),
    write(R),
    nl.

maxList([], R) :-
    !.
maxList([H1|T1], R) :-
    maxList(T1, R1).