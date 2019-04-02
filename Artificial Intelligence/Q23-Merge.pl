go :-
    write('Enter ordered list 1 :- '),
    read(L1),
    write('Enter ordered list 2 :- '),
    read(L2),
    merge(L1, L2, Result),
    write(Result).

merge([], [], []) :-
    !.
merge([H1|T1], [], [H1|R1]) :-
    merge(T1, [], R1).
merge([], [H2|T2], [H2|R1]) :-
    merge([], T2, R1).
merge([H1|T1], [H2|T2], [H1|R1]) :-
    H1<H2,
    merge(T1, [H2|T2], R1).
merge([H1|T1], [H2|T2], [H2|R1]) :-
    H2<H1,
    merge([H1|T1], T2, R1).
merge([H1|T1], [H1|T2], [H1|R1]) :-
    merge(T1, T2, R1).
