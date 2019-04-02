go :-
    write('Enter list :- '),
    read(L),
    write('Enter the element whose all occurance you want to delete :- '),
    read(X),
    delete_all(X, L, Result),
    write(Result).

delete_all(_, [], []) :-
    !.
delete_all(X, [X|T], R) :-
    delete_all(X, T, R).
delete_all(X, [H|T], [H|R1]) :-
    delete_all(X, T, R1).