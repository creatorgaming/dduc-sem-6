go :-
    write('Enter List 1 : '),
    read(L1),
    write('Sum of List is : '),
    sumlist(L1, R),
    write(R),
    nl.

sumlist([], 0) :-
    !.
sumlist([H1|T1], R) :-
    sumlist(T1, R1),
    R is R1+H1.