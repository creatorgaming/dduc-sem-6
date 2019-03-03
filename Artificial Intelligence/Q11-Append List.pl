go :-
    write('Enter List 1 : '),
    read(L1),
    write('Enter List 2 : '),
    read(L2),
    write('Appended List is : '),
    conc(L1, L2, R),
    write(R),
    nl.

conc([], [], []) :-
    !.
conc([], [H2|T2], [H2|X]) :-
    conc([], T2, X).
conc([H1|T1], L2, [H1|X]) :-
    conc(T1, L2, X).