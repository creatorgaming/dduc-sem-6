go :-
    write('Enter List : '),
    read(L),
    write('List without duplicates is : '),
    rem_dup(L, R),
    write(R),
    nl.

rem_dup([], []) :- !.
rem_dup([H|T],R) :- rem_dup(T,R1),
                    not(member([H],R1)),
                    append(R1,[H],R).
                    