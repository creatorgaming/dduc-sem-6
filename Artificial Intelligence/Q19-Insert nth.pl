go :-
    write('Enter list :- '),
    read(L),
    write('Enter position where you want to enter element :- '),
    read(N),
    write('Enter element you want to enter :- '),
    read(I),
    insert_nth(I, N, L, Result),
    write(Result).

insert_nth(_, _, [], _) :-
    !. 
insert_nth(_, N, L, _) :-
    length(L, X),
    X<N,
    fail.
insert_nth(I, 1, T, [I|T]).
insert_nth(I, N, [H|T], [H|R1]) :-
    N>0,
    N1 is N-1,
    % add(R, H, R1),
    insert_nth(I, N1, T, R1).

% add([], E, [E]) :-
%     !.
% add([H|T], E, R) :-
%     add(T, E, R1),
%     append([H], R1, R).