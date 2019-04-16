article([the|X], X).
noun([dog|X], X).
noun([cow|X], X).
noun([moon|X], X).
verb([barked|X], X).
preposition([at|X], X).


go :-
    write('Enter Sentence as a list: '),
    read(S),
    nl,
    (   parse(S),
        write('Correct')
    ;   write('Incorrect')
    ),
    nl. 

sentence(A, C) :-
    nounPhrase(A, B),
    verbPhrase(B, C).

nounPhrase(A, C) :-
    article(A, B),
    noun(B, C).

nounPhrase(A, B) :-
    noun(A, B).

verbPhrase(A, B) :-
    verb(A, B).

verbPhrase(A, C) :-
    verb(A, B),
    nounPhrase(B, C).

verbPhrase(A, C) :-
    verb(A, B),
    prepositionPhase(B, C).

prepositionPhase(A, C) :-
    preposition(A, B),
    nounPhrase(B, C).

parse(S) :-
    sentence(S, X),
    X=[].
