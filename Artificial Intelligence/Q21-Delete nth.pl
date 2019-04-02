go :-
    write('Enter list :- '),
    read(L),
    write('Enter position where you want to delete element :- '),
    read(N),
    delete_nth(N, L, Result),
    write(Result).

delete_nth(_, [], _) :-
    !. 
delete_nth(N, L, _) :-
    length(L, X),
    X<N,
    fail.
delete_nth(1, [_|T], T).
delete_nth(N, [H|T], [H|R1]) :-
    N>0,
    N1 is N-1,
    delete_nth(N1, T, R1).